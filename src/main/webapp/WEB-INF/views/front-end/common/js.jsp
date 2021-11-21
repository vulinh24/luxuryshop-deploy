	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/javascript.js"></script>
    <script>
    	function linhcustom() {
	    	if(confirm("Vui lòng đăng nhập để có trải nghiệm tốt nhất!")){
	    		event.stopPropagation(); event.preventDefault();
	    		window.location.replace("${pageContext.request.contextPath}/login");
	        } else {
	        	event.stopPropagation(); event.preventDefault();
	        }
    	}
    	
    	function linhcustom2() {
	    	if(confirm("Đăng nhập để lưu giỏ hàng cho lần tới ghé thăm bạn nhé!")){
	    		event.stopPropagation(); event.preventDefault();
	    		window.location.replace("${pageContext.request.contextPath}/login");
	        } else {
	        	event.stopPropagation(); event.preventDefault();
	        }
    	}
    </script>