<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	

<!DOCTYPE html>
<html>
<head>
    <title>Trang chủ</title>
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css" rel="stylesheet">
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
	.product__service__more a{
		color:black;
	}
	
	.product__service__more a:hover{
		color:black;
	}
	
	.inhome{
		text-align: center;
		font-size: 30px;
		font-weight: bolder;
		color: black;
		margin-top:30px;
		padding-bottom: 20px;
		border-bottom: 2px solid black;
	}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
    <section class="hero">
    <div class="container-fluid">
        <div class="hero__slider owl-carousel">
        	<c:forEach var="banner" items="${banners }">
        		<div class="hero__items set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${banner.urlImage}">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>LUXURY SHOP</h6>
                                <h2>${banner.name }</h2>
                                <p>${banner.description }</p>
                                <a href="${pageContext.request.contextPath}/${banner.url}" class="primary-btn">Khám phá ngay
                                </a>
                                <div class="hero__social">
                                    <a><img src="${pageContext.request.contextPath}/images/facebook.png"></a>
                                    <a><img src="${pageContext.request.contextPath}/images/twitter.png"></a>
                                    <a><img src="${pageContext.request.contextPath}/images/pinterest.png"></a>
                                    <a><img src="${pageContext.request.contextPath}/images/instagram.png"></a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
        	</c:forEach>
            
        </div>
    </div>
    </section>

     <section class="product__service container">
    	<div class="inhome">
    		Sản phẩm bán chạy
    	</div>
    	<div class="row hihi">
    		<c:forEach items="${productsHot}" var="item">
    			<div>
    			<div class="product__item">
				                    <c:choose>
										<c:when test = "${empty item.productImages }">
											<div class="product__item__pic set-bg" data-setbg="http://placehold.it/700x400">
													<span class="label">Hot</span>
												<ul class="product__hover">
													<c:choose>
														<c:when test="${item.userLiked(USER) == true }">
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/redheart.png" alt=""><span>Yêu thích</span></a></li>
														</c:when>
														<c:otherwise>
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
														</c:otherwise>
													</c:choose>
													
					                                <li><a><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
					                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
					                            </ul>
					                        </div>
										</c:when>
										<c:otherwise>
											<div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${item.productImages.get(0).path }">
													<span class="label">Hot</span>
											<ul class="product__hover">
												<c:choose>
														<c:when test="${item.userLiked(USER) == true }">
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/redheart.png" alt=""><span>Yêu thích</span></a></li>
														</c:when>
														<c:otherwise>
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
														</c:otherwise>
													</c:choose>
				                                <li><a><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
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
			                           <h5><fmt:formatNumber value="${item.price }" type="number"/> <span style="text-decoration:line-through; font-size:14px; color:grey;"><fmt:formatNumber value="${item.priceOld }" type="number"/></span></h5>
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
    </section>
    <section class="product__service container">
    	<div class="inhome">
    		Sản phẩm mới
    	</div>
    	<div class="row hihi">
    		<c:forEach items="${productsNew}" var="item">
    			<div>
    			<div class="product__item">
				                    <c:choose>
										<c:when test = "${empty item.productImages }">
											<div class="product__item__pic set-bg" data-setbg="http://placehold.it/700x400">
													<span class="label">New</span>
												<ul class="product__hover">
					                                <c:choose>
														<c:when test="${item.userLiked(USER) == true }">
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/redheart.png" alt=""><span>Yêu thích</span></a></li>
														</c:when>
														<c:otherwise>
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
														</c:otherwise>
													</c:choose>
					                                <li><a><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
					                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
					                            </ul>
					                        </div>
										</c:when>
										<c:otherwise>
											<div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${item.productImages.get(0).path }">
													<span class="label">New</span>
											<ul class="product__hover">
				                                <c:choose>
														<c:when test="${item.userLiked(USER) == true }">
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/redheart.png" alt=""><span>Yêu thích</span></a></li>
														</c:when>
														<c:otherwise>
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
														</c:otherwise>
													</c:choose>
				                                <li><a><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
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
			                           <h5><fmt:formatNumber value="${item.price }" type="number"/> <span style="text-decoration:line-through; font-size:14px; color:grey;"><fmt:formatNumber value="${item.priceOld }" type="number"/></span></h5>
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
    </section>
    <section class="product__service container">
    	<div class="inhome">
    		Giảm giá
    	</div>
    	<div class="row hihi">
    		<c:forEach items="${productsSale}" var="item">
    			<div>
    			<div class="product__item">
				                    <c:choose>
										<c:when test = "${empty item.productImages }">
											<div class="product__item__pic set-bg" data-setbg="http://placehold.it/700x400">
													<span class="label">Sale</span>
												<ul class="product__hover">
					                                <c:choose>
														<c:when test="${item.userLiked(USER) == true }">
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/redheart.png" alt=""><span>Yêu thích</span></a></li>
														</c:when>
														<c:otherwise>
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
														</c:otherwise>
													</c:choose>
					                                <li><a><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
					                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
					                            </ul>
					                        </div>
										</c:when>
										<c:otherwise>
											<div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${item.productImages.get(0).path }">
													<span class="label">Sale</span>
											<ul class="product__hover">
				                                <c:choose>
														<c:when test="${item.userLiked(USER) == true }">
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/redheart.png" alt=""><span>Yêu thích</span></a></li>
														</c:when>
														<c:otherwise>
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
														</c:otherwise>
													</c:choose>
				                                <li><a><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
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
			                           <h5><fmt:formatNumber value="${item.price }" type="number"/> <span style="text-decoration:line-through; font-size:14px; color:grey;"><fmt:formatNumber value="${item.priceOld }" type="number"/></span></h5>
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
    </section>
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="categories__text">
                        <h2><span>Sofa da Italia </span></h2>
                        <h4><span>Thiết kế ưu việt</span></h4>
                        <h4><span>Chất liệu da nhập khẩu châu Âu</span></h4>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories__hot__deal">
                        <img src="${pageContext.request.contextPath}/images/sofa.jpg" alt="">
                        <div class="hot__deal__sticker">
                            <span>Giảm giá còn </span>
                            <h5>112,330,000đ</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1">
                    <div class="categories__deal__countdown">
                        <span>Ưu đãi cực lớn!</span>
                        <h2>Sofa da Italia Charlize</h2>
                        <div class="categories__deal__countdown__timer" id="countdown">
                            <div class="cd-item">
                                <span>3</span>
                                <p>Ngày</p>
                            </div>
                            <div class="cd-item">
                                <span>1</span>
                                <p>Giờ</p>
                            </div>
                            <div class="cd-item">
                                <span>50</span>
                                <p>Phút</p>
                            </div>
                            <div class="cd-item">
                                <span>18</span>
                                <p>Giây</p>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/shop-details/mvvk2-mvvm2-macbook-pro-16-inch-2019-i9-2-3-64gb-8tb-1609917082161" class="primary-btn">Mua ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <c:forEach items="${collections}" var="collection">
    	
    	<section class="product__service container">
    	<div class="product__service__bar">
    		<div class="product__service__name">${collection.name }</div>
    <!-- notice -->		<div class="product__service__more"><a href="${pageContext.request.contextPath}/shop/search?collectionid=${collection.id}">Xem thêm</a></div>
    	</div>
    	<div class="row hihi">
    		<c:forEach items="${collection.products}" var="item">
    			
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
					                                <c:choose>
														<c:when test="${item.userLiked(USER) == true }">
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/redheart.png" alt=""><span>Yêu thích</span></a></li>
														</c:when>
														<c:otherwise>
															<li onclick="favorite.favorite(${item.id});"><a><img class = "img_${item.id }" src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
														</c:otherwise>
													</c:choose>
					                                <li><a><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
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
				                                <li><a><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
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
			                           <h5><fmt:formatNumber value="${item.price }" type="number"/> <span style="text-decoration:line-through; font-size:14px; color:grey;"><fmt:formatNumber value="${item.priceOld }" type="number"/></span></h5>
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
    </section>
    </c:forEach>
    
    <section class="blog__section">
    	<div class="site__section" id="blog__section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center">
            <h3 class="section__sub__title">Tin tức mới</h3>
            <h2 class="section__title mb-3">Bài viết</h2>
          </div>
        </div>

        <div class="row">
          <c:forEach begin="0" end="2" varStatus="loop">
          		<div class="blog__section__item col-md-6 col-lg-4 mb-4 mb-lg-4">
		            <div class="h-entry">
		              <img style="height: 235px;" src="${pageContext.request.contextPath}/images/${blogs.get(loop.index).image}" alt="Image" class="img-fluid">
		              <h2 class="font__size__regular"><a  class="text-black">${blogs.get(loop.index).title }</a></h2>
		              <div class="meta mb-4">Love u <span class="mx-2">&bullet;</span> All time<span class="mx-2">&bullet;</span> </div>
		              <p class="customm">${blogs.get(loop.index).description }</p>
		              <p><a href="${pageContext.request.contextPath }/view-blog">Continue Reading...</a></p>
		            </div> 
         		 </div>
          </c:forEach>
        </div>
      </div>
    </div>
    </section>
    <jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include><script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.js">
	</script> 
	<script>
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