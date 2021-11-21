<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css" rel="stylesheet">
	<script type="text/javascript" src="https://platform-api.sharethis.com/js/sharethis.js#property=5ffd8209f474080012973dbd&product=sticky-share-buttons" async></script>
	<style>
	.slick-arrow{
		color:black;
		background-color:black;
		border-radius: 50%;
	}
	
	.slick-arrow:hover{
		color:black;
		background-color:black;
		border-radius: 50%;
	}
	
	.slick-arrow:focus{
		color:black;
		background-color:black;
		border-radius: 50%;
	}
	.product__item{
	 margin-right: 15px;
	 margin-left:15px;
	}
	
	.hihi{
		margin-top:45px;
	}
	
	.comment{
		display:flex;
		justify-content: space-around;
		margin-bottom: 40px;
	}
	.linh-custom {
		list-style-type: none;
		margin-top:30px;
	}
	.linh-custom > li {
		margin-left : 0px;
		margin-top:20px;
		padding-left: 0px;
		text-align: left;
		font-family: "Nunito Sans", sans-serif;
	}
	</style>
</head>
<body>
	
	<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v12.0" nonce="0D4iIgNj"></script>
	
	
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
                            <span>Chi tiết</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="shop-details">
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <ul class="nav nav-tabs" role="tablist">
                            <c:forEach var="index" items="${keyset }">
                            	<li class="nav-item">
		                                <a class="nav-link <c:if test="${index == 1 }">active</c:if>" data-toggle="tab" href="#tabs-${index}" role="tab">
		                                  <div class="product__thumb__pic set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${images.get(index).path }">
		                                   </div>
		                                </a>
		                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!-- here -->
                     
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">
                        	<c:forEach var="index" items="${keyset }">
                            	<div class="tab-pane <c:if test="${index == 1 }">active</c:if>" id="tabs-${index }" role="tabpanel">
			                    	<div class="product__details__pic__item">
			                           	<img src="${pageContext.request.contextPath}/file/upload/${images.get(index).path }" alt="">
			                        </div>
			                     </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- test -->
                    <div class="col-lg-3 col-md-3">
                    	<h4 style="font-size: 23px;margin-left:0px;text-align: left;"><b>${product.title }</b></h4>
                        <ul class="linh-custom">
                            <li>
                            	<b>Kích thước(cm): </b>${proDetail.dimension }
                            </li>
                            <li>
                            	<b>Chất liệu: </b>${proDetail.material }
                            </li>
                            <li>
	                            <b>Xuất xứ: </b>${proDetail.origin }
                            </li>
                            <li>
	                            <b>Bảo hành: </b>${proDetail.insurance }
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="product__details__content">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4>${product.title }</h4>
                            <div class="rating">
                            	
                            		<form>
                            		
									      <div class="star-icon">
									        <input type="radio" name="rating1" id="rating1" <c:if test="${rate == 1}">checked </c:if>  >
									        <label for="rating1" class="fa fa-star"></label>
									        <input type="radio" name="rating1" id="rating2" <c:if test="${rate == 2}">checked </c:if>  >
									        <label for="rating2" class="fa fa-star"></label>
									        <input type="radio" name="rating1" id="rating3" <c:if test="${rate == 3}">checked </c:if>  >
									        <label for="rating3" class="fa fa-star"></label>
									        <input type="radio" name="rating1" id="rating4" <c:if test="${rate == 4}">checked </c:if>  >
									        <label for="rating4" class="fa fa-star"></label>
									        <input type="radio" name="rating1" id="rating5" <c:if test="${rate == 5}">checked </c:if>  >
									        <label for="rating5" class="fa fa-star"></label>
									      </div>
									     <c:choose>
										   	<c:when test="${not empty USER }">
										   		<button type="button" onclick="shop.rate(${product.id});" id="btnrate">Đánh giá</button>
										   	</c:when>
										   	<c:otherwise>
										   		<button type="button" onclick="rate();" id="btnrate">Đánh giá</button>
										   	</c:otherwise>
									   	</c:choose>
                                	</form>
                                
                            </div>
                            <h3><fmt:formatNumber value="${product.price }" type="number"/> <span><fmt:formatNumber value="${product.priceOld }" type="number"/></span></h3>
                            <p>${product.shortDescription }</p>
                            <div class="product__details__cart__option">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1" class="quality">
                                    </div>
                                </div>
                                <c:choose>
			                          <c:when test="${not empty USER }">
			                            	<a href="javascript:void(0)" class="primary-btn" onclick="cart.choose_product_to_cart(${product.id}, $('.quality').val())">Thêm vào giỏ hàng</a>
			                           </c:when>
			                            <c:otherwise>
			                            	<a href="javascript:void(0)" class="primary-btn" onclick="linhcustom2();">Thêm vào giỏ hàng</a>
			                            </c:otherwise>
			                    </c:choose>
                            </div>
                            <div class="product__details__btns__option">
                                <c:choose>
									<c:when test="${product.userLiked(USER) == true }">
										<a onclick="favorite.favorite(${product.id});"><img class = "img_${product.id }" src="${pageContext.request.contextPath}/images/redheart.png" alt=""> Sản phẩm yêu thích</a>
									</c:when>
									<c:otherwise>
										<a onclick="favorite.favorite(${product.id});"><img class = "img_${product.id }" src="${pageContext.request.contextPath}/images/heart.png" alt=""> Sản phẩm yêu thích</a>
									</c:otherwise>
								</c:choose>
                            </div>
                            <div class="product__details__last__option">
                                <h5><span>Đảm bảo thanh toán an toàn</span></h5>
                                <img src="${pageContext.request.contextPath}/images/payment.png" alt="">
                                
                            </div>
                            <div class="sharethis-inline-share-buttons"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div>
                                        <h1 class="desc-product">Mô tả:</h1>
                                    </div>
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            <h5>Thông tin sản phẩm:</h5>
                                            <p>${product.detailDescription }</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
    <div class="container">
            <div class="row">
                <div class="col-lg-12 comment">
                    <div class="fb-comments" data-href="http://localhost:8888/" data-width="" data-numposts="5"></div>
                </div>
            </div>
            </div>
    </section>
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title text-centerr">Sản phẩm khác</h3>
                </div>
            </div>
            <div class="row hihi">
            	<c:forEach items="${relatedProducts }" var="item">
            		<div>
			                    <div class="product__item">
				                    <c:choose>
										<c:when test = "${empty item.productImages }">
											<div class="product__item__pic set-bg" data-setbg="http://placehold.it/700x400">
												<c:if test="${item.isHot == true }">
													<span class="label">Hot</span>
												</c:if>
												<c:if test="${tem.isNew == true }">
													<span class="label">Mới</span>
												</c:if>
												<c:if test="${item.isSale == true }">
													<span class="label">Sale</span>
												</c:if>
												<ul class="product__hover">
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
					                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
					                            </ul>
					                        </div>
										</c:when>
										<c:otherwise>
											<div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${item.productImages.get(0).path }">
											<c:if test="${item.isHot == true }">
													<span class="label">Hot</span>
												</c:if>
												<c:if test="${item.isNew == true }">
													<span class="label">Mới</span>
												</c:if>
												<c:if test="${item.isSale == true }">
													<span class="label">Sale</span>
												</c:if>
											<ul class="product__hover">
				                                <c:choose>
														<c:when test="${item.userLiked(USER) == true }">
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/redheart.png" alt=""><span>Yêu thích</span></a></li>
														</c:when>
														<c:otherwise>
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
														</c:otherwise>
													</c:choose>
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
				                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
				                            </ul>
				                        </div>
										</c:otherwise>
									</c:choose>
			                        <div class="product__item__text">
			                            <h6>${item.title }</h6>
			                            
			                            <c:choose>
			                            	<c:when test="${not empty USER }">
			                            		<a href="javascript:void(0)" class="add-cart" onclick="cart.choose_product_to_cart(${item.id}, 1)" >+ Thêm vào giỏ hàng</a>
			                            	</c:when>
			                            	<c:otherwise>
			                            		<a href="javascript:void(0)" class="add-cart" onclick="linhcustom2();" >+ Thêm vào giỏ hàng</a>
			                            	</c:otherwise>
			                            </c:choose>
			                            
			                            <div class="rating d-flex">
			                                <c:forEach begin="1" end="${item.rate }">
			                            		<img width="15px" src="${pageContext.request.contextPath}/images/yellow-star.png">
			                            	</c:forEach>
			                                <c:forEach begin="${item.rate + 1 }" end="5">
			                            		<img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                            	</c:forEach>
			                            </div>
			                            <h5><fmt:formatNumber value="${item.price }" type="number" /> <span style="text-decoration:line-through; font-size:14px; color:grey;"><fmt:formatNumber value="${item.priceOld }" type="number" /></span></h5>
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
    </section>
    <jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.js">
	</script> 
	
	
	<script>
	function rate() {
		alert("Vui lòng đăng nhập!");
	}
	$('.hihi').slick({
		  infinite: true,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  slidesToShow: 4,
		  slidesToScroll: 1,
		  centerPadding: '60px',
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 4,
		        slidesToScroll: 1,
		        centerPadding: '60px',
		        infinite: true
		      }
		    },
		    {
		      breakpoint: 850,
		      settings: {
		        slidesToShow: 3,
		        centerPadding: '40px',
		        slidesToScroll: 1
		      }
		    },
		    {
			      breakpoint: 620,
			      settings: {
			        slidesToShow: 2,
			        centerPadding: '30px',
			        slidesToScroll: 1
			      }
			    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1,
		        centerPadding: '20px',
		        slidesToScroll: 1
		      }
		    }
		    // You can unslick at a given breakpoint now by adding:
		    // settings: "unslick"
		    // instead of a settings object
		  ]
		});
	</script>
</body>
</html>