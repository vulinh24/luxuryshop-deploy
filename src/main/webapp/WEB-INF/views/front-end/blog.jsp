<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
    <title>About</title>
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
    <style type="text/css">
    	.customm {
    		
			  width: 300px;
			  height : 150px; 
			  overflow: hidden;
			  text-overflow: ellipsis;
    	}
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
    <section class="breadcrumb-blog set-bg" data-setbg="${pageContext.request.contextPath}/images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Bài viết</h2>
                </div>
            </div>
        </div>
    </section>
    <section class="blog__section">
    	<div class="site__section" id="blog__section">
      <div class="container">
        <div class="row">
          
          <c:forEach var="blog" items="${blogs }">
          		<div class="blog__section__item col-md-6 col-lg-4 mb-4 mb-lg-4">
		            <div class="h-entry">
		              <img style="height: 235px;" src="${pageContext.request.contextPath}/images/${blog.image}" alt="Image" class="img-fluid">
		              <h2 class="font__size__regular"><a  class="text-black">${blog.title }</a></h2>
		              <div class="meta mb-4">Love u <span class="mx-2">&bullet;</span> All time<span class="mx-2">&bullet;</span> </div>
		              <p class="customm">${blog.description }</p>
		              <p><a href="${pageContext.request.contextPath }/view-blog">Continue Reading...</a></p>
		            </div> 
         		 </div>
          </c:forEach>
          
        </div>
      </div>
    </div>
    </section>
    <jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
</body>
</html>