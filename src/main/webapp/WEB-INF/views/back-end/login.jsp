<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>

    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" type="text/css">
</head>
<body>
	<div class="login__form">
		<div class="form-box">
			<div class="button-box">
				<div id="btn"></div>
				<button class="toggle-btn" onclick="login()">Đăng nhập</button>
				<button class="toggle-btn" onclick="register()">Đăng kí</button>
			</div>
			<div class="social-icon">
				<a href="#"><img src="${pageContext.request.contextPath}/images/fb.png"></a>
				<a href="#"><img src="${pageContext.request.contextPath}/images/tt.png"></a>
				<a href="#"><img src="${pageContext.request.contextPath}/images/gg.png"></a>
			</div>
			<form id="login" class="input-group" action="/action-form-login" method="POST">
				<c:if test="${not empty param.page_error}">
							<div class="alert alert-danger" role="alert">
							  	Tài khoản hoặc mật khẩu không chính xác!
							</div>
						</c:if>
				<input type="text" class="input-field" placeholder="Tên đăng nhập" required name="username">
				<input type="password" class="input-field" placeholder="Mật khẩu" required name="password">
				<input type="checkbox" name="remember-me" class="check-box"><span>Nhớ tài khoản, mật khẩu</span>
				<button class="submit-btn" type="submit">Đăng nhập</button>
				
			</form>
			<form id="register" class="input-group" method="post" action="/registion" > 
				<input type="text" class="input-field" placeholder="Tên đăng nhập" required name="username">
				<input type="text" class="input-field" placeholder="Tên của bạn" required name="name">
				<input type="email" class="input-field" placeholder="Email" required name="email">
				<input id="passwordr" type="password" class="input-field" placeholder="Mật khẩu" required name="password">
                <input id="confirm_passwordr" type="password" class="input-field" placeholder="Nhập lại mật khẩu" required name="password-again">
				<input type="checkbox" class="check-box" checked ><span>Tôi chấp nhận những điều khoản trên.</span>
				<button type="submit" class="submit-btn">Đăng kí</button>
			</form>
            <div class="cancel">
                <button value="Redirect Me" onclick="Redirect();" ><img src="${pageContext.request.contextPath}/images/arrow-left.png"><span>
                    Trở về trang chủ
                </span></button>
            </div>
		</div>
	</div>
	<script type="text/javascript">
		<c:if test="${not empty userexist}">
		window.alert("Tên tài khoản đã tồn tại!");
		</c:if>
		<c:if test="${not empty notsimilar}">
		window.alert("Mật khẩu không giống nhau!");
		</c:if>
		<c:if test="${not empty successr}">
		window.alert("Đăng kí thành công!");
		</c:if>
		$('#passwordr, #confirm_passwordr').on('keyup', function () {
	   		  if ($('#passwordr').val() == $('#confirm_passwordr').val()) {
	   		    $('#messager').html('Hợp lệ').css('color', 'green');
	   		  } else 
	   		    $('#messager').html('Không khớp').css('color', 'red');
	   		});
	</script>
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script>
    	var x = document.getElementById("login");
    	var y = document.getElementById("register");
    	var z = document.getElementById("btn");

    	function register(){
    		x.style.left = "-450px";
    		y.style.left = "50px";
    		z.style.left = "175px";
    	}

    	function login(){
    		x.style.left = "50px";
    		y.style.left = "450px";
    		z.style.left = "0";
    	}

         function Redirect() { 
            window.location="${pageContext.request.contextPath}/"; 
        }
    </script>
</body>
</html>