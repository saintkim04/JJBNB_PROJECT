<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>



<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>JJBNB</title>

  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
  <!-- Bootstrap Icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Google fonts-->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
    rel="stylesheet" type="text/css" />
  <!-- SimpleLightbox plugin CSS-->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

  <!-- https://fontawesome.com/start -->
  <script src="https://kit.fontawesome.com/0b499a845d.js" crossorigin="anonymous"></script>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">

  <link href="${pageContext.request.contextPath}/resources/css/ksh/예약완료.css" rel="stylesheet" />
</head>
<body>

<%@include file="/resources/include/fix-header.jsp" %>


<nav class="main-reser-container">
    <div class="reservation-title">
        <h2>예약완료</h2>
    </div>
    <hr class="main-hr">
    <div class="payment-check">
        <h3>결제가 완료되었습니다.</h3>
        <p class="p1"><i class="fa-brands fa-amazon-pay"></i>&nbsp;&nbsp;결제금액</p>
        <p class="p2">${reservationVo.r_cost }</p>
        <hr class="hr-pay">
        <p class="p1">예약자 이름</p>
        <p class="p2">${reservationVo.r_name}</p>
        <p class="p1">휴대폰번호</p>
        <p class="p2">${reservationVo.r_tell}</p>
        <p class="p1">예약일자</p>
        <p class="p2">${reservationVo.r_sdate} ~ ${reservationVo.r_edate}</p>
        <p class="p1">check-in</p>
        <p class="p2">15:00</p>
        <p class="p1">check-out</p>
        <p class="p2">11:00</p>
        <hr class="hr-pay">
        <p class="p3">예약하신 정보는 예약관리에서 확인하실 수 있습니다. 그 외에 문의 사항은 상담사연결을 통해 문의 하실 수 있습니다.</p>
    </div>
    <div class="img-check">
        <p class="img-nick">${boardVo.title}</p>
        <img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename1}">
    </div>
    </div>
    	<a href="${pageContext.request.contextPath}/home.do">
    		<div class="btn-box"> <button class="w-btn w-btn-red" type="button">홈으로</button></div>
    	</a>
</nav>




<!-- Footer-->
<footer class="bg-light py-5">
    <div class="container px-4 px-lg-5">
        <div class="small text-center text-muted">
                <div class="info">
                    <dl>
                        <dt>JJBNB</dt>
                        <dd>572, Baekje-daero, Deokjin-gu, Jeonju-si, Jeollabuk-do, Korea</dd>
                        <dd>JJBNB@naver.com</dd>
                        <dd>Tel : 010-1234-5678</dd>
                        <dd>Fax : 063-123-4567</dd>
                    </dl>
                </div><!--//info-->
            <hr/>
        <div class="copyright">
            <p>Copyright $copy; <strong>JJBNB</strong> All Rights Reserved.</p>
        </div><!--//copyright-->
        </div>
    </div>
</footer>
</body>
</html>