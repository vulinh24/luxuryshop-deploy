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
                        <p class="right__desc">Chèn slide</p>
                        <div class="right__formWrapper">
                            <form:form action="/admin/slide-add" method="post" modelAttribute="banner" enctype="multipart/form-data">
                                <form:hidden path="id"/>
                                <div class="right__inputWrapper">
                                    <label for="name">Tên slide</label>
                                    <form:input type="text" placeholder="Tên slide" path="name" required = "required" />
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="url">Url</label>
                                    <form:input type="text" placeholder="Url" path="url" required = "required"  />
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="desc">Mô tả</label>
                                    <form:textarea path="description" name="" id="" cols="30" rows="10" placeholder="Mô tả" required = "required" />
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="image">Hình ảnh</label>
                                    <input type="file" name="banner_image" class="form-control" required = "required">
                                </div>
                                <button class="btn" type="submit">Chèn</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
</body>
</html>