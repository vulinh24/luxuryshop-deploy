<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
    <title>Liên hệ</title>
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
    <section>
    	<iframe class="col-lg-12" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59594.34838261655!2d105.79353260507746!3d21.006791755553092!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135aba15ec15d17%3A0x620e85c2cfe14d4c!2zTMSDbmcgQ2jhu6cgdOG7i2NoIEjhu5MgQ2jDrSBNaW5o!5e0!3m2!1svi!2s!4v1637113549238!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    	
    </section>
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="contact__text">
                        <div class="section-title">
                            <span>Thông tin</span>
                            <h2>Liên hệ</h2>
                            <p>Chúng tôi sẽ tiếp nhận những đóng góp để hoàn thiện hơn ,mang lại cho khách hàng những trải nghiệm tốt nhất.</p>
                        </div>
                        <ul>
                            <li>
                                <h4>Cảm ơn bạn đã ghé thăm!</h4>
                                <h4>Đây là trang web ảo</h4>
                                <p>Vui lòng truy cập <a href="https://nhadep.com.vn/">tại đây</a> để mua hàng </p>
                                <p>Đọc bài viết <a href="https://kfa.vn/">tại đây</a></p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="contact__form">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" id="name" name="name" placeholder="Họ và tên">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" id="email" name="email"  placeholder="Email">
                                </div>
                                <div class="col-lg-12">
                                    <textarea id="message" name="message" placeholder="Nội dung"></textarea>
                                    <button class="site-btn" onclick="contact.saveContact()">Gửi phản hồi</button>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
</body>
</html>