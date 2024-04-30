<!-- 상품 등록 상품 정보 수정 복붙-->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<title>상품등록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
<!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>

<script type="text/javascript">

	function fncAddProduct() {
		
		var name =$("#prodName").val();
		var detail = $("#prodDetail").val();
		var manuDate = $("#manuDate").val();
		var price = $("#price").val();
		
		if(name == null || name.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		
		$("form").attr("method","POST").attr("action","/product/addProduct").submit();
	}
	
	$(function(){
		
		$("button.btn.btn-primary").on("click", function(){
			console.log("등록 됨")
			fncAddProduct();
		});
		
        $(".btn.btn-primary[href='#']").on("click", function() {
			history.go(-1);
		});
		
		$("#calendar").on("click",function(){
            show_calendar('document.forms[0].manuDate', document.forms[0].manuDate.value);
		});
	});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
   	<div class="page-header text-center">
	       <h3 class=" text-info">상품등록</h3>
    </div>
   	
   	<form class="form-horizontal">
   		
   		 <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${prodName}" >
		    </div>
		  </div>
		  
	  	<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		        <input type="text" class="form-control" id="prodDetail" name="prodDetail"
		               value="${prodDetail}">
		    </div>
		</div>
   		
	  	<div class="form-group">
	    	<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		        <input type="text" class="form-control" id="manuDate" name="manuDate"
		               value="${manuDate}"  readonly="readonly">
               <img id ="calendar" src="../images/ct_icon_date.gif" width="15" height="15" />
		    </div>
		</div>
		
	  	<div class="form-group">
	    	<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		        <input type="text" class="form-control" id="price" name="price"
		               value="${price}" >
	   		</div>
	   	 </div>
			   
		   <div class="form-group">
	    	<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		        <input type="text" class="form-control" id="fileName" name="fileName"
		               value="${fileName}" >
		    </div>
		    
		    <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등&nbsp;록</button>
		       <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		</div>
		
   	</form>
	
</body>
</html>