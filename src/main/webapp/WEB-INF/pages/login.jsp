<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Login</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles1.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/header.css">
	
<style>
	.non-active{
		display: none;
	}
	
	.disbale{
		background-color:#68768d;
		pointer-events: none;
	}
</style>
</head>
<body>
	<jsp:include page="_header.jsp" />
	<div class="container">
		<div class="forms-container">
			<div class="signin-signup">
			<form class="sign-in-form" method="POST"
					action="${pageContext.request.contextPath}/j_spring_security_check">
					<h2 class="title">Đăng nhập</h2>
					<div class="input-filed">
						<i class="fa fa-user" aria-hidden="true"></i> <input type="text"
							name="userName" placeholder="Tên đăng nhập">
					</div>
					<div class="input-filed">
						<i class="fa fa-lock" aria-hidden="true"></i> <input type="password"
							name="password" placeholder="Mật khẩu">
					</div>
					<input type="submit" value="Đăng nhập" class="btn solid">

					<c:if test="${param.error == 'true'}">
						<div style="color: red; margin: 10px 0px;">Tên đăng nhập
							hoặc mật khẩu sai</div>
					</c:if>
					<span class="error-message">${error }</span>
				</form>

				<!-- Dang ki -->
				<c:url var="addAccountUrl" value="/account/add"/>
				
				<form action="${addAccountUrl}" method="POST" class="sign-up-form">
					<h2 class="title">Đăng ký</h2>
					<div class="input-filed">
						<i class="fa fa-user" aria-hidden="true"></i>
						 <input type="text" name="nameAccount" id ="nameAccount"
							placeholder="Tên đăng nhập">
						
					</div>
					<div class="input-filed">
						<i class="fa fa-lock" aria-hidden="true"></i>
						 <input type="password" id="password" name="passwordAccount"
							placeholder="Mật khẩu">
						
					</div>
					<input type="submit" id="btn-register" value="Đăng ký" class="btn solid disbale">
					
					<span id="error-name-account" class="error-message non-active">(*) Tên đăng nhập không được để trống!</span>
					<span  id="error-password-account" class="error-message non-active">(*) Mật khẩu không được để trống!</span>
					<span id="error-exist-account" class="error-message non-active">(*) ${message} Tài khoản đã tồn tại!!!</span>
					
				</form>
				  -->

				<!-- Dang ki -->
			</div>
		</div>
		<div class="panels-container">
			<div class="panel left-panel">
				<div class="content">
					<h3>Nước hoa cao cấp</h3>
					<p>
						Nếu chưa có tài khoản hãy nhấn đăng ký <br /> nhằm có những trải
						nghiệm tốt nhất đến từ web bán nước hoa giá tốt nhất.
					</p>
					<button class="btn transparent" id="sign-up-btn">Đăng ký</button>
				</div>
				<img
					src="https://kimkieuflower.vn/content/images/thumbs/000/0000665_top-10-loai-hoa-pho-bien-duoc-chiet-xuat-thanh-nuoc-hoa.jpeg"
					class="image" alt="">
			</div>

			<div class="panel right-panel">
				<div class="content">
					<h3>Nước hoa cao cấp</h3>
					<p>
						Bạn đã có tài khoản trong website hãy nhấn đăng nhập <br /> nhằm
						sử dụng dịch vụ tốt nhất đến từ web bán nước hoa giá tốt nhất.
					</p>
					<button class="btn transparent" id="sign-in-btn">Sign in</button>
				</div>
				<img
					src="https://media.coolmate.me/cdn-cgi/image/quality=80/uploads/December2021/nuoc-hoa-dat-tien-cho-nu.jfif"
					class="image" alt="">
			</div>
		</div>
	</div>



	</div>
	<jsp:include page="_footer.jsp" />
	<script>
        const sign_in_btn = document.querySelector('#sign-in-btn');
        const sign_up_btn = document.querySelector('#sign-up-btn');
        const container = document.querySelector('.container');
        sign_up_btn.addEventListener('click', () => {
            container.classList.add("sign-up-mode");
        });
        sign_in_btn.addEventListener('click', () => {
            container.classList.remove("sign-up-mode");
        });
        
        const errorUserName = document.getElementById("error-name-account");
        const errorPassword = document.getElementById("error-password-account");
        const errorExist = document.getElementById("error-exist-account");
        const nameEl = document.getElementById("nameAccount");
        const passwordEl = document.getElementById("password");
        const btnRegister = document.getElementById("btn-register");
        
        let isValidName = false;
        let isValidPassword = false; 
        
        const checkChangeClass = ()=>{
       	 if(isValidName && isValidPassword){
            	btnRegister.classList.remove("disbale");
            }else{
            	btnRegister.classList.add("disbale");
            }
       }
       
        
        nameEl.addEventListener("keyup", (e)=>{
			if(e.target.value == ""){
				errorUserName.classList.remove("non-active");
				isValidName = false;
			}else{
				isValidName = true;
				errorUserName.classList.add("non-active");
			}
			  
			checkChangeClass();
	        
        })
        passwordEl.addEventListener("keyup", (e)=>{
        	if(e.target.value == ""){
        		errorPassword.classList.remove("non-active");
        		isValidPassword = false;
			}else{
				isValidPassword = true;
				errorPassword.classList.add("non-active");
			}
        	checkChangeClass();        	  
        })
      
        btnRegister.addEventListener("click",(e)=>{
        	e.preventDefault();
        	console.log(errorExist.innerHTML);
        })
       
    </script>
    
    
</body>
</html>