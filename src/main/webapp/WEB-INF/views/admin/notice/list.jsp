<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>


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

	<!-- Navigation-->

    <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">JJBNB</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto my-2 my-lg-0">
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search" id="search" name="keyword" value="${pageMaker.cri.keyword }">
                        <button class="btn" type="submit"><i class="bi bi-search"></i></button>
                    	</form>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/board_list.do">숙소</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="cursor:default;">
                            더보기
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice/notice_list.do">공지사항</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/question/question_list.do">자주 묻는 질문</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/inquiry/inquiry_list.do">1:1문의</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/event/event_list.do">이벤트</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/terms/terms_list.do">약관 및 정책</a></li>
                        </ul>
                    </li>
                   
                    <c:choose>
         <c:when test="${empty m_id}">
            <!-- 일반사용자 -->
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login.do">로그인</a></li>
                 
                 </c:when>
         <c:otherwise>
            <c:choose>
               <c:when test="${m_grade eq 0}">
                  <!-- 일반회원 -->
                  <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="cursor:default;">
                            <i class="fa-solid fa-face-laugh-beam"></i> <i class="fa-solid fa-caret-down"></i>
                        </a>
                    <ul class="dropdown-menu">
                        <li ><a class="dropdown-item">${m_nname}</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage.do">내 정보</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/reservation_list.do">예약내역</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member_logout.do" onclick='return confirm("로그아웃 하시겠습니까?")'>로그아웃</a></li>
                    </ul>
                  
            </c:when>
               <c:otherwise>
                  <!-- 관리자 -->
                  <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="cursor:default;">
                            <i class="fa-solid fa-crown"></i> <i class="fa-solid fa-caret-down"></i>
                        </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item nick" href="#" style="cursor:default;">관리자</a></li>
                        <hr/>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/member_list.do">회원목록</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice/admin/notice_list.do">공지사항 관리</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/inquiry/admin/inquiry_list.do">1:1문의 관리</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/event/admin/event_list.do">이벤트 관리</a></li>
                         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/board_admin_list.do">숙소 관리</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member_logout.do">로그아웃</a></li>
                    </ul>
                    
                </li>
                  
            </c:otherwise>
            </c:choose>
         </c:otherwise>
      </c:choose>
      
                </ul>
            </div>
        </div>
    </nav>


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


		<section class="content">
			<div class="content-list">
				<ul class="content-list-show comment a">
					<li><h2>공지사항 관리</h2></li>
					<li class="btn_notice_insert">
						<a href="${pageContext.request.contextPath}/notice/notice_write.do">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
								<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
							</svg>
							공지사항 등록하기
						</a>
					</li>
					<li>
						<c:forEach var="noticeVo" items="${noticeList}">
						
							<div class="content-button">
							
								<div class="notice-delete">
										<a href="${pageContext.request.contextPath}/notice/notice_delete_process.do?n_idx=${noticeVo.n_idx}" onclick='return confirm("공지사항을 삭제하시겠습니까?")'>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
												<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
												<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
											</svg>삭제
										</a>
								</div>
								
								<div class="notice-edit">
									<a href="${pageContext.request.contextPath}/notice/notice_modify.do?n_idx=${noticeVo.n_idx}">
										수정
									</a>
								</div>
								
								
								<p><strong>${noticeVo.n_title}</strong></p>	
								<span>등록일: ${noticeVo.n_date}</span>
								<a href="JavaScript:;" onclick="JavaScript: open_detail('${noticeVo.n_idx}');">
									<div class="content-button-1">
										내용보기
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-down-square" viewBox="0 0 16 16">
											<path d="M3.626 6.832A.5.5 0 0 1 4 6h8a.5.5 0 0 1 .374.832l-4 4.5a.5.5 0 0 1-.748 0l-4-4.5z"/>
											<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2z"/>
										</svg>
									</div>
								</a>
							</div>
						
						
						
						<div id="review${noticeVo.n_idx}" style="display:none;">    
							<div class="content-list-show-a" style="display: block;">
								<div style="font-size:13px; font-family: Malgun Gothic;">${fn:replace(noticeVo.n_content, replaceChar, "<br/>")}
									
								</div>
							</div>
						</div>
						
						</c:forEach>
					</li>
					
					<li>
					<!--페이지네이션추가 -->
						<nav aria-label="Page navigation example">
							<ul id="pageInfo" class="pagination justify-content-center pagingJS">
							
								<!-- 이전페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<li class="page-item previous"><a class="page-link" href="${pageMaker.startPage-1}">&lt;</a></li>
						  		</c:if>
						  		
								<!-- 각 번호 페이지 버튼 -->
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }"><a class="page-link" href="${num}">${num}</a></li>
								</c:forEach>
								
								<!-- 다음페이지 버튼 -->
								<c:if test="${pageMaker.next}">
									<li class="page-item next"><a class="page-link" href="${pageMaker.endPage + 1 }">&gt;</a></li>
								</c:if>  
								 
							</ul>
						</nav>
						
						
						<form id="moveForm1" method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						</form> 
					</li>
				</ul>
			</div>
		</section>

		<form id="moveForm" method="get">
		   <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		    <input type="hidden" name="amount" value="9">   
		     <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		   </form>

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
    
    
    
	<script type="text/javascript">
		
		function open_detail(obj){
			var reset = document.getElementsByClassName("comment a").length;
			//alert(reset);
		
			for(i=1; i <= reset; i++){
				//alert(document.getElementById('review' + i) + ", " + document.getElementById('review_re' + i));
				//document.getElementById('review'+ i).style.display = 'none';
				//document.getElementById('review_re'+ i).style.display = 'none';
		
		
			}
				//alert(document.getElementById('review'+ obj).style.display);
				if (document.getElementById('review'+ obj).style.display == "")
				{
					document.getElementById('review'+ obj).style.display = 'none';
					document.getElementById('review_re'+ obj).style.display = 'none';
		
				}else{
					document.getElementById('review'+ obj).style.display = '';
					document.getElementById('review_re'+ obj).style.display = '';
				}
			//document.getElementById('review'+ obj).style.display = '';
			//document.getElementById('review_re'+ obj).style.display = '';
		}	
		
		</script>
		
		<script>
		let moveForm1 = $("#moveForm1");
		
		$(".pagination a").on("click", function(e){
			 
			e.preventDefault();
			moveForm1.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm1.attr("action", "${pageContext.request.contextPath}/notice/admin/notice_list.do");
			moveForm1.submit();
			
			
		});
		</script>
		
		<script>
		var moveForm = $("#moveForm");
		$(".d-flex button").on("click", function(e){
		    e.preventDefault();
		    var val = $("input[name='keyword']").val();
		    moveForm.attr("action", "${pageContext.request.contextPath}/board/board_list.do");
		    moveForm.find("input[name='keyword']").val(val);
		    moveForm.find("input[name='pageNum']").val(1);
		    moveForm.submit();
		    });
		</script>
		

        
    


</body>


</html>