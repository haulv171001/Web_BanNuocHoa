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
	href="${pageContext.request.contextPath}/OrtherList.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/header.css">

</head>
<body>

	<jsp:include page="_header.jsp" />

	<fmt:setLocale value="en_US" scope="session" />
	
	<div class="order-list">
		<div class="order-list-content">
			<c:forEach items="${paginationResult.list}" var="orderInfo">
				<table class="table-shopping">
					<thead>
						<tr>
							<td class="order-number order-thead"></td>
							<td class="order-date order-thead"><i
								class="fa fa-calendar icon-order" aria-hidden="true"></i>Order
								date</td>
							<td class="order-name order-thead"><i
								class="fa fa-user-o icon-order" aria-hidden="true"></i>Name</td>
							<td class="order-address order-thead"><i
								class="fa fa-address-card-o icon-order" aria-hidden="true"></i>
									Address</td>
							<td class="order-email order-thead"><i
								class="fa fa-envelope-o icon-order" aria-hidden="true"></i>Email</td>
							<td class="order-amount order-thead"><i
								class="fa fa-credit-card icon-order" aria-hidden="true"></i>Amount</td>
							<td class="order-add order-thead"></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="order-number order-tbody"><span class="number">${orderInfo.orderNum}</span></td>
							<td class="order-date order-tbody"><fmt:formatDate value="${orderInfo.orderDate}"
						pattern="dd-MM-yyyy HH:mm" /></td>
							<td class="order-name order-tbody">${orderInfo.customerName}</td>
							<td class="order-address order-tbody">${orderInfo.customerAddress}</td>
							<td class="order-email order-tbody">${orderInfo.customerEmail}</td>
							<td class="order-amount order-tbody tbody-money"><fmt:formatNumber
						value="${orderInfo.amount}" type="currency" /></td>
							<td class="order-add order-tbody">
							<a class="add-tbody" href="${pageContext.request.contextPath}/order?orderId=${orderInfo.id}">Xem Thêm</a></td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
		</div>
	</div>

	<c:if test="${paginationResult.totalPages > 1}">
		<div class="page-navigator">
			<c:forEach items="${paginationResult.navigationPages}" var="page">
				<c:if test="${page != -1 }">
					<a href="orderList?page=${page}" class="nav-item">${page}</a>
				</c:if>
				<c:if test="${page == -1 }">
					<span class="nav-item"> ... </span>
				</c:if>
			</c:forEach>

		</div>
	</c:if>

	<jsp:include page="_footer.jsp" />

</body>
</html>