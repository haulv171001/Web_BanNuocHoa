<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Account Info</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/InfoAcount.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/header.css">
</head>
</head>
<body>
	<jsp:include page="_header.jsp" />

	<div class="acount">
		<div class="acount-container">
			<div class="acount-left">
				<div class="container-acount">
					<div class="card">
						<div class="imgBx">
							<i class="fa fa-user-circle img-account" aria-hidden="true"></i>
						</div>
						<div class="contentBx">
							<h2 class="name-acount">Account</h2>
							<h2 class="role-acount">Name:
								${pageContext.request.userPrincipal.name}</h2>
							<h2 class="role-acount">
								Quyền:
								<c:forEach items="${userDetails.authorities}" var="auth">
						${auth.authority }
					</c:forEach>
							</h2>
							<a href="${pageContext.request.contextPath}/logout">Logout</a>
						</div>
					</div>
				</div>
			</div>
			<div class="acount-right">
				<div class="acount-right-container">
					<div class="acount-right-info">
						<p>
							Xin chào bạn <br> Từ trang quản lý tài khoản bạn có thể xem
							<span> sản phẩm nước hoa</span> ,<span> giỏ hàng</span> ,<span>
								thanh toán</span> và <span> các chức năng khác</span> .
						</p>
					</div>
					<div class="acount-left-function">
						<a href="${pageContext.request.contextPath}/"><i
							class="fa fa-home" aria-hidden="true"></i><br>Home</a> <a
							href="${pageContext.request.contextPath}/productList"> <i
							class="fa fa-list" aria-hidden="true"></i><br>Product List
						</a>
						<security:authorize
							access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">
							<a href="${pageContext.request.contextPath}/orderList"> <i
								class="fa fa-shopping-bag" aria-hidden="true"></i><br />Order
								List
							</a>
						</security:authorize>
						<security:authorize access="hasRole('ROLE_MANAGER')">
							<a href="${pageContext.request.contextPath}/product"> <i
								class="fa fa-pencil-square-o" aria-hidden="true"></i><br />Create
								Product
							</a>
						</security:authorize>
						<a href="${pageContext.request.contextPath}/shoppingCart"><i
							class="fa fa-cart-plus" aria-hidden="true"></i><br />Shopping
							Cart</a>
					</div>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="_footer.jsp" />

</body>
</html>