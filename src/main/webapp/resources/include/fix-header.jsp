<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <!-- Navigation-->
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
    
      <form id="moveForm" method="get">
   <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    <input type="hidden" name="amount" value="9">   
     <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
   </form>
   
    

<script>

$(function(){
   var moveForm = $("#moveForm");
   
   $(".pagination a").on("click", function(e){
       e.preventDefault();
       moveForm.find("input[name='pageNum']").val($(this).attr("href"));
       moveForm.attr("action", "${pageContext.request.contextPath}/board/board_list.do");
       moveForm.submit();
       
   
   });

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