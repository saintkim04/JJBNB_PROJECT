<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>JJBNB</title>
    <!-- 웹 폰트 -->
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
    <link href="${pageContext.request.contextPath}/resources/css/ksh/숙소.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>

<body id="page-top">

<%@include file="/resources/include/fix-header.jsp" %>


    <!--숙소 템플릿 추가-->
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
               
                
                <jsp:useBean id="now" class="java.util.Date" />
                <c:forEach var="boardVo" items="${boardList}">
                <div class="col mb-5">
                    <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/board/board_view.do?board_idx=${boardVo.board_idx}'" style="cursor:pointer;">
                        <!-- Product image-->
                        <c:choose>
				    	  		<c:when test="${not empty boardVo.origin_filename1}">
				    	  			<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename1}"/>
				    	  		</c:when>
				    	</c:choose>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <h5 class="fw-bolder" style="width:250px; text-align:left;">${boardVo.title}</h5>
                                <!-- Product price-->
                                <p style="width:220px; text-align:left;">${boardVo.early_date}</p>
                                <p class="price_strong">₩${boardVo.price}/박</p>
                            </div>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2" >
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

          <form id="moveForm" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    <input type="hidden" name="amount" value="${pageMaker.cri.amount }">   
     <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>
    </section>
   
    

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
$(".d-flex button").on("click", function(e){
    e.preventDefault();
    let val = $("input[name='keyword']").val();
    moveForm.attr("action", "${pageContext.request.contextPath}/board/board_list.do");
    moveForm.find("input[name='keyword']").val(val);
    moveForm.find("input[name='pageNum']").val(1);
    moveForm.submit();
    });
</script>
   

  

			
			    
		










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
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>


</body>

</html>