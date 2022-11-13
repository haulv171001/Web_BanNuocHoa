<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Order.css">
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
								alt=""> <span>Đã thanh toán |</span>
						</div>
						<div class="order-stutus-order">Đang giao</div>
					</div>
				</div>
				<c:forEach items="${orderInfo.details}" var="orderDetailInfo">
					<div class="product-order">
						<div class="product-order-left">
							<img class="product-image" class="intro-product"
								src="${pageContext.request.contextPath}/productImage?code=${orderDetailInfo.productCode}" />
							<div class="order-info">
								<p class="oder-infor-name">${orderDetailInfo.productName}</p>
								<p class="oder-infor-id">Mã sản phẩm:
									${orderDetailInfo.productCode}</p>
								<p class="oder-infor-number">Số lượng:
									${orderDetailInfo.quanity}</p>
								<p class="oder-infor-price">
									<fmt:formatNumber value="${orderDetailInfo.price}"
										type="currency" />
								</p>
							</div>
						</div>
						<div class="product-order-right">
							<fmt:formatNumber value="${orderDetailInfo.amount}"
								type="currency" />
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="footer-order">
			<div class="footer-infor">
				Name: ${orderInfo.customerName} <br /> Email:
				${orderInfo.customerEmail} <br /> Phone: ${orderInfo.customerPhone}
				<br /> Address: ${orderInfo.customerAddress}
			</div>
			<div class="footer-content">
				Tổng số tiền: <span class="money-footer"><fmt:formatNumber
						value="${orderInfo.amount}" type="currency" /></span>
			</div>
		</div>
	</div>





	<jsp:include page="_footer.jsp" />

</body>
</html>