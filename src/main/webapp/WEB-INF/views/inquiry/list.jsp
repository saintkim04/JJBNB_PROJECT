<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>

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
				<dt>더보기
				<dd><a href="${pageContext.request.contextPath}/notice/notice_list.do">공지사항</a></dd>
				<dd><a href="${pageContext.request.contextPath}/question/question_list.do">자주 묻는 질문</a></dd>
				<dd><a href="${pageContext.request.contextPath}/inquiry/inquiry_list.do"><span>1:1 문의</span></a></dd>
				<dd><a href="${pageContext.request.contextPath}/event/event_list.do">이벤트</a></dd>
				<dd><a href="${pageContext.request.contextPath}/terms/terms_list.do">약관 및 정책</a></dd>
			</dl>
		</nav>
		
		
		
		<section class="content">
			<div class="content-list">
				<ul class="content-list-tap">
					<li><a href="${pageContext.request.contextPath}/inquiry/inquiry_list.do"><h6><span>나의 문의내역&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></h6></a></li>
					<li><a href="${pageContext.request.contextPath}/inquiry/inquiry_write.do"><h6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;새 문의 작성</h6></a></li>
				</ul>
				<hr>
				
				<div class="list_none1" style="display: block;">
					<c:choose>
						<c:when test="${empty inquiryList}">
							<ul>
								<li><p><strong>등록된 1:1 문의가 없습니다.</strong></p></li>
							</ul>
						</c:when>
						
						<c:otherwise>
							<ul class="content-list-show comment a">
								<li>
									<c:forEach var="inquiryVo" items="${inquiryList}">
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
													
													<br><br>
													답변: ${fn:replace(inquiryVo.i_rcontent, replaceChar, "<br/>")}													
												</div>
											</div>
										</div>
									</c:forEach>
								</li>	
							</ul>
						</c:otherwise>
					</c:choose>
						
				</div>
				
				
				
				
			</div>
			
			
		</section>
		
		
		
	</main>

	<div class="footer-height">
		<%@include file="/resources/include/footer.jsp" %>
	</div>



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
		let moveForm = $("#moveForm");
		
		$(".pagination a").on("click", function(e){
			 
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "${pageContext.request.contextPath}/inquiry/inquiry_list.do");
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
			moveForm.submit();
			});
		</script>
		
		

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