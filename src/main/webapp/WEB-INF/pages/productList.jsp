<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<style>
.no-finded {
	display: none !important;
}
a.link-to-detail{
    position: absolute;
     height: 345px;
    width: 202px;
 }
 .cusor.relative{
 position: relative;}
</style>

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles.css">

</head>
<body>
	<jsp:include page="_header.jsp" />
	<fmt:setLocale value="en_US" scope="session" />
	<div class="list">
		<div class="list-container">
			<div class="section-list">
				<h2>
					NƯỚC HOA <span>MỚI NHẤT</span>
				</h2>
				<p>
					<span>Tất cả</span> dòng nước hoa cao cấp
				</p>
			</div>
			<div class="list-product">
				<c:forEach items="${paginationProducts.list}" var="prodInfo">

					<div class="cursor relative">
						<a
							href="${pageContext.request.contextPath}/productDetail?code=${prodInfo.code}" class="link-to-detail">
							<a class="title" href="#">${prodInfo.name}</a> <img
							class="product-image"
							src="${pageContext.request.contextPath}/productImage?code=${prodInfo.code}" />
							<p class="price-list">
								<fmt:formatNumber value="${prodInfo.price}" type="currency" />
							</p>
						</td>
							<div class="add_view">
								<a class="btn-list"
									href="${pageContext.request.contextPath}/buyProduct?code=${prodInfo.code}">Buy
									Now</a>
								<security:authorize access="hasRole('ROLE_MANAGER')">
									<a class="btn-list"
										href="${pageContext.request.contextPath}/product?code=${prodInfo.code}">
										Edit Product</a>
								</security:authorize>
							</div>
						</a>
					</div>

				</c:forEach>
			</div>
			<c:if test="${paginationProducts.totalPages > 0}">
				<div class="page-navigator">
					<c:forEach items="${paginationProducts.navigationPages}" var="page">
						<c:if test="${page != -1 }">
							<a href="productList?page=${page}" class="nav-item">${page}</a>
						</c:if>
						<c:if test="${page == -1 }">
							<span class="nav-item"> ... </span>
						</c:if>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
	<br />
	<jsp:include page="_footer.jsp" />
	<script>
		var listName = document.querySelectorAll(".title");
		var listProduct = document.querySelectorAll(".cursor");
		var inputEl = document.getElementById("search-product");	
		var btnSearchEl = document.getElementById("btn-search-product");
		btnSearchEl.addEventListener("click", ()=>{
			//Reset
			listProduct.forEach((product)=>{
				if(product.classList.contains("no-finded"))
					product.classList.remove("no-finded");
			})
			
			const value = inputEl.value;
			console.log(inputEl.value);
			
			listProduct.forEach((product)=>{
				const productFinded = product.childNodes[2].textContent;
				console.log(product);
				if(!productFinded.toLowerCase().includes(value.toLowerCase()))
				 	product.classList.add("no-finded")
			})
		   
		})
	</script>
</body>
</html>