<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap lib -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
</head>
<body>

	<jsp:include page="header.jsp" />

	<div class="px-4 py-5 my-5 text-center">
		<img class="d-block mx-auto mb-4"
			src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="72"
			height="57">
		<h1 class="display-5 fw-bold text-body-emphasis">상품정보</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<button type="button" class="btn btn-primary btn-lg px-4 gap-3"
					onclick="location.href='./products.jsp'">상품목록</button>
				<button type="button" class="btn btn-outline-secondary btn-lg px-4">로그인</button>
			</div>
		</div>
	</div>

	<!-- 상품 정보 영역 -->

	<%
	String productId = request.getParameter("id");
	Product product = productDAO.getProductById(productId);
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
			
						<!-- 경로 그대로 가져오면 ://과정에서 문제가 생기므로, img페이지의 id 파라미터를 통해 넘겨준 뒤 처리한다. -->
				<img alt="" src="img?id=<%=product.getProductId() %>" style="width:100%;">
			</div>
			<div class="col-md-6">
				<h3><%=product.getName()%></h3>
				<p>
					상품ID : 
					<%=product.getProductId()%></p>
				<p>
					제조사 :
					<%=product.getManufacturer()%></p>
				<p>
					분류 :
					<%=product.getCategory()%></p>
				<p>
					재고 :
					<%=product.getUnitsInStock()%></p>
				<h4>
					가격 :
					<%=product.getUnitPrice()%>원</h4>
				<p>
					<a href="#" class="btn btn-info">상품 주문</a>
				</p>
			</div>
		</div>
	</div>



	<jsp:include page="footer.jsp" />


</body>
</html>