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
    
    
    <script>
	
	$(document).ready(function(){
		$("#write_ok").on("click", function(){

			var title = $('#questionTitle').val();
			var content = $("#questionTextarea").val();
			
			if(title == ""){
				alert("제목을 입력해 주세요.");
				$("#questionTitle").focus();
				return false;
			}else if(content == ""){
				alert("내용을 입력해 주세요.");
				$("#questionTextarea").focus();
				return false;
			}else if(confirm("공지사항을 등록하시겠습니까?")){
				$("#notice").submit();
				
			}

		})
		
		
	})
	
	
	</script>

</head>
<body>

	<%@include file="/resources/include/fix-header.jsp" %>
	
	<main class="container main-box">

		 <nav class="side-nav">
			<dl class="side-nav-title">
				<dt>관리자
				<dd><a href="${pageContext.request.contextPath}/admin/member_list.do">회원목록</a></dd>
				<dd><a href="${pageContext.request.contextPath}/notice/admin/notice_list.do"><span>공지사항 관리</span></a></dd>
				<dd><a href="${pageContext.request.contextPath}/inquiry/admin/inquiry_list.do">1:1문의 관리</a></dd>
				<dd><a href="${pageContext.request.contextPath}/event/admin/event_list.do">이벤트 관리</a></dd>
				<dd><a href="${pageContext.request.contextPath}/board/board_admin_list.do">숙소 관리</a></dd>
			</dl>
		</nav>
		
		<section class="content-notice">
			<form action="${pageContext.request.contextPath}/notice/notice_write_process.do" method="post" id="notice">
			<input type="hidden" name="m_idx" value="${m_idx}"/>	<!-- 멤버컨트롤러에 로그인쪽 m_idx가 있어야함 -->
				<div class="content-list">
					<ul>
						<li>
							<section class="text_wrap">
								<p>공지 제목</p>
							</section>
							<input type="text" class="text_type_1" id="questionTitle" placeholder="제목을 작성해주세요." name="n_title"/>
						</li>
					</ul>
					
					<ul>
						<section class="text_wrap">
							<p>공지 내용</p>
								<div>
									<textarea name="n_content" id="questionTextarea" placeholder="공지하실 내용을 10자 이상 입력해 주세요."></textarea>
								</div>
						</section>
					</ul>
				</div>
				<button id="write_ok" class="btn_red_fill" type="button">작성 완료</button>
			</form>
		</section>
	</main>
	
	<div class="footer-height">
		<%@include file="/resources/include/footer.jsp" %>
	</div>

</body>
</html>