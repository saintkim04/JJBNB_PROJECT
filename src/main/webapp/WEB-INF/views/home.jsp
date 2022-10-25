<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>JJBNB</title>
    <!-- 웹폰트 -->
    <script src="https://kit.fontawesome.com/35e0a03178.js" crossorigin="anonymous"></script>
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
    <link href="${pageContext.request.contextPath}/resources/css/homestyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>

<body id="page-top">
     <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">JJBNB</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto my-2 my-lg-0">
                    <form class="d-flex search_area" role="search">
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
         <c:when test="${m_grade eq 2}">
            	
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
               <!-- 일반사용자 -->
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login.do">로그인</a></li>
                 
                  
            </c:otherwise>
            </c:choose>
         </c:otherwise>
      </c:choose>  
                   
                </ul>
            </div>
        </div>
    </nav>


    <form id="moveForm" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    <input type="hidden" name="amount" value="${pageMaker.cri.amount }">   
     <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>

<script>
let moveForm = $("#moveForm");

$(".pagination a").on("click", function(e){
	 
    e.preventDefault();
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm.attr("action", "${pageContext.request.contextPath}/board/board_list.do");
    moveForm.submit();
    

});
</script>

<script>
$(".search_area button").on("click", function(e){
	console.log("test")
    e.preventDefault();
    let val = $("input[name='keyword']").val();
    moveForm.find("input[name='keyword']").val(val);
    moveForm.find("input[name='pageNum']").val(1);
    moveForm.attr("action", "${pageContext.request.contextPath}/board/board_list.do");
    moveForm.submit();
    });
</script>


    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <header class="masthead1">
                    <div class="container px-4 px-lg-5 h-100 aaa">
                        <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center slidetxt">
                            <div class="col-lg-8 align-self-end">
                                <h1 class="text-black font-weight-bold">만월</h1>
                            </div>
                            <div class="col-lg-8 align-self-baseline">
                                <p class="text-black-75 mb-5" OnClick="location.href ='${pageContext.request.contextPath}/board/board_view.do?board_idx=4'" style="cursor: pointer;">READ MORE&nbsp; ></p>
                            </div>
                        </div>
                    </div>
                </header>
            </div>
            <div class="carousel-item">
                <header class="masthead2">
                    <div class="container px-4 px-lg-5 h-100 aaa">
                        <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center slidetxt">
                            <div class="col-lg-8 align-self-end">
                                <h1 class="text-white font-weight-bold">소유</h1>
                            </div>
                            <div class="col-lg-8 align-self-baseline">
                                <p class="text-white-75 mb-5" OnClick="location.href ='${pageContext.request.contextPath}/board/board_view.do?board_idx=2'" style="cursor: pointer;">READ MORE&nbsp; ></p>
                            </div>
                        </div>
                    </div>
                </header>
                
            </div>
            <div class="carousel-item">
                <header class="masthead3">
                    <div class="container px-4 px-lg-5 h-100 aaa">
                        <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center slidetxt">
                            <div class="col-lg-8 align-self-end">
                                <h1 class="text-white font-weight-bold">스테이</h1>
                            </div>
                            <div class="col-lg-8 align-self-baseline">
                                <p class="text-white-75 mb-5" OnClick="location.href ='${pageContext.request.contextPath}/board/board_view.do?board_idx=3'" style="cursor: pointer;">READ MORE&nbsp;></p>
                            </div>
                        </div>
                    </div>
                </header>
                
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <h2 class="text-center mt-0">VIEW MORE</h2>
    <hr class="divider" />
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
               
                
                <jsp:useBean id="no" class="java.util.Date" />
                <c:forEach var="boardVo" items="${boardList}">
                <div class="col mb-5">
                    <div class="card h-100" onclick="location.href='${pageContext.request.contextPath}/board/board_view.do?board_idx=${boardVo.board_idx}'" style="cursor:pointer;">
                        <!-- Product image-->
                        <c:choose>
				    	  		<c:when test="${not empty boardVo.origin_filename1}">
				    	  			<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename1}"/>
				    	  		</c:when>
				    	</c:choose>
                       
                    </div>
                </div>
                </c:forEach>
                
             
            </div>
        </div>
        </section>
    

    <!--Event-->
    <h2 id="event" class="text-center mt-0">EVENT</h2>
    <hr class="divider" />
    <div class="container">
        <div class="row">
            <div class=".col-lg-12">
                <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active ">
                            <img src="resources/assets/img/event1.jpg" class="d-block w-100 eventimage" OnClick="location.href ='${pageContext.request.contextPath}/event/event_view.do?e_idx=12'" style="cursor:pointer;">
                        </div>
                        <div class="carousel-item">
                            <img src="resources/assets/img/event2.jpg" class="d-block w-100 eventimage" OnClick="location.href ='${pageContext.request.contextPath}/event/event_view.do?e_idx=13'" style="cursor:pointer;">
                        </div>
                        <div class="carousel-item">
                            <img src="resources/assets/img/event3.jpg" class="d-block w-100 eventimage" OnClick="location.href ='${pageContext.request.contextPath}/event/event_view.do?e_idx=14'" style="cursor:pointer;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer-->
    <footer class="bg-light py-5">
        <div class="container px-4 px-lg-5">
            <div class="small text-center text-muted">
                    <div class="info">
                        <dl>
                            <dt>JJBNB</dt>
                            <dd>572, Baekje-daero, Deokjin-gu, Jeonju-si, Jeollabuk-do, Korea</dd>
                            <dd>JJBNB@naver.com</dd>
                            <dd>Tel : 010-1234-5678</dd>
                            <dd>Fax : 063-123-4567</dd>
                        </dl>
                    </div><!--//info-->
                <hr/>
            <div class="copyright">
                <p>Copyright $copy; <strong>JJBNB</strong> All Rights Reserved.</p>
            </div><!--//copyright-->
            </div>
        </div>
    </footer>
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