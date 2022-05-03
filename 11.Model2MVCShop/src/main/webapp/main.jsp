<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Song+Myung&display=swap" rel="stylesheet">
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
            
            font-family: 'Song Myung', serif;
        }
   	</style>
   	
   <script type="text/javascript">	
   
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='##' ]").on("click" , function() {


			
			self.location = "/product/youtube.jsp"
		});
	});	
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='###' ]").on("click" , function() {


			
			self.location = "/product/youtube2.jsp"
		});
	});	
   
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='####' ]").on("click" , function() {


			
			self.location = "/product/youtube3.jsp"
		});
	});	
   
   
   
   	
   	
   </script>	  <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	        <ol class="carousel-indicators">
	          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	        </ol>
	        
	        <div class="carousel-inner" role="listbox">
	          
	          <div class="item active">
	            <img src="/images/16.JPG"  width="100%" height="100%" alt="First slide">
	          </div>
	          
	          <div class="item">
	            <img src="/images/17.JPG"  width="100%" height="100%"alt="Second slide">
	          </div>
	          
	          <div class="item">
	            <img src="/images/18.JPG"  width="100%" height="100%" alt="Third slide">
	          </div>
	     
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	          <span class="sr-only">Previous</span>
	        </a>
	        
	        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	          <span class="sr-only">Next</span>
	        </a>
	     </div>
	     
	     <div class="container">
	     
	     <h2 align="center">Best Music</h2>
	     
	     
	     </div>
	     
	</div>
	
	
	
	<div class="row">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="/images/19.png" alt="...">
      <div class="caption">
        <h3>LILAC</h3>
        <p></p>
        <p><a  href="##" class="btn btn-primary" role="button">듣기</a> </p>
      </div>
    </div>
    
  </div>
  <div class="col-sm-9 col-md-5">
    <div class="thumbnail">
      <img src="/images/24.jpg" alt="...">
      <div class="caption">
        <h3>꽃갈피 하나</h3>
        <p></p>
        <p><a href="###" class="btn btn-primary" role="button">듣기</a></p>
      </div>
    </div>
    
  </div>
  <div class="col-sm-5 col-md-3">
    <div class="thumbnail">
      <img src="/images/22.jpg" alt="...">
      <div class="caption">
        <h3>Love poem</h3>
        <p></p>
        <p><a href="####" class="btn btn-primary" role="button">듣기</a></p>
      </div>
    </div>
    
  </div>
</div>



	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->


</body>

</html>