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
				
				<div class="list_none1" style="display: block;">
					<c:choose>
						<c:when test="${empty answeredList}">
							<ul>
								<li><p><strong>대기중인 1:1문의 내역이 없습니다.</strong></p></li>
							</ul>
						</c:when>
						
						<c:otherwise>
	
							<ul class="content-list-show comment a">
								<li>
									<c:forEach var="inquiryVo" items="${answeredList}">
										<a href="javascript:;" style="text-decoration:none;" onclick="JavaScript: open_detail('${inquiryVo.i_idx}');">
											<div class="content-button">
											
											<div class="notice-delete">
												${inquiryVo.i_ryn}
											</div>
															
												<p><strong>[${inquiryVo.i_inq_type}] ${inquiryVo.i_title}</strong></p>
												<span>등록일: ${inquiryVo.i_wdate} </span><br>
												<span>답변일: ${inquiryVo.i_rdate}</span>
												
												
												
												<div class="content-button-1">
													<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-down-square" viewBox="0 0 16 16">
														<path d="M3.626 6.832A.5.5 0 0 1 4 6h8a.5.5 0 0 1 .374.832l-4 4.5a.5.5 0 0 1-.748 0l-4-4.5z"/>
														<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2z"/>
													</svg>
												</div>
											</div>
										</a>				
										
										
										<div id="review${inquiryVo.i_idx}" style="display:none;">    
											<div class="content-list-show-a" style="display: block;">
												<div style="font-size:13px; font-family: Malgun Gothic;">
													${fn:replace(inquiryVo.i_content, replaceChar, "<br/>")}
													<div class="answer">
														<a href="${pageContext.request.contextPath}/inquiry/admin/inquiry_answer.do?i_idx=${inquiryVo.i_idx}">답변하기</a>
													</div>
												</div>
												
											</div>
										</div>
									</c:forEach>
								</li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				
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
			moveForm1.attr("action", "${pageContext.request.contextPath}/inquiry/admin/inquiry_list.do");
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