<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>

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
				<dd><a href="${pageContext.request.contextPath}/inquiry/admin/inquiry_list.do">1:1문의 관리</a></dd>
				<dd><a href="${pageContext.request.contextPath}/event/admin/event_list.do">이벤트 관리</a></dd>
				<dd><a href="${pageContext.request.contextPath}/board/board_admin_list.do">숙소 관리</a></dd>
			</dl>
		</nav>

		<section class="content">
		<br><br>
			<div align="center"><font size=5> 회원정보 삭제 내역 </font></div> <br>
			<div align="center">
				<br><br>
				<table>
					<tr>
						<td>회원번호</td><td>회원아이디</td><td>이메일</td>
						<td>닉네임</td><td>전화번호</td><td>등급</td>
					</tr>
					
					<c:forEach var="memberVo" items="${deleteList}">
						
						<tr>
						<td>${memberVo.m_idx}</td>
						<td>${memberVo.m_id}</td>
						<td>${memberVo.m_email}</td> 
						<td>${memberVo.m_nname}</td>
						<td>${memberVo.m_tell}</td>
						<td>${memberVo.m_grade}</td>
						<!-- <td>${memberVo.modify_date}</td>  -->
					</tr>
					
					</c:forEach>
					
				
				</table>
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
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
</html>