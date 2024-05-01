<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <script type="text/javascript">
    
	    $(function() {
				$( "#accept" ).on("click" , function() {
				self.location ="/product/listProduct?menu=manage";
				});
				$( "#registerButton" ).on("click" , function() {
					self.location ="../product/addProductView.jsp";
					});
				
			});	
    
    </script>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

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
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" readonly="readonly">
		    </div>
		  </div>

	  	<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		        <input type="text" class="form-control" id="prodDetail" name="prodDetail" 
		               value="${product.prodDetail}" readonly="readonly">
		    </div>
		</div>

	  	<div class="form-group">
	    	<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
	    	        <div class="input-group">
		        		<input type="text" class="form-control" id="manuDate" name="manuDate"	value="${product.manuDate}"  readonly="readonly">
   	      		 </div>
		    </div>
		</div>
		
	  	<div class="form-group">
	    	<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		        <input type="text" class="form-control" id="price" name="price"
		               value="${product.price}" readonly="readonly">
	   		</div>
	   	 </div>
	   	 
 		   <div class="form-group">
	    	<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		        <input type="text" class="form-control" id="fileName" name="fileName"
		               value="${product.fileName}" readonly="readonly">
		    </div>
		  </div>


		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="accept">확&nbsp;인</button>
			  <button type="button" class="btn btn-primary" id="registerButton">추가등록</button>
		    </div>
		</div>
		
</body>
</html>