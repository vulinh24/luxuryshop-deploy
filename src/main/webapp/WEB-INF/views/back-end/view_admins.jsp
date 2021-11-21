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
                        <p class="right__desc">Xem admins</p>
                        <div class="right__table">
                            <div class="right__tableWrapper">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Username</th>
                                            <th>Tên</th>
                                            <th>Email</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                    	<c:forEach var="user" items="${users }" varStatus="loop">
                                    		<tr>
	                                            <td data-label="STT">${loop.index +1 }</td>
	                                            <td data-label="Username">${user.username }</td>
	                                            <td data-label="Tên">${user.name }</td>
	                                            <td data-label="Email">${user.email }</td>
	                                            <td data-label="Xoá" class="right__iconTable"><a href="${pageContext.request.contextPath }/delete-admin/${user.id}"><img src="${pageContext.request.contextPath}/assets/icon-trash-black.svg" alt=""></a></td>
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