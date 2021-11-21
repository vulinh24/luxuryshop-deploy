<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	
<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Giỏ hàng</title>
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
    <style>
    	.CartIsEmpty{
    		text-align:center;
    		font-size:30px;
    		font-weight:bolder;
    		text-transform: uppercase; 
    		color:grey;
    		margin-bottom: 40px;
    	}
    </style>
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
                            <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                            <img src="${pageContext.request.contextPath}/images/right-arrow.png">
                            <span>Giỏ hàng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shopping__cart__table">
                    			<c:if test="${CART.size() == 0 }">
                                	<div class="CartIsEmpty">Chưa có sản phẩm nào trong giỏ hàng!</div>
                                </c:if>
                                <c:if test="${CART.size() != 0 }">
                        <table>
                            <thead>
                                <tr>
                                	<th>STT</th>
                                    <th>Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Tổng</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
	                                <c:forEach items="${CART }" var="item" varStatus="loop">
										<tr id="${item.productCart.id }">
											<td class="STT">${loop.index + 1 }</td>
											<td class="product__cart__item">
												<div class="product__cart__item__pic">
													<c:choose>
														<c:when test="${item.productCart.productImages.isEmpty() == false }">
														<img
														src="${pageContext.request.contextPath}/file/upload/${item.productCart.productImages.get(0).path }"
														alt="">
														</c:when>
														<c:otherwise>
															<div style="height:71px;width: 100px;float: left;margin-right: 30px;" class="product__item__pic set-bg" data-setbg="http://placehold.it/100x60">
														</c:otherwise>
													</c:choose>
													
												</div>
												<div class="product__cart__item__text">
													<h6>${item.productCart.title }</h6>
													<h5><fmt:formatNumber value="${item.productCart.price }" type="number"/></h5>
												</div>
											</td>
											<td class="quantity__item">
												<div class="quantity">
													<div class="pro-qty-2">
														<input id="quantity_${item.productCart.id }" value="${item.quantity }" type="number" min="1" max="999" onchange="cart.linh_change_quantity_product(${item.productCart.id },$('#quantity_${item.productCart.id }').val(),'#price_${item.productCart.id }',${item.productCart.price });" >
													</div>
												</div>
											</td>
											<td id="price_${item.productCart.id }" class="cart__price"><fmt:formatNumber value="${item.productCart.price * item.quantity}" type="number"/></td>
											<td class="cart__close"><a href="#" onclick="cart.remove_product(${item.productCart.id});"><img
												src="${pageContext.request.contextPath}/images/cancel.png"></a></td>
										</tr>
									</c:forEach>
                            </tbody>
                        </table>
                        </c:if>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="${pageContext.request.contextPath}/shop">Tiếp tục mua sắm</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                                <a 
                                	<c:choose>
                                <c:when test="${CART.size() == 0 }"> </c:when> <c:otherwise>href="${pageContext.request.contextPath}/checkout"</c:otherwise>
                                </c:choose>
                                ><img src="${pageContext.request.contextPath}/images/update.png"> Đặt hàng</a>
                            </div>
                        </div>
                    </div>
                </div>
               </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
    <script type="text/javascript">
    	<c:if test="${not empty checkout}">
    		window.confirm("Đặt hàng thành công!");
    	</c:if>
    </script>
</body>
</html>