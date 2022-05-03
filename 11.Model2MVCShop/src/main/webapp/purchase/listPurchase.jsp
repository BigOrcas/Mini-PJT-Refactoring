<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
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
			console.log('���ǵ���');
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>�����̷�</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
			
				  
				
				  
				  
				  
		
				  
			
				  
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->

      <table class="table table-hover table-striped">
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="center" >ȸ��ID</th>            
            <th align="center">��ȭ��ȣ</th>
            <th align="center">�����Ȳ</th>
             <th align="center">�������</th>
            
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
		���� ���ſϷ� ���� �Դϴ�.
		</c:when>
		<c:when test="${purchase.tranCode=='200' }">
		���� ������Դϴ�.
		</c:when>
		<c:otherwise>
		��� �Ϸ�Ǿ����ϴ�.
		</c:otherwise>
		</c:choose>
			</td>
		
		<td align="left">
		<c:if test="${purchase.tranCode=='200'}">
		<a align="right" class="divy" value1="${purchase.tranNo }" value2="${purchase.tranCode}">���ǵ���</a>	
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
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>