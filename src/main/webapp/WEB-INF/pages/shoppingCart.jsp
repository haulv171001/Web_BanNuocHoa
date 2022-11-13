<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Shopping Cart</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/shopping.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/header.css">

</head>
<body>
	<jsp:include page="_header.jsp" />

	<fmt:setLocale value="en_US" scope="session" />
	<div class="nocart-container">
		<c:if test="${empty cartForm or empty cartForm.cartLines}">
			<h2 class="nocart-content">Không có sản phẩm nào được thêm vào
				giỏ hàng</h2>
			<p class="nocart-content">Nhấn vào đây để tiến hành mua hàng</p>
			<div><a href="${pageContext.request.contextPath}/productList"
				class="btn-showcart-content">Show Product List</a></div>
			
		</c:if>
	</div>

	<c:if test="${not empty cartForm and not empty cartForm.cartLines   }">
		<form:form method="POST" modelAttribute="cartForm"
			action="${pageContext.request.contextPath}/shoppingCart">
			<div class="shopping">
				<div>
					<div class="form-shopping">
						<div class="shopping-container">
							<table class="table-shopping">
								<thead>
									<tr>
										<td class="table-remove"></td>
										<td class="thead-table table-img"></td>
										<td class="thead-table table-name">Sản Phẩm</td>
										<td class="thead-table table-price">Giá</td>
										<td class="thead-table table-number">Số lượng</td>
										<td class="thead-table table-money">Tạm tính</td>
									</tr>
								</thead>
								<c:forEach items="${cartForm.cartLines}" var="cartLineInfo"
									varStatus="varStatus">
									<tbody>
										<tr>
											<td class="table-remove "><a class="product-remove"
												href="${pageContext.request.contextPath}/shoppingCartRemoveProduct?code=${cartLineInfo.productInfo.code}">
													x </a>
											<td class="code-table">Code:
												${cartLineInfo.productInfo.code} <form:hidden
													path="cartLines[${varStatus.index}].productInfo.code" />
											</td>
											<td class="table-img"><img class="product-image"
												src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" /></td>
											<td class="table-name product-name">${cartLineInfo.productInfo.name}</td>
											<td class="table-price product-price"><fmt:formatNumber
													value="${cartLineInfo.productInfo.price}" type="currency" />
											</td>
											<td class="table-number ">
												<div class="product-number">
													<a class="btn-number btn-prev">-</a>
													<form:input path="cartLines[${varStatus.index}].quantity"
														class="number" />
													<a class="btn-number btn-next">+</a>
												</div>
											<td class="table-money product-money"><fmt:formatNumber
													value="${cartLineInfo.amount}" type="currency" /></td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="table-cart">
					<div class="cart-total">
						<h2>Cộng giỏ hàng</h2>
						<table class="table-cart-shopping">
							<thead>
								<tr>
									<td class="cart-content product-content content-title">Tạm
										tính</td>
									<td class="cart-money product-content content-money"><fmt:formatNumber
											value="${myCart.amountTotal}" type="currency" /></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="cart-content product-tbody tbody-content">Tổng</td>
									<td class="cart-money product-tbody tbody-money"><fmt:formatNumber
											value="${myCart.amountTotal}" type="currency" /></td>
								</tr>
							</tbody>
						</table>
						<a class="btn-buy"
							href="${pageContext.request.contextPath}/shoppingCartCustomer">Tiến
							hành thanh toán</a>
					</div>
				</div>
			</div>

			<div class="shopping-btn">
				<a class="btn-ctbuy"
					href="${pageContext.request.contextPath}/productList">Tiếp tục
					mua hàng</a> <input class="btn-update" type="submit"
					value="Cập nhật giỏ hàng" />
			</div>

		</form:form>
	</c:if>
	<jsp:include page="_footer.jsp" />
	<script type="text/javascript">
	const btn_prev = document.querySelectorAll('.btn-prev')
	const btn_next = document.querySelectorAll('.btn-next') 
	const number = document.querySelectorAll('.number')
	const money = document.querySelectorAll('.cart-money')
	
	
	
	btn_next.forEach((data,index)=>{
	    data.addEventListener("click",()=>{
	        number.forEach((data2, index2)=>{
	            if(index == index2){
	                data2.value++
	                
	            }
	        })
	    })
	})

	btn_prev.forEach((data,index)=>{
	    data.addEventListener("click",()=>{
	        number.forEach((data2, index2)=>{
	            if(index == index2){
	                data2.value--
	                if(data2.value < 0 )
	                    data2.value = 0
	            }
	        })
	    })
	})
	</script>
</body>
</html>