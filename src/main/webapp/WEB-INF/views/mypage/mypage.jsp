<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JJBNB</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/jjh/style.css">
    <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
     <!-- 웹 폰트 -->
     <script src="https://kit.fontawesome.com/35e0a03178.js" crossorigin="anonymous"></script>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script type="text/javascript">
     $(document).ready(function(){
    	 $("#nname_modify").on("click", function(){
    		 
    		 var nname = $("#m_nname").val();
 			 var nnameChkVal = $("#nnameChk").val();
 			 
 			 if(nname == ""){
 				 alert("닉네임을 입력해주세요.");
 				$("#m_nname").focus();
 				return false;
 			 }else if(nnameChkVal == "N"){
 				alert("닉네임 중복확인 버튼을 눌러주세요.")	
				return false;
    	 	 }else{
    	 		$("#nname_regform").submit();
    	 	 }
    	 
    	 })
    	 
    	 $('#mail-Check-Btn').on("click",function(){
    			var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;    	 

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
						$("#mail-Check-Input").attr('disabled',false);
						code = data;
						alert("인증번호가 전송되었습니다.")
					}
				});
				}
			});
    	 
    	 $("#email_modify").on("click", function(){
    		 
    		 var email = $("#m_email").val();
    		 var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;    	 
    		 var emailChkVal = $("#mail-Check-Btn").val();
    		 
    		 if(email == ""){
    	 		 alert("이메일을 입력해주세요.");
    	 		$("#m_email").focus();
    	 		return false;
    	 	 }else if(!re.test(email)){
    	 		 alert("이메일 형식이 올바르지 않습니다.");
    	 		$("#m_email").focus();
    	 		return false;
    	 	 }else if(emailChkVal == "N"){
    	 		alert("이메일 인증을 진행해주세요.")
				return false;
    	 	 }else{
    	 		 $("#email_regform").submit();
    	 	 }
    	 }); 
    	 
    	 $("#mail-Check-Input").blur(function () {
					const inputCode = $(this).val();
					const $resultMsg = $('#mail-check-warn');
					
					if(inputCode === code){
						$resultMsg.html('인증번호가 일치합니다.');
						$resultMsg.css('color','#00ff00');
						$('#mail-Check-Btn').attr('disabled',true);
						$("#m_email").attr('readonly',true);
						$("#mail-Check-Input").attr('readonly',true);
						$("#mail-Check-Btn").attr("value", "Y");
					}else{
						$resultMsg.html('인증번호를 다시 확인해 주세요.');
						$resultMsg.css('color','#f4623a');
					}
				});
    	 
		 $("#tell-btn").on("click", function(){
		    		 
				 	var tell = $("#m_tell").val();
					var pattern= /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
		 			 
		 			 if(tell == ""){
		 				 alert("핸드폰번호를 입력해 주세요.");
		 				$("#m_tell").focus();
		 				return false;
		 			 }else if(!pattern.test(tell)){
							alert("핸드폰형식이 올바르지 않습니다.")
							$("#tell").focus();
							return false;
		    	 	 }else{
		    	 		$("#tell_regform").submit();
		    	 	 }
    	 })
    	 
    	 $("#pw-check-btn").on("click", function(){
    		 var pw = $("#pw-input").val();
    		 if(pw == ""){
    			 alert("현재 패스워드를 입력해 주세요.")
    			 return false;
    		 }else{
    			 $("#pwChk").submit();
 			} 
    	 })
    	 
    	 
    	 
    	 
    	 
     });
     
     
     
     
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
 					}
 				}
 			});	
 			
 		}
     
     
     </script>
</head>

<body>

	<%@include file="/resources/include/fix-header.jsp" %>

   <main class="container main-box">

       <nav class="side-nav">
         <dl class="side-nav-title">
            <dt>마이페이지
            <dd><a href="${pageContext.request.contextPath}/mypage.do"><span>내 정보 관리</span></a></dd>
            <dd><a href="${pageContext.request.contextPath}/reservation_list.do">예약내역</a></dd>
            <dd><a href="${pageContext.request.contextPath}/member_logout.do" onclick='return confirm("로그아웃 하시겠습니까?")'>로그아웃</a></dd>
         </dl>
      </nav>
      <section class="content">
        <div class="title">내 정보 관리</div>
        <hr/>
        <ul class="mypage">
            <li class="first">닉네임</li>
            <li class="second">${m_nname}</li>
            <form>
                <button id="nick-btn" class="btn" type="button">수정</button>
            </form>
            <div id="nick-modify" class="modify" style="display:none">
            <form action="${pageContext.request.contextPath}/nname_update.do" method="post" id="nname_regform">
                <input id="m_nname" name="m_nname" class="form-control" type="text" placeholder="${m_nname}">
				<button class="modify-button nnameChk" type="button" id="nnameChk" onclick="fn_nnameChk();" value="N">중복확인</button>
                <input type="hidden" id="m_id" name="m_id" value="${m_id}">
                <button type="submit" class="btn bg-orange" id="nname_modify">수정완료</button>
                <button id="nick-cancel" class="btn" type="button">수정취소</button>
            </form>
            </div>
            
        </ul>
        <ul class="mypage">
            <li class="first">이메일</li>
            <li class="second">${m_email}</li>
            <form>
                <button id="email-btn" class="btn" type="button">수정</button>
            </form>
            <div id="email-modify" class="modify" style="display:none">
            <form action="${pageContext.request.contextPath}/email_update.do" method="post" id="email_regform">
                <input id="m_email" name="m_email" class="form-control" type="text" placeholder="${m_email}">
                <input type="hidden" id="m_id" name="m_id" value="${m_id}">
                <button type="button" class="btn" id="mail-Check-Btn" value="N">인증하기</button>
                <div class="col-12">
        		<input id="mail-Check-Input" class="form-control" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
        		</div>
        		<div id="msgbox">
            	<span id="mail-check-warn"></span>
        		</div>
                <button type="submit" class="btn bg-orange" id="email_modify">수정완료</button>
                <button id="email-cancel" class="btn" type="button">수정취소</button>
            </form>
            </div>
        </ul>
        <ul class="mypage">
            <li class="first">핸드폰번호</li>
            <li class="second">${m_tell}</li>
            <form>
                <button id="phone-btn" class="btn" type="button">수정</button>
            </form>
            <div id="phone-modify" class="modify" style="display:none">
            <form action="${pageContext.request.contextPath}/tell_update.do" method="post" id="tell_regform">
                <input class="form-control" type="text" placeholder="-을 넣어서 작성해주세요." id="m_tell" name="m_tell">
                <input type="hidden" id="m_id" name="m_id" value="${m_id}">
                <button class="btn bg-orange" id="tell-btn">수정완료</button>
                <button id="phone-cancel" class="btn" type="button">수정취소</button>
            </form>
            </div>
        </ul>
        <ul class="mypage">
            <li class="first">비밀번호</li>
            <li class="second">********</li>
            <form>
                <button id="pw-btn" class="btn" type="button">수정</button>
            </form>
            <div id="pw-modify" class="modify" style="display:none">
	            <form action="${pageContext.request.contextPath}/pwChk.do" method="post" id="pwChk">
	            	<input type="hidden" id="m_id" name="m_id" value="${m_id}">
	            	<input id="pw-input" name="m_pw" class="form-control" type="password" placeholder="현재 비밀번호를 입력해 주세요.">
	                <button type=submit class="btn" id="pw-check-btn" value="N">비밀번호 확인</button>
	            </form>
            </div>
        </ul>
        
        <div class="mypage-a"><a href="${pageContext.request.contextPath}/member_logout.do" >로그아웃</a></div>
        <div class="mypage-a"><a href="#" >회원탈퇴</a></div>
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
<script src="resources/js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
      
    </body>
    </html>