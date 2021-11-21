<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
                        <p class="right__desc">Xem slides</p>
                        <div class="right__table">
                            <div class="right__tableWrapper">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên</th>
                                            <th>Hình ảnh</th>
                                            <th>URL</th>
                                            <th>Miêu tả</th>
                                            <th>Sửa</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                    	<c:forEach var="banner" items="${ banners}" varStatus="loop">
                                    		<tr>
                                            <td data-label="STT">${loop.index +1 }</td>
                                            <td data-label="Tên">${banner.name}</td>
                                            <td data-label="Hình ảnh" style="text-align: center;"><img style="width: 50px;height: 50px; object-fit: cover;" src="${pageContext.request.contextPath}/file/upload/${banner.urlImage}" alt=""></td>
                                            <td data-label="url">${banner.url}</td>
                                            <td data-label="Miêu tả">${banner.description}</td>
                                            <td data-label="Sửa" class="right__iconTable"><a href="${pageContext.request.contextPath }/admin/slide-add?id=${banner.id}"><img src="${pageContext.request.contextPath}/assets/icon-edit.svg" alt=""></a></td>
                                            <td data-label="Xoá" class="right__iconTable"><a href="${pageContext.request.contextPath }/admin/slide-remove/${banner.id}"><img src="${pageContext.request.contextPath}/assets/icon-trash-black.svg" alt=""></a></td>
                                        </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
</body>
</html>