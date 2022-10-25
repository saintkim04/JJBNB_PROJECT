<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JJBNB</title>
     <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jjh/style.css">
    <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
     <!-- 웹 폰트 -->
     <script src="https://kit.fontawesome.com/35e0a03178.js" crossorigin="anonymous"></script>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<body>

	<%@include file="/resources/include/fix-header.jsp" %>

   <main class="container main-box">

       <nav class="side-nav">
         <dl class="side-nav-title">
            <dt>마이페이지
            <dd><a href="${pageContext.request.contextPath}/mypage.do">내 정보 관리 </a></dd>
            <dd><a href="${pageContext.request.contextPath}/reservation_list.do"><span>예약내역</span></a></dd>
            <dd><a href="${pageContext.request.contextPath}/member_logout.do" onclick='return confirm("로그아웃 하시겠습니까?")'>로그아웃</a></dd>
         </dl>
      </nav>
      <section class="content">
        <div class="title">예약내역</div>
        <hr/>
        <ul class="mypage">
            <li class="first">이용내역</li>
           		<jsp:useBean id="now" class="java.util.Date" />
            	<c:choose>
            		<c:when test="${empty reservationList}">
            			<div>
            				<h3>이용내역이 없습니다.</h3>
            			</div>
            		</c:when>
            		<c:otherwise>
                		<c:forEach var="reservationVo" items="${reservationList}">
                			<div class="card" style="width: 18rem; float:left; margin-right: 60px;">
                				<img src="${pageContext.request.contextPath}/resources/upload/${reservationVo.origin_filename1}"/>
                    			<a href="${pageContext.request.contextPath}/board/reservation_delete1.do?r_idx=${reservationVo.r_idx}" class="delete" id="reservation_delete"><i class="fa-solid fa-xmark" onclick='return confirm("예약내역을 삭제하시겠습니까?")'></i></a>
                    			<a href="${pageContext.request.contextPath}/reservation_view.do?r_idx=${reservationVo.r_idx}">
                        			<div class="card-body">
                            			<p class="card-title">${reservationVo.title }</p>
                            			<p class="card-text">${reservationVo.r_sdate} - ${reservationVo.r_edate}</p>
                        			</div>
                    			</a>
              				</div>
              			</c:forEach>
              		</c:otherwise>
              </c:choose>
        </ul>
      </section> 
      
      
      
   </main>
   
   
   <div class="footer-height">
	<%@include file="/resources/include/footer.jsp" %>
</div>


   <!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- SimpleLightbox plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
      
    </body>
    </html>