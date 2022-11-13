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
</style>

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles.css">
<style>
.product-detail__container {
	margin: 20px 100px;
	padding: 20px;
	display: flex;
}

.product-detail__img__container {
	align-items: center;
	justify-content: center;
	display: flex;
}

.product-detail__content {
	text-align: left;
	margin-left: 150px;
}


.product-ma {
	font-size: 2.5rem;
	color: #04befe;
}

p.product-name {
	font-size: 2rem;
}

.product-price {
	color: #DD3333;
	font-size: 1.2rem;
	font-weight: 600;
}

p.product-group {
	color: #3a3a3a;
	font-weight: 500;
}
.product-detail__action{
    display: flex;
    border-bottom: 2px solid #c9c9c9;
    padding: 15px;
    align-items: center;
    justify-items: center;
}
.product-detail__action__mg{
    margin-right:50px;
}

.product-price-bottom{
	color:#efbc49;
	font-size: 1.2rem;
	    font-weight: bolder;
}
p.product-detail__action__text{
font-size: 1.2rem;
}
.btn-list{
font-size: 1.2rem;}

.btn {
    width: 150px;
    height: 49px;
    border: none;
    outline: none;
    border-radius: 49px;
    cursor: pointer;
    background-color: #6876C6;
    color: #fff;
    text-transform: uppercase;
    font-weight: 600;
    margin: 10px 0;
    transition: .5s;
        display: flex;
    justify-content: center;
    align-items: center;
}
.btn:hover {
    background: #4d84e2;
}
</style>
</head>
<body>
	<jsp:include page="_header.jsp" />
	<fmt:setLocale value="en_US" scope="session" />
	<div class="list">
		<div class="list-container">
			<div class="section-list">
				<div class="product-detail__container">
					<div class="product-detail__img__container">
						<img
							src="${pageContext.request.contextPath}/productImage?code=${productInfo.getCode()}" />
					</div>

					<div class="product-detail__content">
						<h3 class="product-ma pd">${productInfo.getCode()}</h3>
						<p class="product-name pd">${productInfo.getName()}</p>
						<span class="product-price pd">${productInfo.getPrice()} ₫</span>
						<p class="product-group pd">Nhóm nước hoa: Hương Ambẻ Flora</p>
						<p class="product-group pd">Năm ra mắt: 2012</p>
						<p class="product-group pd">Giới Tính: Unisex</p>
						<p class="product-group pd">Nồng độ: EDP</p>
						<p class="product-group pd">Phong cách: Lôi Cuốn, Thu Hút,
							Năng Động</p>
						<div class="product-group pd">
							<p class="product-group">Hương Đầu: Quả chanh vàng, Cam
								Bergamot, Quả chanh xanh</p>
							<p class="product-group">Hương giữa: Hoa hồng de Mai (tháng
								năm), Hoa nhài, Hoa ngọc lan tây, Quả sung</p>
							<p class="product-group">Hương cuối: Quế, Nghệ tây, Cây hoắc
								hương, Rêu sồi, Gỗ đàn hương, Gỗ trầm hương, An tức</p>
						</div>

						<div class="product-detail__action">
							<p class="product-detail__action__text product-detail__action__mg">30ml</p>
							<span class="product-price-bottom pd product-detail__action__mg">${productInfo.getPrice()} ₫</span>
							<a class="btn solid" href="${pageContext.request.contextPath}/buyProduct?code=${productInfo.getCode()}">Mua ngay</button></a>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	<jsp:include page="_footer.jsp" />
	
</body>
</html>