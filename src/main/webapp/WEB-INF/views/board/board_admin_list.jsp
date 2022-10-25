<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<head>
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

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

  <!-- https://fontawesome.com/start -->
  <script src="https://kit.fontawesome.com/0b499a845d.js" crossorigin="anonymous"></script>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">

  <link href="${pageContext.request.contextPath}/resources/css/ksh/숙소관리.css" rel="stylesheet" />
    

</head>

<body id="page-top">

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
                        <li ><a class="dropdown-item" style="cursor:default;">${m_nname}</a></li>
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
 
<!-- 사이드바 -->
<main class="container main-box">

    <nav class="side-nav">
		<dl class="side-nav-title">
			<dt>관리자
			<dd><a href="${pageContext.request.contextPath}/admin/member_list.do">회원목록</a></dd>
			<dd><a href="${pageContext.request.contextPath}/notice/admin/notice_list.do">공지사항 관리</a></dd>
			<dd><a href="${pageContext.request.contextPath}/inquiry/admin/inquiry_list.do">1:1문의 관리</a></dd>
			<dd><a href="${pageContext.request.contextPath}/event/admin/event_list.do">이벤트 관리</a></dd>
			<dd><a href="${pageContext.request.contextPath}/board/board_admin_list.do"><span>숙소 관리</span></a></dd>
		</dl>
	</nav>
	
   <section class="content">
   
   </section>
	

   <!-- 숙소 목록 -->
   
   <section class="py-5">
    <h2>숙소관리</h2>
    <hr class="top-hr">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        	
        
        
        
      	<jsp:useBean id="now" class="java.util.Date" />
        <c:forEach var="boardVo" items="${boardList}">
            <div class="col mb-5" >
                <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/board/board_view.do?board_idx=${boardVo.board_idx}'" style="cursor:pointer;"><!--onclik이벤트로 링크 추가-->
                    <!-- Product image-->
                    <c:choose>
				    	  		<c:when test="${not empty boardVo.origin_filename1}">
				    	  			<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename1}"/>
				    	  		</c:when>
				    </c:choose>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <h5 class="fw-bolder">${boardVo.title}</h5>
                            <!-- Product price-->
                            <p>${boardVo.early_date}</p>
                            <strong>₩${boardVo.price}/박</strong>
                        </div>
                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                            <div class="bi-star-fill"></div>
                            <c:choose>
								<c:when test ="${boardVo.review_grade == 0}">
									&nbsp;&nbsp;
								</c:when>
				                                	
								<c:otherwise>
									&nbsp;&nbsp; ${boardVo.review_grade}
								</c:otherwise>
							</c:choose>
                        </div>
                    </div>
                    
                </div>
            </div>
            
            </c:forEach>
            
            
        
        </div>
    </div>
  
    <a href="${pageContext.request.contextPath}/board/board_write.do">
        <div class="notice-add">
           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
              <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
           </svg>
           등록
        </div>
     </a>
     
 
     
     
<!--페이지네이션추가 -->
<nav aria-label="Page navigation example">
    <ul id="pageInfo" class="pagination justify-content-center">
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
     
</section>

	<form id="moveForm" method="get">
   <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    <input type="hidden" name="amount" value="9">   
     <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
   </form>

<script>
var moveForm1 = $("#moveForm1");

$(".pagination a").on("click", function(e){
	 
    e.preventDefault();
    moveForm1.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm1.attr("action", "${pageContext.request.contextPath}/board/board_admin_list.do");
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







</main>


<!-- Footer-->
<%@include file="/resources/include/footer.jsp" %>


<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- SimpleLightbox plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
<!-- Core theme JS-->
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>


</body>
</html>