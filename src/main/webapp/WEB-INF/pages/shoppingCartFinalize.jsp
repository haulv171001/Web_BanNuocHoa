<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Shopping Cart Finalize</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/header.css">
</head>
<body>
	<jsp:include page="_header.jsp" />

	<div class="container-final">
		<h3>Đặt hàng thành công</h3>
		<p>Cảm ơn quý khách đã đặt ${lastOrderedCart.orderNum} sản phẩm ở công ty chúng tôi</p>
	</div>

	<jsp:include page="_footer.jsp" />

</body>
</html>