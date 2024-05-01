package com.model2.mvc.web.product;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController{

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
		//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
		@Value("#{commonProperties['pageUnit']}")
		//@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		//@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		@Value("#{commonProperties['path']}")
		String path;

	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/product/addProductView GET");
		
		return "forward:/product/addProductView.jsp";
	}	
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product, MultipartHttpServletRequest request) throws Exception {
		System.out.println("/product/addProduct. POST");
		
//		String uploadFolder ="C:\\Users\\Gram17\\git\\11MVC\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles\\";
		List<MultipartFile> fileList = request.getFiles("uploadFile");
		String fileName = "";
		
		for(MultipartFile mf : fileList) {
			fileName += mf.getOriginalFilename()+"/";
			String saveFile = path+mf.getOriginalFilename();
			mf.transferTo(new File(saveFile));
		}
		
		product.setFileName(fileName);
		productService.addProduct(product);
		
		return new ModelAndView("forward:/product/addProduct.jsp","product",product);
	}
	
	@RequestMapping( value="getProduct", method=RequestMethod.GET )
	public ModelAndView getProduct( @RequestParam("prodNo") int prodNo , Model model, 
														@RequestParam("menu")String menu) throws Exception {
		
		System.out.println("/getProduct.do");
		//Business Logic
		ModelAndView modelAndView = new ModelAndView();
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		model.addAttribute("menu",menu);
		
		if(menu.equals("manage")) {
			modelAndView.setViewName("forward:/product/updateProductView.jsp");
		}else {
			modelAndView.setViewName("forward:/product/getProduct.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping( value="updateProduct", method=RequestMethod.GET )
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/updateProductView.jsp";
	}

	@RequestMapping( value="updateProduct", method=RequestMethod.POST )
	public String updateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{

		System.out.println("/product/updateProduct : POST");
		//Business Logic
		productService.updateProduct(product);
		
		product = productService.getProduct(product.getProdNo());
		model.addAttribute("product", product);
		
		return "forward:/product/getProduct?prodNo="+product.getProdNo();
	}
	
	@RequestMapping(value = "listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model ,String menu, HttpServletRequest request) throws Exception{
		
		System.out.println("/product/product/listProduct : GET/POST");
	
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("menu", menu);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
	
}