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
	<script>
	$(document).ready(function(){
		
		
		
		
		
		
		$("#pw-modify-ok").on("click", function(){
 			
	 		var password = document.getElementById('pw').value;
	 		var password2 = document.getElementById('pw2').value;
	 
	 		
	 		if(password != password2){
	 			alert("비밀번호를 다시 확인해 주세요.")
	 			$("#pw2").focus();
	 			return false;
	 		}else{
	 			$("#regform_pw").submit();
	 		}
 })
	})
	
	
	function passConfirm(){

 		var password = document.getElementById('pw').value;
 		var password2 = document.getElementById('pw2').value;
 		var msg = document.getElementById('msg');
 		
 		if(password != "" && password2 !=""){
 		if(password == password2){
 			msg.style.color = "#00ff00";
 			msg.innerHTML = "비밀번호가 일치합니다.";
 		}else{
 			msg.style.color = "#f4623a";
 			msg.innerHTML = "비밀번호가 일치하지 않습니다.";
 		}
 	}else{
 		msg.innerHTML = "";
 	}
 }
	
	</script>
</head>
<body id="page-top">
<!-- Navigation-->
<%@include file="/resources/include/fix-header.jsp" %>
<hr/>
<div class="login-form">
    <form action="${pageContext.request.contextPath}/pw_update.do" method="post" id="regform_pw">
    <input type="hidden" id="m_id" name="m_id" value="${m_id}">
        <h2 class="text-center">JJBNB</h2>       
        <div class="form-group">
            <input class="login-form-control" type="password" id="pw" name="m_pw" placeholder="새로운 비밀번호를 입력해 주세요." onchange="passConfirm()">
        </div>
        <div class="form-group">
             <input class="login-form-control" type="password" id="pw2" placeholder="비밀번호를 한 번 더 입력해 주세요." onchange="passConfirm()">
        </div>
        <div id="msgbox">
            	<span id="msg"></span>
            </div>
        <div class="form-group">
            <button type="submit" id="pw-modify-ok" class="btn btn-primary btn-block">비밀번호 변경</button>
        </div>      
    </form>
</div>
</body>
</html>