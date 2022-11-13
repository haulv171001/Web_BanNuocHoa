<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<div class="container_header">
	<div class="grid wide">
		<div class="header row">
			<div class="header__logo col l-1">
				<a href="" class="header__logo-link"> <img
					src="https://nuochoarosa.com/wp-content/uploads/2020/03/Untitled-233.png"
					alt="">
				</a>
			</div>
			<div class="header__list-wrap col l-6">
				<ul class="header__list-menu row">
					<li class="header__list-menu__item col l-2"><a class="header__list-menu__link"
						href="${pageContext.request.contextPath}/">Home</a></li>
					<li class="header__list-menu__item col l-3"><a class="header__list-menu__link"
						href="${pageContext.request.contextPath}/productList"> Product
							List </a></li>
					<li class="header__list-menu__item col l-2"><security:authorize
							access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">
							<a class="header__list-menu__link" href="${pageContext.request.contextPath}/orderList"> Order
								List </a>
     
   </security:authorize></li>
   <li class="header__list-menu__item col l-3"> <security:authorize access="hasRole('ROLE_MANAGER')">
							<a class="header__list-menu__link" href="${pageContext.request.contextPath}/product"> Create
								Product </a>
   </security:authorize></li>
				</ul>
			</div>
			<div class="header__search col l-2">
				<div class="header__search__wrap row">
					<input type="text" class="header__search__input"
					id="search-product"	placeholder="Tìm sản phẩm của bạn">
					<i id="btn-search-product" class="fa fa-search header__search__icon"></i>
				</div>
			</div>

			<div class="header__login-register col l-2">

				<c:if test="${pageContext.request.userPrincipal.name != null}">
           <a href="${pageContext.request.contextPath}/accountInfo">
						${pageContext.request.userPrincipal.name} </a>
         &nbsp;|&nbsp;
           <a href="${pageContext.request.contextPath}/logout">Logout</a>
				</c:if>

				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<a href="${pageContext.request.contextPath}/login"
						class="header__login-register--login">Đăng nhập  </a>
				</c:if>
			</div>


			<div class="header__cart-wrap col l-1">
				<a href="${pageContext.request.contextPath}/shoppingCart"><i class="fa fa-shopping-bag" aria-hidden="true"></i></a>

			</div>

		</div>
	</div>
</div>
