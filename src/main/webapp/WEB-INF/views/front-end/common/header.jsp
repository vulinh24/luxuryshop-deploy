<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
			<c:choose>
				<c:when test="${not empty USER}">
					<a class="nav-link" href="${pageContext.request.contextPath}/logout">ĐĂNG
					XUẤT</a>
				</c:when>
				<c:otherwise>
					<a class="nav-link" href="${pageContext.request.contextPath}/login">ĐĂNG
					NHẬP </a>
				</c:otherwise>
			</c:choose>
			
			<a href="#">FAQs</a>
            </div>
        </div>
        <div class="offcanvas__nav__option">
            <a href="#" class="search-switch"><img src="${pageContext.request.contextPath}/images/search.png" alt=""></a>
            <a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""></a>
			<a href="${pageContext.request.contextPath}/shopping-cart"><img src="${pageContext.request.contextPath}/images/cart.png" alt=""> <span id="soLuong">${SL_SP_GIO_HANG }</span></a>
            <div class="price">$${total }</div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <p>Miễn phí vận chuyển và 1 đổi 1 trong vòng 12 tháng</p>
        </div>
    </div>
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>Thanks for your visit !</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                            	<c:choose>
                            		<c:when test="${not empty USER }">
                            			<a style="margin-left:50px;pointer-events: none;" class="nav-link" href="${pageContext.request.contextPath}/">Xin chào, ${memberName}</a>
                            			<a class="nav-link" href="${pageContext.request.contextPath}/logout">ĐĂNG
										XUẤT</a>
                            		</c:when>
                            		<c:otherwise>
                            			<a class="nav-link" href="${pageContext.request.contextPath}/login">Đăng nhập/Đăng kí</a>
                            		</c:otherwise>
                            	</c:choose>
                               
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                       <a href="${pageContext.request.contextPath}/">LUXURY SHOP</a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="${cate == 'home' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/" >Trang chủ</a></li>
                            <li class="${cate == 'shop' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/shop">Cửa hàng</a></li>
                            <li class="${cate == 'blog' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/blog">Blog</a></li>
                            <li class="${cate == 'page' ? 'active' : '' }"><a href="#">Về chúng tôi</a>
                                <ul class="dropdown">
                                    <li><a href="${pageContext.request.contextPath}/about">Thông tin</a></li>
                                    <li><a href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
                                </ul>
                            </li>                  
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                         <a href="${pageContext.request.contextPath }/shop" class="search-switch"><img src="${pageContext.request.contextPath}/images/search.png" alt=""></a>
                        	<sec:authorize access="hasAnyRole('ADMIN','TESTADMIN')">
							<a href="${pageContext.request.contextPath}/admin"><img src="${pageContext.request.contextPath}/images/cart.png" alt="" title="admin"></a>
							</sec:authorize>
							<sec:authorize access="hasAuthority('ROLE_MEMBER')">
								<a href="${pageContext.request.contextPath}/customer"><img src="${pageContext.request.contextPath}/images/user-profile.png" alt=""></a>
							</sec:authorize>
                        <a href="${pageContext.request.contextPath}/shopping-cart" <c:if test="${empty USER }">onclick="linhcustom();"</c:if> >
                        	<img style="heigth:30px;width:30px;" src="${pageContext.request.contextPath}/images/cart_ll.png" alt=""> <span class="badge badge-secondary" style="font-size:12px;">${NUM_CART }</span>
                        </a>
                        
                    </div>
                </div>
            </div>
            <div class="canvas__open"><img src="${pageContext.request.contextPath}/Images/menu.png"></div>
        </div>
    </header>