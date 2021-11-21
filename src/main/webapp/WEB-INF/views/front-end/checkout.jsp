<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	
<!DOCTYPE html>
<html>
<head>
<title>Thanh toán</title>
<jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Cửa hàng</h4>
						<div class="breadcrumb__links">
							<a href="${pageContext.request.contextPath}/">Trang chủ</a> <img
								src="${pageContext.request.contextPath}/images/right-arrow.png">
							<span>Hoá đơn</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form:form action="${pageContext.request.contextPath}/save-cart" method="post" modelAttribute="detailOrder">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<h6 class="coupon__code">
								<img src="${pageContext.request.contextPath}/images/icon4.png">
								Bạn có mã giảm giá, nhập ở đây:
								<input id="discount" onchange="shop.check_discount();" /> <span style="color: green" id="mess"></span>
								<input type = "hidden" id="codediscount" name="ccode" /> 
							</h6>
							<h6 class="checkout__title">Chi tiết hoá đơn</h6>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Tên của bạn<span>*</span>
										</p>
										<form:input path="customerName"  value="${user.name }" required = "required"/>
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<p>
									Địa chỉ<span>*</span>
								</p>
								<form:input type="text"
									placeholder="Apartment, suite, unite ect (optinal)"
									path="customerAddress" value="${user.address }" required = "required"/>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Số điện thoại<span>*</span>
										</p>
										<form:input type="text" path="customerPhone" value="${user.phone}" required = "required"/>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Email<span>*</span>
										</p>
										<form:input type="text" path="customerEmail" value="${user.email }" required = "required"/>
									</div>
								</div>
							</div>

							<div class="checkout__input">
								<p>
									Ghi chú
								</p>
								<form:input type="text"
									placeholder="Notes about your order, e.g. special notes for delivery."
									path="customerNote"/>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="checkout__order">
								<h4 class="order__title">Đơn hàng</h4>
								<table class="table table-striped">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">Tên sản phẩm</th>
											<th scope="col">Số lượng</th>
											<th scope="col">Đơn giá</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${CART}" var="item" varStatus="loop">
											<tr>
												<th scope="row">${loop.index + 1}</th>
												<td>${item.productCart.title }</td>
												<td>${item.quantity }</td>
												<td><fmt:formatNumber value="${item.productCart.price }" type="number" /></td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
								<ul class="checkout__total__all">
									<input id="total" type="hidden" value = "${total }">
									<li>Tổng <span><fmt:formatNumber value="${total }" type="number" /></span></li>
									<li>Giá sau mã <span id = "afterprice"><fmt:formatNumber value="${total }" type="number" /></span></li>
								</ul>
								
								<p>Lựa chọn phương thức thanh toán.</p>
								<div class="checkout__input__checkbox">
									<label for="payment"> Thẻ tín dụng <input disabled
										type="checkbox" id="payment"> <span class="checkmark"></span>
									</label>
								</div>
								<div class="checkout__input__checkbox">
									<label for="paypal"> Trả khi nhận hàng <input
										type="checkbox" id="paypal"> <span class="checkmark"></span>
									</label>
								</div>
								<button type="submit" class="site-btn">Đặt mua</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
</body>
</html>