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
                       	<div class="row">
                        <c:forEach var="product" items="${products }">
	                        <div class="col-lg-4 col-md-6 col-sm-6">
			                    <div class="product__item">
				                    <c:choose>
										<c:when test = "${empty product.productImages }">
											<div class="product__item__pic set-bg" data-setbg="http://placehold.it/700x400">
												<c:if test="${product.isHot == true }">
													<span class="label">Hot</span>
												</c:if>
												<c:if test="${product.isNew == true }">
													<span class="label">Mới</span>
												</c:if>
												<c:if test="${product.isSale == true }">
													<span class="label">Sale</span>
												</c:if>
												<ul class="product__hover">
					                                <c:choose>
														<c:when test="${item.userLiked(USER) == true }">
															<li onclick="favorite.favorite(${product.id});"><a><img class = "img_${product.id }" src="${pageContext.request.contextPath}/images/redheart.png" alt=""><span>Yêu thích</span></a></li>
														</c:when>
														<c:otherwise>
															<li onclick="favorite.favorite(${product.id});"><a><img class = "img_${product.id }" src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
														</c:otherwise>
													</c:choose>
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
					                                <li><a href="${pageContext.request.contextPath}/shop-details/${product.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
					                            </ul>
					                        </div>
										</c:when>
										<c:otherwise>
											<div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${product.productImages.get(0).path }">
											<c:if test="${product.isHot == true }">
													<span class="label">Hot</span>
												</c:if>
												<c:if test="${product.isNew == true }">
													<span class="label">Mới</span>
												</c:if>
												<c:if test="${product.isSale == true }">
													<span class="label">Sale</span>
												</c:if>
											<ul class="product__hover">
				                                <c:choose>
														<c:when test="${product.userLiked(USER) == true }">
															<li onclick="favorite.favorite(${product.id});"><a><img class = "img_${product.id }" src="${pageContext.request.contextPath}/images/redheart.png" alt=""><span>Yêu thích</span></a></li>
														</c:when>
														<c:otherwise>
															<li onclick="favorite.favorite(${product.id});"><a><img class = "img_${product.id }" src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
														</c:otherwise>
													</c:choose>
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
				                                <li><a href="${pageContext.request.contextPath}/shop-details/${product.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
				                            </ul>
				                        </div>
										</c:otherwise>
									</c:choose>
			                        <div class="product__item__text">
			                            <h6>${product.title }</h6>
			                            <!-- code api in javascript.js -->
			                            <c:choose>
			                            	<c:when test="${not empty USER }">
			                            		<a href="javascript:void(0)" class="add-cart" onclick="cart.choose_product_to_cart(${product.id}, 1)" >+ Thêm vào giỏ hàng</a>
			                            	</c:when>
			                            	<c:otherwise>
			                            		<a href="javascript:void(0)" class="add-cart" onclick="linhcustom2();" >+ Thêm vào giỏ hàng</a>
			                            	</c:otherwise>
			                            </c:choose>
			                            <div class="rating">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                            </div>
			                             <h5><fmt:formatNumber value="${product.price }" type="number"/> <span style="text-decoration:line-through; font-size:14px; color:grey;"><fmt:formatNumber value="${product.priceOld }" type="number"/></span></h5>
			                            <div class="product__color__select">
			                                <label class="silver" for="pc-1">
			                                    <input type="radio" id="pc-1">
			                                </label>
			                                <label class="active grey" for="pc-2">
			                                    <input type="radio" id="pc-2">
			                                </label>
			                            </div>
			                        </div>
			                    </div>
			                 </div>
                        </c:forEach>
                    </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
	<jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/highcharts/8.1.2/es-modules/parts/Chart.min.js"></script>
	
</body>
</html>