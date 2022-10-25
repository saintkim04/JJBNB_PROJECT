<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
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
		$("#submit").on("click", function(){
			
			var id=$("#m_id").val();
			var idChkVal = $("#idChk").val();
			var password = $("#pw").val();
			var password2 = $("#pw2").val();
			var email = $("#m_email").val();
			var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			var emailChkVal = $("#mail-Check-Btn").val();
			var nname = $("#m_nname").val();
			var nnameChkVal = $("#nnameChk").val();
			var tell = $("#tell").val();
			var pattern= /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
			
			if(id == ""){
				alert("아이디를 입력해주세요.");
				$("#m_id").focus();
				return false;
			}else{
				
				if(idChkVal == "N"){
					alert("아이디 중복확인 버튼을 눌러주세요.");
					return false;
				}else if(idChkVal == "Y"){
					if(password == ""){
						alert("비밀번호를 입력해주세요.");
						$("#pw").focus();
						return false;
					}else if(password2 == ""){
						alert("비밀번호 확인을 입력해주세요.");
						$("#pw2").focus();
						return false;
					}else if(password != password2){
						alert("비밀번호와 비밀번호 확인이 다릅니다.")
						$("#pw2").focus();
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
						alert("이메일 인증을 진행해주세요.")
						return false;
					}else if(nname == ""){
						alert("닉네임을 입력해주세요.")
						$("#m_nname").focus();
						return false;
					}else if(nnameChkVal == "N"){
						alert("닉네임 중복확인 버튼을 눌러주세요.")	
						return false;
					}else if(nnameChkVal == "Y"){
						if(tell == ""){
							alert("핸드폰번호를 입력해 주세요.")
							$("#tell").focus();
							return false;
						}else if(!pattern.test(tell)){
							alert("핸드폰형식이 올바르지 않습니다.")
							$("#tell").focus();
							return false;
						}else if($("#checkbox").is(":checked") == false){
							alert("약관 및 정책에 동의해주세요.")
							return false;
						}else{
						$("#regForm").submit();
						}
					}
				}
			}
		})
			
			var checkInput=$("#mail-Check-Input");
			var email = $("#m_email").val();
			var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

			$('#mail-Check-Btn').on("click",function(){
				if($("#m_email").val() == ""){
					alert("이메일을 입력해주세요.")
					$("#m_email").focus();
					return false;
				}else if(!re.test($("#m_email").val())){
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
			});
			
			checkInput.blur(function () {
				const inputCode = $(this).val();
				const $resultMsg = $('#mail-check-warn');
				
				if(inputCode === code){
					$resultMsg.html('일치');
					$resultMsg.css('color','#00ff00');
					$('#mail-Check-Btn').attr('disabled',true);
					$("#m_email").attr('readonly',true);
					checkInput.attr('readonly',true);
					$("#mail-Check-Btn").attr("value", "Y");
				}else{
					$resultMsg.html('불일치');
					$resultMsg.css('color','#f4623a');
				}
			});
			
	})
			
			
	function passConfirm(){

		var password = document.getElementById('pw').value;
		var password2 = document.getElementById('pw2').value;
		var msg = document.getElementById('msg');
		
		if(password != "" && password2 !=""){
		if(password == password2){
			msg.style.color = "#00ff00";
			msg.innerHTML = "비밀번호 일치";
		}else{
			msg.style.color = "#f4623a";
			msg.innerHTML = "비밀번호 불일치";
		}
	}else{
		msg.innerHTML = "";
	}
}
	
	function fn_idChk(){
	//	alert("test");
		var m_id = $("#m_id").val();
		if (m_id == ""){
			alert("아이디를 입력하세요");
			return;
		}
		$.ajax({
			url : "<%=request.getContextPath()%>/idChk",
			type : "post",
			dataType : "json",
			data : {"m_id" : m_id},
			success : function(data){
				if(data == 1){
					alert("존재하는 아이디입니다.");
					$("#m_id").focus();
					return false;
				}else if(data == 0){
					$("#idChk").attr("value", "Y");
					alert("사용 가능한 아이디입니다.");
					$("#m_id" ).prop('readonly', true);
					$("#pw").focus();
				}
			}
		});		
	}
	
	
	
	function fn_nnameChk(){
		//	alert("test");
			var m_nname = $("#m_nname").val();
			if (m_nname == ""){
				alert("닉네임을 입력하세요");
				return;
			}
			$.ajax({
				url : "<%=request.getContextPath()%>/nnameChk",
				type : "post",
				dataType : "json",
				data : {"m_nname" : m_nname},
				success : function(data){
					if(data == 1){
						alert("존재하는 닉네임입니다.");
						$("#m_nname").focus();
						return false;
					}else if(data == 0){
						$("#nnameChk").attr("value", "Y");
						alert("사용 가능한 닉네임입니다.");
						$("#m_nname").prop('readonly', true);
						$("#tell").focus();
					}
				}
			});		
		}
	
</script>
</head>

<%@include file="/resources/include/fix-header.jsp" %>

<body id="join-body">
<div class="signup-form">
    <form name="frm" action="${pageContext.request.contextPath}/join_process.do" method="post" id="regForm">
      	<div class="row">
        	<div class="col-8 offset-4">
				<h2>JJBNB</h2>
			</div>	
      	</div>			
        <div class="form-group row">
			<label class="col-form-label col-3">아이디</label>
			<div class="col-6">
                <input type="text" class="join-form-control" name="m_id"  id="m_id" required="required">
            </div> 
			<div class="col-3">
			<button class="join-button idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
			</div>      	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">비밀번호</label>
			<div class="col-6">
                <input type="password" class="join-form-control" id="pw" name="m_pw" maxlength="12" required="required" onchange="passConfirm()">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">비밀번호 확인</label>
			<div class="col-6">
                <input type="password" class="join-form-control" id="pw2" name="m_pw2" maxlength="12" required="required" onchange="passConfirm()">
            </div>
            <div class="col-3" id="msgbox">
            	<span id="msg"></span>
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-3">이메일</label>
			<div class="col-6">
                <input type="email" class="join-form-control" id="m_email" name="m_email" required="required">
            </div>
            <div class="col-3">
				<button class="join-button" id="mail-Check-Btn" value="N">인증하기</button>
			</div>          	
        </div>
        <div class="form-group row">
        <div class="col-6 mail-check-box">
        	<input id="mail-Check-Input" class="join-form-control" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
        </div>
        <div class="col-3" id="msgbox">
            	<span id="mail-check-warn"></span>
        </div>
        </div>
		<div class="form-group row">
			<label class="col-form-label col-3">닉네임</label>
			<div class="col-6">
                <input type="text" class="join-form-control" id="m_nname" name="m_nname" required="required">
            </div>
            <div class="col-3">
			<button class="join-button nnameChk" type="button" id="nnameChk" onclick="fn_nnameChk();" value="N">중복확인</button>
			</div>       	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-3">핸드폰번호</label>
			<div class="col-6">
                <input type="text" class="join-form-control" id="tell" name="m_tell" placeholder="-을 넣어서 작성해주세요." required="required">
            </div>      	
        </div>
		<div class="form-group row">
			<div class="col-8 offset-4">
				<p><label class="form-check-label"><input type="checkbox" required="required" id=checkbox> 저는 <a href="${pageContext.request.contextPath}/terms/terms_list.do" class="orange">약관 및 정책</a>에 동의합니다.</label></p>
				<button type="submit" class="btn btn-primary btn-lg" id="submit">회원가입</button> 
			</div> 
		</div>		      
    </form>
	<div class="text-center">계정이 있으신가요? <a href="${pageContext.request.contextPath}/login.do">로그인</a></div>
</div>
</body>

</html>