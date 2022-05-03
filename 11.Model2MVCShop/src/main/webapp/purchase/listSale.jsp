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
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	function fncGetList(currentPage) {
		
		$("#currentPage").val(currentPage)
		
		$("form").attr("method" , "POST").attr("action" , "/purchase/listSale").submit();
		
	}
	
	$(function() {	
		
		$( "td.prodNo" ).on("click" , function() {
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
	                	  
	                	  var files = JSONData.fileName.split('/');
	                	  
	                     var displayValue = "<table class='display' height='180'>"
			            					  +"<tr>"
			             					
			                                  +"<td>"
			                                  +"<h3>&emsp;"
			                                  +"상품번호	: "+JSONData.prodNo+"<br/><br/>&emsp;"
			                                  +"상품명	: "+JSONData.prodName+"<br/><br/>&emsp;"
			                                  +"상세정보	: "+JSONData.prodDetail+"<br/><br/>&emsp;"
			                                  +"제조일자 	: "+JSONData.manuDate+"<br/><br/>&emsp;"
			                                  +"이미지 <br/> 	 <img src='/images/uploadFiles/"+files[0]+"' width='250' height='250' />"
			                                 	
			                               
			                                  
			                                  +"</h3>"
			                                  +"</td>"
	                                          
	                                          +"<td width= '300' height='300' class='pur' align='right' style='color:#ec8383' > "
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
		
		
		$( "a.divy" ).on("click" , function() {
			console.log('물건도착');
			var message1 = $(this).attr("value1");
			console.log(message1);
			var message2 = $(this).attr("value2");
			console.log(message2);
			
			self.location ="/purchase/updateTranCode?menu=search&tranNo="+message1+"&tranCode="+message2;
		});
		
	$( "td.userid" ).on("click" , function() {
		
		
		var userId = $(this).attr("value");
	
			self.location ="/user/getUser?userId="+userId;
	}); 
	
		
		
		
		
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
	       <h3>판매목록관리</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	   <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
		
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped">
      
        <thead>
          <tr>
            <th align="center">No</th>
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
			 
			  <td align="center" class="prodNo" value1="${purchase.purchaseProd.prodNo }" value2="${param.menu}" >
				${purchase.purchaseProd.prodNo }
			  
			  	<input type="hidden" value="${purchase.purchaseProd.prodNo}">
			 	 </td>
					<c:choose>
				<c:when test="${purchase.tranCode.equals('100')}">
					<td align="left">현재 구매완료 상태입니다.
					</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('200')}">
					<td align="left">현재 배송중 상태입니다.</td>
				</c:when>
				<c:otherwise>
					<td align="left">현재 배송완료 상태입니다.</td>
				</c:otherwise>
			</c:choose>
			  
			
			<td align="left">
			
			<c:if test="${user.role=='admin' }">
			<c:choose>
			<c:when test="${purchase.tranCode=='100'}">
			구매완료 
				<a align="center" class="divy" value1="${purchase.tranNo }" value2="${purchase.tranCode}">배송하기</a>	
			</c:when>
			<c:when test="${purchase.tranCode=='200'}">
			배송중
			</c:when>
			<c:when test="${purchase.tranCode=='300'}">
			배송완료
			</c:when>
			<c:otherwise>
			판매중
			</c:otherwise>
			</c:choose>
			</c:if>
			
			
			
			
			
			
			
			<td align="center"	class="userid"  value="${purchase.buyer.userId}">
			${purchase.buyer.userId}
				</td>
		</tr>
		<tr>
		<td id="${purchase.purchaseProd.prodNo}" colspan="11" bgcolor="#ffffff" height="1"></td>
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