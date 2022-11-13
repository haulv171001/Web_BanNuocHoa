<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Shopping Cart Confirmation</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Order.css">	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/header.css">
</head>
<body>
	<jsp:include page="_header.jsp" />

	<fmt:setLocale value="en_US" scope="session" />

	<div class="order">
		<div class="order-container">
			<div class="item-order">
				<div class="header-order">
					<div class="hedaer-order-left">
						<p>Yêu thích+</p>
						<span>Nước hoa Rosa Premiu</span>
					</div>
					<div class="hedaer-order-right">
						<div class="order-stutus-payment">
							<img class="img-money"
								src="https://shop.thuviencokhi.com/wp-content/uploads/2018/06/icon-gia-re.png"
								alt=""> <span>Đang xử lý |</span>
						</div>
						<div class="order-stutus-order">Chờ thanh toán</div>
					</div>
				</div>
				<c:forEach items="${myCart.cartLines}" var="cartLineInfo">
					<div class="product-order">
						<div class="product-order-left">
							<img class="intro-product"
							src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" />
							<div class="order-info">
								<p class="oder-infor-name">${cartLineInfo.productInfo.name}</p>
								<p class="oder-infor-id">Mã sản phẩm:  ${cartLineInfo.productInfo.code}</p>
								<p class="oder-infor-number">Số lượng: ${cartLineInfo.quantity}</p>
								<p class="oder-infor-price"><fmt:formatNumber
								value="${cartLineInfo.productInfo.price}" type="currency" /></p>
							</div>
						</div>
						<div class="product-order-right"><fmt:formatNumber
								value="${cartLineInfo.amount}" type="currency" /></div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="footer-order">
			<div class="footer-infor">
				Name: ${myCart.customerInfo.name}<br /> Email:
				${myCart.customerInfo.email}<br /> Phone:
				${myCart.customerInfo.phone}<br /> Address:
				${myCart.customerInfo.address}
			</div>
			<div class="footer-content">
				Số sản phẩm: ${myCart.quantityTotal} <br> Tổng số tiền: <span
					class="money-footer"><fmt:formatNumber
						value="${myCart.amountTotal}" type="currency" /></span>
			</div>
		</div>
		<div class="footer-btn-buy">
			<div class="footer-content">
				<form method="POST"
					action="${pageContext.request.contextPath}/shoppingCartConfirmation">
					<a class="navi-item"
						href="${pageContext.request.contextPath}/shoppingCart">Về giỏ
						hàng</a> <a class="navi-item"
						href="${pageContext.request.contextPath}/shoppingCartCustomer">Sửa
						thông tin</a> <input type="submit" value="Thanh Toán"
						class="input-send" />
				</form>
			</div>
		</div>
	</div>



	<jsp:include page="_footer.jsp" />

</body>
</html>