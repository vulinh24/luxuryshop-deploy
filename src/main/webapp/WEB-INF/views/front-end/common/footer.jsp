<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            LUXURY SHOP
                        </div>
                        <p>Mang sản phẩm phù hợp nhất đến với bạn!</p>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/payment.png" alt=""></a>
                    </div>
                </div>
                
                <div class="col-lg-2 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Dịch vụ</h6>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
                            <li><a href="${pageContext.request.contextPath}/about">About us</a></li>
                            <li><a >Phương thức thanh toán</a></li>
                            <li><a >Hoàn trả và Điều kiện</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Contact me</h6>
                        <ul>
                            <li><a href="https://www.facebook.com/boss.go.vn/"><img style="height:20px;" src="${pageContext.request.contextPath}/images/facebook.png"> Linh Vũ</a></li>
                            <li><a> <i style="font-size:19px;" class="fas fa-envelope"></i> vulinhzh@gmail.com</a></li>
                        </ul>
                        
                        
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6>Đăng kí</h6>
                        <div class="footer__newslatter">
                            <p>Nhận thông báo về tin tức và sản phẩm mới!</p>
                                <div class="form">
	                                <input type="text" placeholder="Your email" id="email">
	                                <button onclick="notification.saveEmail()">
	                                	<img src="${pageContext.request.contextPath}/images/iconmail.png">
	                                </button>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="footer__copyright__text">
                    	<p>Copyright © 2021
                            All rights reserved | This website is made by <a target="_blank">Linh Vũ</a>
                        </p>
                        <p>Copyright © 2020
                            All rights reserved | This template is made by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>