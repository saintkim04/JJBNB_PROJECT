<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

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
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!-- 웹 폰트 -->
    <script src="https://kit.fontawesome.com/35e0a03178.js" crossorigin="anonymous"></script>
    
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet"/>
    
    

</head>
<body>
<%@include file="/resources/include/fix-header.jsp" %>


	<main class="container main-box">

		 <nav class="side-nav">
			<dl class="side-nav-title">
				<dt>관리자
				<dd><a href="${pageContext.request.contextPath}/admin/member_list.do">회원목록</a></dd>
				<dd><a href="${pageContext.request.contextPath}/notice/admin/notice_list.do">공지사항 관리</a></dd>
				<dd><a href="${pageContext.request.contextPath}/inquiry/admin/inquiry_list.do"><span>1:1문의 관리</span></a></dd>
				<dd><a href="${pageContext.request.contextPath}/event/admin/event_list.do">이벤트 관리</a></dd>
				<dd><a href="${pageContext.request.contextPath}/board/board_admin_list.do">숙소 관리</a></dd>
			</dl>
		</nav>
		<section class="content">
			<div class="content-list">
				<ul class="content-list-tap">
					<li><a href="${pageContext.request.contextPath}/inquiry/admin/inquiry_list.do"><h6><span>답변 대기중인 내역&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></h6></a></li>
					<li><a href="${pageContext.request.contextPath}/inquiry/admin/inquiry_answer_list.do"><h6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;답변완료 내역</h6></a></li>
				</ul>
				<hr>
				<form id="regform" action="${pageContext.request.contextPath}/inquiry/admin/inquiry_answer_process.do?i_idx=${inquiryVo.i_idx}" method="post">
				<input type="hidden" name="m_idx" value="${m_idx}"/>	<!-- 멤버컨트롤러에 로그인쪽 m_idx가 있어야함 -->
					<div class="inquiry-content">
						<ul>
							<li>
								<section class="text_wrap">
									<p>문의 아이디</p>
									
									<div>
										${inquiryVo.m_nname}
									</div>
								</section>
							</li>
						</ul>
					
						<ul>
							<li>
								<section class="text_wrap">
									<p>문의 제목</p>
									
									<div>
										${inquiryVo.i_title}
									</div>
								</section>
							</li>
						</ul>
						
						<ul>
							<section class="text_wrap">
								<p>문의 내용</p>
								
								<div>
									${inquiryVo.i_content}
								</div>
							</section>
						</ul>
						
						<ul>
							<section class="text_wrap">
								<p>문의 답변</p>
								
								<div>
									<textarea id="content" name="i_rcontent" id="questionTextarea" placeholder="문의 답변 내용을 입력해 주세요."></textarea>
								</div>
							</section>
						</ul>
					</div>
					<button id="reg" class="btn_red_fill" type="submit" onclick="">작성 완료</button>
				</form>
				
			</div>
			
			
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
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    
	<script>
    	$(document).ready(function(){
    		$("#reg").click(function(){
    			if(confirm("답변을 등록하시겠습니까?")){
    				$("#regform").submit();
    			}
    		})
    	})
	
	</script> 


</body>


</html>