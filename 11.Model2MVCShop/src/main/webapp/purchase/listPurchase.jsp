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
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage);
	   
	   console.log(currentPage);

		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	}
	
	
	
	
	
	   	$(function() {	   	
	   		
			$( "td.tran" ).on("click" , function() {
				
				
				var tranNo = $(this).attr("value");
			
					self.location ="/purchase/getPurchase?tranNo="+tranNo;
			});
		
		$( "td.userid" ).on("click" , function() {
			
			
			var userId = $(this).attr("value");
		
				self.location ="/user/getUser?userId="+userId;
		}); 
		
		$( "a.divy" ).on("click" , function() {
			console.log('물건도착');
			var tranNo = $(this).attr("value1");
			console.log(tranNo);
			var tranCode = $(this).attr("value2");
			console.log(tranCode);
			
			self.location ="/purchase/updateTranCode?menu=search&tranNo="+tranNo+"&tranCode="+tranCode;
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
	       <h3>구매이력</h3>
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
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->

      <table class="table table-hover table-striped">
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="center" >회원ID</th>            
            <th align="center">전화번호</th>
            <th align="center">배송현황</th>
             <th align="center">현재상태</th>
            
          </tr>
        </thead>
       
		<tbody>

	
	
	
		<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		

			<tr class="ct_list_pop">
		
			<td align="center"	class="tran"  value="${purchase.tranNo}">${ i }</td>
		
			<td align="center"	class="userid"  value="${purchase.buyer.userId}">
			
			${purchase.buyer.userId}</td>
		
			
			
			
			
		
		
		
		
		
		<td align="left">${purchase.receiverPhone}</td>
		
		<td align="left">
	
		<c:choose>
		<c:when test="${purchase.tranCode=='100' }">
		현재 구매완료 상태 입니다.
		</c:when>
		<c:when test="${purchase.tranCode=='200' }">
		현재 배송중입니다.
		</c:when>
		<c:otherwise>
		배송 완료되었습니다.
		</c:otherwise>
		</c:choose>
			</td>
		
		<td align="left">
		<c:if test="${purchase.tranCode=='200'}">
		<a align="right" class="divy" value1="${purchase.tranNo }" value2="${purchase.tranCode}">물건도착</a>	
		</c:if>
		</td>
	</tr>
	<tr>

		<td id="${purchase.tranNo}" colspan="11" bgcolor="#ffffff" height="1"></td>
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