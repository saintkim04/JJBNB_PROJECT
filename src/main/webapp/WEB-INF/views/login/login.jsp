<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>JJBNB</title>
	 <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic">
	<!-- 웹 폰트 -->
    <script src="https://kit.fontawesome.com/35e0a03178.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jjh/style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

</head>
<body id="page-top">
	<!-- Navigation-->
	<%@include file="/resources/include/fix-header.jsp" %>
	<hr/>

<div class="login-form">
    <form action="${pageContext.request.contextPath}/login_process.do" method="post">
        <h2 class="text-center">JJBNB</h2>       
        <div class="form-group">
            <input type="text" class="login-form-control" placeholder="아이디" required="required" name="m_id">
        </div>
        <div class="form-group">
            <input type="password" class="login-form-control" placeholder="비밀번호" required="required" name="m_pw">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">로그인</button>
        </div>
        <div class="clearfix text-center">
            <a href="${pageContext.request.contextPath}/pwfind.do" class="">비밀번호 찾기</a>
            <a href="${pageContext.request.contextPath}/join.do" class="">회원가입</a>
        </div>  
       	
       	<div style="margin-top: 30px;">
       		관리자 ID : master<br>
       		관리자 PW : 1234
       	</div>     
    </form>
</div>
</body>
</html>