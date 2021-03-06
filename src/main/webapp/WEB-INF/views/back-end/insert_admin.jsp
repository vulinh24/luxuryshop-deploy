
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
    <jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="dashboard">
                <jsp:include page="/WEB-INF/views/back-end/common/menu.jsp"></jsp:include>
                <div class="right">
                    <div class="right__content">
                        <div class="right__title">Bảng điều khiển</div>
                        <p class="right__desc">Thêm admin khách</p>
                        <div class="right__formWrapper">
                            <form action="/admin/decentralization-add" method="post">
                                <div class="right__inputWrapper">
                                    <label for="name">Username admin</label>
                                    <input type="text" placeholder="username admin" name="username">
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="email">Email</label>
                                    <input type="text" placeholder="Email" name="email">
                                </div>
                                <button class="btn" type="submit">Chèn</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
    
    <script>
    	<c:if test="${not empty notfound}">
    		alert("Không tìm thấy user!");
    	</c:if>
    </script>
</body>
</html>