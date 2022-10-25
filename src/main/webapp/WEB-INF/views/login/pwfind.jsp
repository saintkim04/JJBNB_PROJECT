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
	<script type="text/javascript">
	$(document).ready(function(){
		
		
		
		
		$("#pwfind").on("click",function(){
			
			var id = $("#m_id").val();
			var email = $("#m_email").val();
			var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

			
			console.log("test")
			if(id == ""){
				alert("아이디를 입력해주세요.")
				$("#m_id").focus();
				return false;
			}else if(email == ""){
				alert("이메일을 입력해주세요.")
				$("#m_email").focus();
				return false;
			}else if(!re.test(email)){
				alert("이메일 형식이 올바르지 않습니다.")
				$("#m_email").focus();
				return false;
			}else{
				$.ajax({
					type : "get",
					url :  '<c:url value ="/mailCheck?email="/>'+$("#m_email").val(),
					success : function(data){
						checkInput.attr('disabled',false);
						code = data;
						alert("인증번호가 전송되었습니다.")
					}
				});
				}
			
			
				var checkInput=$("#mail-Check-Input");
			
			checkInput.blur(function () {
				const inputCode = $(this).val();
				const $resultMsg = $('#mail-check-warn');
				
				if(inputCode === code){
					$resultMsg.html('인증번호가 일치합니다.');
					$resultMsg.css('color','#00ff00');
					$('#mail-Check-Btn').attr('disabled',true);
					$("#m_email").attr('readonly',true);
					checkInput.attr('readonly',true);
					$("#pwfind").attr("value", "Y");
				}else{
					$resultMsg.html('인증번호를 다시 확인해 주세요.');
					$resultMsg.css('color','#f4623a');
				}
			});
			
		})
		
		
		
		$("#pwfind_btn").on("click",function(){
			console.log("test2")
			
			var id = $("#m_id").val();
			var email = $("#m_email").val();
			var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			var emailChkVal = $("#pwfind").val();
			
			if(id == ""){
				alert("아이디를 입력해주세요.")
				$("#m_id").focus();
				return false;
			}else if(email == ""){
				alert("이메일을 입력해주세요.")
				$("#m_email").focus();
				return false;
			}else if(!re.test(email)){
				alert("이메일 형식이 올바르지 않습니다.")
				$("#m_email").focus();
				return false;
			}else if(emailChkVal == "N"){
				alert("인증을 진행해 주세요.")
				return false;
			}else{
				$("#pw_regform").submit();
			}
			
			
			
		})
	
		
	})
		
		
	</script>
</head>
<body id="page-top">
<!-- Navigation-->
<%@include file="/resources/include/fix-header.jsp" %>
<hr/>

<div class="login-form">
    <form action="${pageContext.request.contextPath}/pwfind_process.do" method="post" id="pw_regform">
        <h2 class="text-center">JJBNB</h2>       
        <div class="form-group">
            <input type="text" class="login-form-control" placeholder="아이디" required="required" id="m_id" name="m_id">
        </div>
        <div class="form-group">
            <input type="text" class="login-form-control" placeholder="이메일" required="required" id="m_email" name="m_email">
        </div>
        <div class="form-group">
        	<input id="mail-Check-Input" class="join-form-control" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
        </div>
        <div class="form-group" id="msgbox">
            	<span id="mail-check-warn"></span>
        </div>
        <div>
				<button type="button" class="join-button pwfind_btn" id="pwfind" value="N">인증하기</button>
				<button class="join-button pwfind_btn" id="pwfind_btn">비밀번호 찾기</button>
		</div> 
    </form>
</div>
</body>
</html>