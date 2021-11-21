<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/back-end/customer/common/css.jsp"></jsp:include>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="dashboard">
                <jsp:include page="/WEB-INF/views/back-end/customer/common/menu.jsp"></jsp:include>
                <div class="right">
                    <div class="right__content">
                        <div class="right__title">Bảng điều khiển</div>
                        <p class="right__desc">Thông tin cá nhân :</p>
                        <div class="right__formWrapper">
                            <c:if test="${not empty state }">
                            	<c:choose>
                            		<c:when test="${state eq 'success'}">
	                            		<div class="alert alert-success">
	  										<strong>Thành công!</strong> Đổi mật khẩu thành công
										</div>
                            		</c:when>
                            		<c:otherwise>
                            			<div class="alert alert-danger">
	  										<strong>Thất bại!</strong> Đổi mật khẩu thất bại
										</div>
                            		</c:otherwise>
                            	</c:choose>
                            	
                            </c:if>
                            <form action="/customer-updatepassword" method="post" >
                            	
                            	<div class="right__inputWrapper">
									<label> Mật khẩu cũ :</label>
									<input type="password" class="form-control" name="oldPass"  required/>
								</div>
                            	<div class="right__inputWrapper">
                                	<label>Mật khẩu mới :</label>
									<input id="password" type="password" class="form-control" name="newPass" required/>
                                </div>
                            	
                                <div class="right__inputWrapper">
                                	<label>Nhập lại mật khẩu mới :</label>
									<input id="confirm_password" type="password" class="form-control" name="validateNewPass" required/>
                                	<span id='message'></span>
                                </div>
                                <button class="btn" type="submit">Lưu</button>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
	<jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/highcharts/8.1.2/es-modules/parts/Chart.min.js"></script>
	<script>
	$('#password, #confirm_password').on('keyup', function () {
		  if ($('#password').val() == $('#confirm_password').val()) {
		    $('#message').html('Hợp lệ').css('color', 'green');
		  } else 
		    $('#message').html('Không khớp').css('color', 'red');
		});
	</script>
</body>
</html>