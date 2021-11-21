<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
    <link href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="dashboard">
                <jsp:include page="/WEB-INF/views/back-end/common/menu.jsp"></jsp:include>
                <div class="right">
                    <div class="right__content">
                        <div class="right__title">Bảng điều khiển</div>
                        <p class="right__desc">Xem đơn hàng</p>
                        <div class="right__table">
                            <div class="right__tableWrapper">
                                <table id="myTable">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Họ Tên</th>
                                            <th>SĐT</th>
                                            <th>Stt sp</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Số lượng</th>
                                            <th>Giá tiền</th>
                                            <th>Ngày</th>
                                            <th>Discount</th>
                                            <th>Tổng tiền</th>
                                            <th>Thu ship</th>
                                            <th>Địa chỉ</th>
                                            <th>Trạng thái</th>
                                            <th>Xác nhận</th>
                                            <th>Huỷ</th>
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                       <c:forEach items="${orders }" var="order" varStatus="loop">
	                                        <tr>
	                                            <td data-label="STT" rowspan="${order.saledOrder.size() + 1 }">${loop.index + 1}</td>
	                                            <td data-label="Tên" rowspan="${order.saledOrder.size() + 1 }">${order.customerName }</td>
	                                            <td data-label="phone" rowspan="${order.saledOrder.size() + 1 }">${order.customerPhone }</td>
	                                        </tr>
	                                        <tr>
		                                        	<td data-label="Stt sp">1</td>
		                                        	<td data-label="Tên sản phẩm">${order.saledOrder.get(0).productTitle}</td>
		                                            <td data-label="Số lượng">${order.saledOrder.get(0).quantity}</td>
		                                            <td data-label="Giá tiền"><fmt:formatNumber value="${order.saledOrder.get(0).productPrice}" type = "number"/></td>
		                                            
		                                            <td data-label="Ngày" rowspan="${order.saledOrder.size() + 1 }">${order.createdDate}</td>
		                                            <td data-label="Discount" rowspan="${order.saledOrder.size() + 1 }">${order.code}</td>
		                                            <td data-label="Tổng" rowspan="${order.saledOrder.size() + 1 }"><fmt:formatNumber value="${order.total}" type = "number"/></td>
		                                            <td data-label="Tổng thu ship" rowspan="${order.saledOrder.size() + 1 }"><fmt:formatNumber value="${order.totalReceived}" type = "number"/></td>
		                                            <td data-label="Địa chỉ" rowspan="${order.saledOrder.size() + 1 }">${order.customerAddress }</td>
		                                            
		                                            <td data-label="Trạng thái" rowspan="${order.saledOrder.size() + 1 }">
		                                            	<span id="status-${order.id }" class="badge badge-primary">${order.status }</span>
		                                            </td>
		                                            
		                                            <td data-label="Xác nhận" class="right__confirm" rowspan="${order.saledOrder.size() + 1 }" id="confirm-${order.id }">
		                                                <c:choose>
		                                                	<c:when test="${order.isCancel == false}">
		                                                		<a href="javascript:void(0)" onclick="shop1.is_pay(${order.id})" class="right__iconTable"><img src="${pageContext.request.contextPath}/assets/icon-check.svg" alt=""></a>
		                                                	</c:when>
		                                                	<c:otherwise>
		                                                		<a style="pointer-events: none;" href="#" class="right__iconTable"><img src="${pageContext.request.contextPath}/assets/icon-x.svg" alt=""></a>
		                                                	</c:otherwise>
		                                                </c:choose>
		                                                
		                                            </td>
		                                            
		                                            <td data-label="Xoá" class="right__iconTable" rowspan="${order.saledOrder.size() + 1 }" id="cancel-${order.id }">
		                                            <c:if test="${order.status eq 'Chờ xác nhận' }">
		                                            	<c:choose>
		                                                		<c:when test="${order.isCancel}">
		                                                			<span class="badge badge-danger">Đã Huỷ</span>
		                                                		</c:when>
		                                                		<c:otherwise>
		                                                			<a href="javascript:void(0)" onclick="shop3.is_cancel(${order.id})"><img src="${pageContext.request.contextPath}/assets/icon-trash-black.svg" alt=""></a>
		                                                		</c:otherwise>
		                                                	</c:choose></c:if></td>
		                                        </tr>
	                                        <c:forEach varStatus="loop2" begin="1" end="${order.saledOrder.size() - 1}" items="${order.saledOrder }">
		                                        <tr>
		                                        	<td data-label="Stt sp">${loop2.index + 1}</td>
		                                        	<td data-label="Tên sản phẩm">${order.saledOrder.get(loop2.index).productTitle}</td>
		                                            <td data-label="Số lượng">${order.saledOrder.get(loop2.index).quantity}</td>
		                                            <td data-label="Giá tiền"><fmt:formatNumber value="${order.saledOrder.get(loop2.index).productPrice}" type = "number"/></td>
		                                        </tr>
		                                     </c:forEach>
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
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="http://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
</body>
</html>