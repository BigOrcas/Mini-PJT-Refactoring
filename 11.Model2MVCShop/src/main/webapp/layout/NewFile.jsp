<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
        .jaewoong th{
         text-align:center;
        }
    </style>
	<script type="text/javascript">
		function fncGetList(currentPage) {
			console.log(currentPage);
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/purchase/listSales").submit();
		}
		
		
		
		 $(function() {
			 
			 
			 $( "#sorting" ).on("click" , function() {
					console.log('조회');
						fncGetList(1);
				});
				 
			 /*
			$( "td.prodNum" ).on("click" , function() {
				console.log('상세보기');
				var message1 = $(this).attr("value1");
				console.log(message1);
				var message2 = $(this).attr("value2");
				console.log(message2);
					self.location ="/product/getProduct?prodNo="+message1+"&menu="+message2;
			});
			//*/
			$( "td.divy" ).on("click" , function() {
				console.log('배송하기');
				var message1 = $(this).attr("value1");
				console.log(message1);
				var message2 = $(this).attr("value2");
				console.log(message2);
				
				self.location ="/purchase/updateTranCode?tranNo="+message1+"&tranCode="+message2;
			});
			///*
			$( "td.user" ).on("click" , function() {
				console.log('유저정보');
				var message = $(this).attr("value");
				console.log(message);
				
				self.location ="/user/getUser?userId="+message;
			});
			//*/
			$( "td.prodNum" ).css("color" , "#f08080");
			$( "td.divy" ).css("color" , "#ffb6c1");
			$( "td.user" ).css("color" , "#708090");
			
			///*
			$( "td.prodNum" ).on("click" , function() {
		         console.log($(this).attr("value1"));
		         
		         var prodNo =$(this).attr("value1");
		         $.ajax( 
		               {
		                  url : "/product/json/getProduct/"+prodNo ,
		                  method : "GET" ,
		                  dataType : "json" ,
		                  headers : {
		                     "Accept" : "application/json",
		                     "Content-Type" : "application/json"
		                  },
		                  success : function(JSONData , status) {
		                	  
		                     var displayValue = "<table class='display' width='500' height='180'>"
				            					  +"<tr>"
				             					  +"<td>&emsp;"
				             					  +"<img src='/images/uploadFiles/"+JSONData.fileName+"' width='125' height='125' />"
				                                  +"</td>"
				                                  +"<td>"
				                                  +"<h5>&emsp;"
				                                  +"상품번호	: "+JSONData.prodNo+"<br/><br/>&emsp;"
				                                  +"상품명	: "+JSONData.prodName+"<br/><br/>&emsp;"
				                                  +"상세정보	: "+JSONData.prodDetail+"<br/><br/>&emsp;"
				                                  +"제조일자 	: "+JSONData.manuDate
				                                  +"</h5>"
				                                  +"</td>"
				                                  +"</tr>"	                                          
				                                  +"</table>";
		                                          
		                     //Debug...                           
		                     //alert(displayValue);
		                     $("table.display").remove();
		                     $( "#"+prodNo+"" ).html(displayValue);
		                  }
		            });
	  			 });
				//*/
				
				/*
			$( "td.user" ).on("click" , function() {
		         console.log($(this).attr("value"));
		         
		         var userId =$(this).attr("value");
		         $.ajax( 
		               {
		                  url : "/user/json/getUser/"+userId ,
		                  method : "GET" ,
		                  dataType : "json" ,
		                  headers : {
		                     "Accept" : "application/json",
		                     "Content-Type" : "application/json"
		                  },
		                  success : function(JSONData , status) {
		                	  
		                     var displayValue = "<table class='display' height='180'>"
				            					  +"<tr>"
				                                  +"<td>"
				                                  +"<h4>&emsp;"
				                                  +"아이디 : "+JSONData.userId+"<br/><br/>&emsp;"
												  +"이  름 : "+JSONData.userName+"<br/><br/>&emsp;"
												  +"이메일 : "+JSONData.email+"<br/><br/>&emsp;"
												  +"ROLE : "+JSONData.role+"<br/><br/>&emsp;"
												  +"등록일 : "+JSONData.regDateString
				                                  +"</h4>"
				                                  +"</td>"
				                                  +"</tr>"	                                          
				                                  +"</table>";
		                                          
		                     //Debug...                           
		                     //alert(displayValue);
		                     $("table.display").remove();
		                     $( "#"+userId+"" ).html(displayValue);
		                  }
		            });
	  			 });
				//*/
			
		});	
	</script>		

</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>회원목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		  </div>  
		     <div class="row">
			    <form class="form-inline" name="detailForm"> 
				 <div class="col-md-6 text-left"> 
				  <div class="form-group" align="left">
						<select name="orderCondition" class="form-control" style="width:125px">
						 	<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--정렬하기--</option>
							<option value="5"  ${ ! empty search.orderCondition && search.orderCondition==5 ? "selected" : "" }>배송하기</option>
							<option value="6"  ${ ! empty search.orderCondition && search.orderCondition==6 ? "selected" : "" }>배송중</option>
							<option value="7"  ${ ! empty search.orderCondition && search.orderCondition==7 ? "selected" : "" }>배송완료</option>
						</select>
				  </div>
				  <button type="button" class="btn btn-default" id="sorting">조회</button>
				  </div>
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				 
				</form>
	    </div>
	    	
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		 <br/>
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped">
      
        <thead>
          <tr class="jaewoong">
            <th align="center">No</th>
            <th align="center">주문번호</th>
            <th align="center">상품번호</th>
            <th align="center">배송현황</th>
            <th align="center">현재상태</th>
            <th align="center">구매회원</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="center">${purchase.tranNo}</td>
			  <td align="center" class="prodNum" value1="${purchase.purchaseProd.prodNo }" value2="${param.menu}" >
				${purchase.purchaseProd.prodNo }
			  	<i class="glyphicon glyphicon-ok" id= "${purchase.purchaseProd.prodNo}"></i>
			  	<input type="hidden" value="${purchase.purchaseProd.prodNo}">
			 	 </td>
			  <c:choose>
				<c:when test="${purchase.tranCode.equals('000')}">
					<td align="center">현재 <b>구매취소</b> 상태입니다.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('001')}">
					<td align="center">현재 <b>구매완료</b> 상태입니다.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('002')}">
					<td align="center">현재 <b>배송중</b> 상태입니다.</td>
				</c:when>
				<c:otherwise>
					<td align="center">현재 <b>배송완료</b> 상태입니다.</td>
				</c:otherwise>
			  </c:choose>
			  
			  <c:choose>
					<c:when test="${purchase.tranCode.equals('000') }">
						<td align="center" style="color:gray"> 구매취소 </td>
					</c:when>
					<c:when test="${purchase.tranCode.equals('001') }">
						<td align="center" class="divy" value1="${purchase.tranNo }" value2="${purchase.tranCode}">배송하기</td>			
					</c:when>
					<c:when test="${purchase.tranCode.equals('002') }">
						
						<td align="center" style="color:#87cefa"> 배송중</td>
					</c:when>
					<c:when test="${purchase.tranCode.equals('003') }">
						
						<td align="center"> 배송완료</td>
					</c:when>
					<c:otherwise>
						<td></td>
					</c:otherwise>
			
				</c:choose>
			
			  	<td align="center" class="user" value="${purchase.buyer.userId}">${purchase.buyer.userId}</td>
				
				
				
				</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>