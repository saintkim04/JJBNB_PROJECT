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

<link href="${pageContext.request.contextPath}/resources/css/ksh/숙소상세.css" rel="stylesheet" />
  
	<script>
	
	$(document).ready(function(){
		$("#write_ok").on("click", function(){

			var star = $('#rate1');
			var content = $("#reviewContents").val();
			
			if($(':radio[name="re_grade"]:checked').length < 1){
				alert("별점을 선택해주세요.");
				star.focus();
				return false;
			}else if(content == ""){
				alert("내용을 입력해 주세요.");
				$("#reviewContents").focus();
				return false;
			}else if($("#reviewContents").val().length >= 100){
				alert("100자 이내로 작성바랍니다.");
				return false;
			}else if(confirm("리뷰를 등록하시겠습니까?")){
				$("#myform").submit();
			}

		})
		
		
	})
	
	
	</script>

</head>

<body id="page-top">
<%@include file="/resources/include/fix-header.jsp" %>


<nav class="main-acom-container">
	<input type="hidden" name="board_idx" value="${boardVo.board_idx }"/>
	<div class="title">
    	<h2>${boardVo.title}</h2>
    	<hr class="divider" />
    	<c:choose>
			<c:when test="${empty m_id}">
			<!-- 일반사용자 -->
			
			</c:when>
		
			<c:otherwise>
				<c:choose>
					<c:when test="${m_grade eq 0}">
						<!-- 일반회원 -->
						
					</c:when>
					
					<c:otherwise>
						<!-- 관리자 -->
						<div class="btnM-R">
							<button id="btn-modify" class="btn btn-danger">수정</button>
							<button id="btn-remove" class="btn btn-danger">삭제</button>
						</div>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>  
	</div>

	<script>
	//삭제 버튼 누르면 삭제할 것이냐고 묻고 삭제한다고 하면 주소이동(BoardController의 remove 메소드 호출)
	$(function(){
		$('#btn-remove').click(function(){
			if(confirm("삭제 하시겠습니까?")){
				self.location.href = "${pageContext.request.contextPath}/board/delete.do?board_idx=${boardVo.board_idx}";
			}
		});
		$('#btn-modify').click(function(){
			if(confirm("수정 페이지로 이동하시겠습니까?")){
				self.location.href = "${pageContext.request.contextPath}/board/board_admin_modify.do?board_idx=${boardVo.board_idx}";
			}
		});
	});
	</script>

	<!-- Swiper -->
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename1}"/>
			</div>
			<div class="swiper-slide">
				<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename2}"/>
			</div>
			<div class="swiper-slide">
				<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename3}"/>
			</div>
			<div class="swiper-slide">
				<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename4}"/>
			</div>
		</div>
		<div class="swiper-pagination"></div>
	</div>

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	
	<!-- Initialize Swiper -->
	<script>
	var swiper = new Swiper(".mySwiper", {
		
		effect: "cube",
		grabCursor: true,
		cubeEffect: {
		shadow: true,
		slideShadows: true,
		shadowOffset: 20,
		shadowScale: 0.94,
		},
		pagination: {
		el: ".swiper-pagination",
		},
	});
	</script>
		<div class="tong">
			<div class="info">
				<i class="fa-solid fa-location-dot"></i>&nbsp;<strong>훌륭한 숙소 위치</strong>
				<p class="p-con">최근 숙박한 게스트 중 ${boardVo.accommGrade}%가 위치에 별점 ${boardVo.accommStar}점을 준 숙소입니다.</p>
				<i class="fa-solid fa-key">&nbsp;</i><strong>순조로운 체크인 과정</strong>
				<p class="p-con">최근 숙박한 게스트 중 ${boardVo.accommGradeCheck}%가 체크인 과정에 별점 ${boardVo.accommStarCheck}점을 준 숙소입니다.</p>
				<i class="fa-solid fa-calendar-check"></i>&nbsp;<strong>${boardVo.deleteDate} 전까지 무료로 취소하실 수 있습니다.</strong>
				<hr>
				<h5>숙박 장소</h5>
				<div class="place-to-stay1">
					<i class="${boardVo.iconCheck}"></i>&nbsp;<p><strong>${boardVo.accommPlace}</strong></p>
					<p class="p-con">${boardVo.accommPlace2} ${boardVo.accommPlace3}</p>
				</div>
				<div class="place-to-stay2">
					<i class="${boardVo.iconCheck2}"></i>&nbsp;<p><strong>${boardVo.accommPlace4}</strong></p>
					<p class="p-con">${boardVo.accommPlace5} ${boardVo.accommPlace6}</p>
				</div>
			</div>
			<div class="info1">
				<hr>
				<h5>편의 시설</h5>
				<div class="place-to-stay3">
					<p class="p-con">${boardVo.convenience}</p>
					<p class="p-con">${boardVo.convenience2}</p>
					<p class="p-con">${boardVo.convenience3}</p>
					<p class="p-con">${boardVo.convenience4}</p>
				</div>
				<div class="place-to-stay4">
					<p class="p-con">${boardVo.convenience5}</p>
					<p class="p-con">${boardVo.convenience6}</p>
					<p class="p-con">${boardVo.convenience7}</p>
					<p class="p-con">${boardVo.convenience8}</p>
				</div>
			</div>
		</div>
	<form class="tong1" style="height:450px;" action="${pageContext.request.contextPath}/board/reservation.do" id="regForm" method="post">
	   <input type="hidden" id="board_idx" name="board_idx" value="${boardVo.board_idx}"/>
	   <input type="hidden" id="m_idx" name="m_idx" value="${m_idx}"/>
	   <h5><strong>₩${boardVo.price}</strong>/박</h5>
	   <div class="d-flex1 justify-content-center small text-warning mb-2">
	      <div class="bi-star-fill">
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
	   <div class="check-box">
	      <div class="check1"><input class="btn-1" type="text" name="r_sdate" id="r_sdate" size="12" onchange="call()"  placeholder="체크인" readonly value=""/></div>
	      <div class="check2"><input class="btn-1" type="text" name="r_edate" id="r_edate" size="12" onchange="call()" placeholder="체크아웃" readonly value=""/></div>
	   </div>
	   <hr/>
	   <p class="p1">₩${boardVo.price} x 1박</p>
	   <p class="p2">₩${boardVo.price}</p>
	   <p class="p1">청소비</p>
	   <p class="p2">₩${boardVo.cleaningFee}</p>
	   <p class="p1">서비스 수수료</p>
	   <p class="p2">₩${boardVo.commission}</p>
	   <p class="p1">최대인원</p>
	   <p class="p2">${boardVo.maxPeople}</p>
	    
	   <hr/>
	   <p class="p3">총 합계</p>
	   <p class="p4">
	   		<input type="text" id="r_cost" size="10" name="r_cost" readonly/> 원
	   </p>
	   <input id="reservation_btn" class="w-btn w-btn-red" type="button" value="예약하기">
	   <p class="pp">예약 확정 전에는 요금이 청구되지 않습니다.</p>
  	</form>



		<div class="view-container view-containerW">
			<button id="a" class="btn-wide" type="button" style="color:#f4623a;">숙소 사진</button>
			<button id="b" class="btn-wide" type="button" >숙소 정보</button>
			<button id="c" class="btn-wide" type="button" >숙소 리뷰</button>
		    
			<div id="myDIV" class="accom-img">
				<div class="view1">
					<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename5}" style="width: 905px; height:400px;"/>
				</div>
				<div class="view2">
					<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename6}" style="width: 450px; height:200px;"/>
				</div>
				<div class="view3">
	     		   <img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename7}" style="width: 450px; height:200px;"/>
				</div>
				<div class="view4">
					<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename8}" style="width: 905px; height:400px;"/>
				</div>
				<div class="view5">
					<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename9}" style="width: 450px; height:200px;"/>
				</div>
				<div class="view6">
					<img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename10}" style="width: 450px; height:200px;"/>
				</div>
			</div>
    
		<!--지도삽입-->
		<div class="accom-info" id="myDIV1" style="display:none;">
			<div class="list-info">
				<p>주변정보</p>
				<li>${boardVo.accommContent}</li>
				<li>${boardVo.accommContent2}</li>
				<li>${boardVo.accommContent3}</li>
			</div>
			<div class="list-info">
				<p>기본정보</p>
				<li>체크인 : 15:00 | 체크아웃 : 11:00</li>
				<li>무료 Wi-Fi</li>
				<li>전 객실 금연</li>
				<li>주차 가능 (무료 / 객실 당 1대)</li>
				<li>[그린 캠페인] 플라스틱 없는 호텔 만들기로 기본 욕실 어메니티 3종(샴푸, 린스, 바디워시) 이외에 1회 용품은 제공하지 않습니다</li>
			</div>
			<div class="list-info">
				<p>인원 추가 정보</p>
				<li><strong>최대인원 초과불가 (영유아 인원수 포함)</strong></li>
				<li>숙소는 2인 기준으로 세팅되어 있으며, 1인 추가 시 22,000원/박당 현장 결제입니다</li>
			</div>
			<div class="list-info">
				<p>취소 및 환불 규정</p>
				<li>체크인일 기준 3일 전까지 : 100% 환불</li>
				<li>체크인일 기준 2일 전까지 : 최초 1일 숙박 요금의 70% 환불</li>
				<li>체크인일 기준 1일 전까지 : 최초 1일 숙박 요금의 50% 환불</li>
				<li>체크인일 당일 및 No-Show : 최초 1일 숙박 요금 환불불가</li>
				<li>단, [단독특가] 객실 : 체크인일 기준 3일 전~당일 및 No-Show : 취소,변경, 환불불가</li>
				<li>취소, 환불시 수수료가 발생할 수 있습니다</li>
			</div>
			<div class="map1">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3234.058154973129!2d127.11970631511007!3d35.8475775284386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35703cca334595c3%3A0xeb7843e34ff562ef!2z642V7KeE6rO17JuQ!5e0!3m2!1sko!2skr!4v1662517007245!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>
			
		</div>
    
    
    
    
		<article id="review" class="review on accom-review" style="display:none;">
			<div class="score_top">
			
				<c:choose>
					<c:when test="${empty reviewList}">
						<ul>
							<li><p><strong>등록된 리뷰가 없습니다.</strong></p></li>
						</ul>
					</c:when>
					
				<c:otherwise>
 					<c:forEach var="reviewVo" items="${reviewList}">
						<div id="myDIV2" class="re_no${reviewVo.re_idx}">
							<ul class="review-line">
								<li>
									<div class="guest">
										<p class="pic"><img src="${reviewVo.re_image}" alt=""></p>
										<strong>${reviewVo.re_writer}</strong>
										
										<c:choose>
											<c:when test="${m_grade eq 2}">
												<div id="btn-delete"class="btn_review_delete">
													<a href="${pageContext.request.contextPath}/board/review_delete_process.do?re_idx=${reviewVo.re_idx}&board_idx=${reviewVo.board_idx}" onclick='return confirm("리뷰를 삭제하시겠습니까?")'>
														<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
															<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
															<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
														</svg>
													</a>
												</div>
											</c:when>
											
											<c:otherwise>
												<c:choose>
													<c:when test="${m_grade eq 0 && m_idx == reviewVo.m_idx}">
														<div id="btn-delete"class="btn_review_delete">
															<a href="${pageContext.request.contextPath}/board/review_delete_process.do?re_idx=${reviewVo.re_idx}&board_idx=${reviewVo.board_idx}" onclick='return confirm("리뷰를 삭제하시겠습니까?")'>
																<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
																	<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
																	<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
																</svg>
															</a>
														</div>
													</c:when>
												</c:choose>
											</c:otherwise>
										</c:choose>
										
										<div class="score_wrap_sm">
											<div class="score_star star_${reviewVo.re_grade}"></div>
											<div class="num">${reviewVo.re_grade}</div>
										</div>
										
										<div class="txt">
											${reviewVo.re_content}
										</div>
										<span class="date">${reviewVo.re_wdate}</span>
									</div>
								</li>
					    	</ul>
					    </div>
				    </c:forEach>
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
		
		
		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="board_idx" value="${boardVo.board_idx}">
		</form>
		    
	    <!-- 관리자 -->
			<c:choose>

				<c:when test="${m_grade eq 2}">
					<form action="${pageContext.request.contextPath}/board/review_process.do?board_idx=${boardVo.board_idx}" class="mb-3" name="myform" id="myform" method="post">
						<input type="hidden" name="m_idx" value="${m_idx}"/>
						<input type="hidden" name="board_idx" value="${boardVo.board_idx}">
						<input type="hidden" name="re_writer" value="${m_nname}"/>
						<fieldset id="star">
							<span class="text-bold"></span>
							<input type="radio" name="re_grade" value="5" id="rate1"><label
								for="rate1">★</label>
							<input type="radio" name="re_grade" value="4" id="rate2"><label
								for="rate2">★</label>
							<input type="radio" name="re_grade" value="3" id="rate3"><label
								for="rate3">★</label>
							<input type="radio" name="re_grade" value="2" id="rate4"><label
								for="rate4">★</label>
							<input type="radio" name="re_grade" value="1" id="rate5"><label
								for="rate5">★</label>
						</fieldset>
						
						<div>
							<textarea class="col-auto form-control" type="text" id="reviewContents" name="re_content"
									  placeholder="여행은 즐거우셨나요? 후기를 등록해주세요!"></textarea>
						</div>
						<button class="btn_red_fill" type="button" id="write_ok">리뷰 등록하기</button>
					</form>
				</c:when>
				
				<c:when test="${empty m_grade}">
					
				</c:when>
				
				<c:otherwise>
					<form action="${pageContext.request.contextPath}/board/review_process.do?board_idx=${boardVo.board_idx}" class="mb-3" name="myform" id="myform" method="post">
						<input type="hidden" name="m_idx" value="${m_idx}"/>
						<input type="hidden" name="re_writer" value="${m_nname}"/>
						<fieldset id="star">
							<span class="text-bold"></span>
							<input type="radio" name="re_grade" value="5" id="rate1"><label
								for="rate1">★</label>
							<input type="radio" name="re_grade" value="4" id="rate2"><label
								for="rate2">★</label>
							<input type="radio" name="re_grade" value="3" id="rate3"><label
								for="rate3">★</label>
							<input type="radio" name="re_grade" value="2" id="rate4"><label
								for="rate4">★</label>
							<input type="radio" name="re_grade" value="1" id="rate5"><label
								for="rate5">★</label>
						</fieldset>
						<div>
							<textarea class="col-auto form-control" type="text" id="reviewContents" name="re_content"
									  placeholder="여행은 즐거우셨나요? 후기를 등록해주세요!"></textarea>
						</div>
						<button class="btn_red_fill" type="button" id="write_ok">리뷰 등록하기</button>
					</form>
				</c:otherwise>
			</c:choose>
		</article>
	</div>
</nav>

 <script>
      $(document).ready(function() {
         $("#reservation_btn").on("click", function(){
            var r_sdate = $("#r_sdate").val();
            var r_edate = $("#r_edate").val();
            var m_idx = $("#m_idx").val();
            
            if(m_idx == ""){
               alert("로그인을 해주세요.");
               location.href ="${pageContext.request.contextPath}/login.do";
               return false;
            }else if(r_sdate == ""){
               alert("체크인 날짜를 설정해 주세요.");
               return false;
            }else if(r_edate == ""){
               alert("체크아웃 날짜를 설정해 주세요.");
               return false;
            }else{
               $("#regForm").submit();
            }
         })
      })
   
   </script>

   <!--캘린더-->
  <script>
    $(document).ready(function() {
       
        $("#r_sdate").datepicker({
        showOn:"button" , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
        ,buttonImageOnly: true
        ,dateFormat:"yy-mm-dd"
        ,nextText:"다음"
        ,prevText:"이전"
        ,dayNamesMin : ['월','화','수','목','금','토','일']
        ,monthNamesShort:  [ "1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월" ]
        ,showOtherMonths:true
        ,minDate:0
        ,beforeShowDay: disableAllTheseDays 
        ,onClose: function( selectedDate ) {    
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            var tempdate = new Date(selectedDate);
            
            tempdate.setDate(tempdate.getDate()+1);
            
            
            var tempyear = tempdate.getFullYear();
            var tempmonth = tempdate.getMonth()+1;
            var tempday = tempdate.getDate();
            
            
            $("#r_edate").datepicker( "option", "minDate", tempyear+"-"+tempmonth+"-"+tempday);
        }
        });
        
     // 특정날짜들 배열
      
        
     // 특정일 선택막기
         function disableAllTheseDays(date) {
       
            var dateRange = [];
         var dateString = jQuery.datepicker.formatDate('yy-mm-dd', date);
      
         <c:forEach items="${reservationList}" var="reservationVo">
         
            var r_sdate = new Date("${reservationVo.r_sdate}")
            var r_edate = new Date("${reservationVo.r_edate}")
            
            for (var d = r_sdate; d <= r_edate; d.setDate(d.getDate() + 1)) {
                 dateRange.push($.datepicker.formatDate('yy-mm-dd', d));
                 } 
         </c:forEach>

              return [dateRange.indexOf(dateString) == -1];
        } 
     
     
        $("#r_edate").datepicker({   
                
            showOn:"button" , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
            ,buttonImageOnly: true
            ,dateFormat:"yy-mm-dd"
            ,nextText:"다음"
            ,prevText:"이전"
            ,dayNamesMin : ['월','화','수','목','금','토','일']
            ,monthNamesShort:  [ "1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월" ]
            ,showOtherMonths:true
            ,minDate:1
            ,beforeShowDay: disableAllTheseDays
            ,onClose: function( selectedDate ) {
                  // 종료일(toDate) datepicker가 닫힐때
                  // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                  
                  var tempdate = new Date(selectedDate);
            
               tempdate.setDate(tempdate.getDate()-1);
            
            
               var tempyear = tempdate.getFullYear();
               var tempmonth = tempdate.getMonth()+1;
               var tempday = tempdate.getDate();
                  $("#r_sdate").datepicker( "option", "maxDate", tempyear+"-"+tempmonth+"-"+tempday );
            }
             
            });
     
        
    });
    
    </script>

<!--총합계-->
<script>
  function call()
{
var sdd = document.getElementById("r_sdate").value;
var edd = document.getElementById("r_edate").value;
var ar1 = sdd.split('-');
var ar2 = edd.split('-');
var da1 = new Date(ar1[0], ar1[1], ar1[2]);
var da2 = new Date(ar2[0], ar2[1], ar2[2]);
var dif = da2 - da1;
var cDay = 24 * 60 * 60 * 1000;


var price = parseInt(dif/cDay*${boardVo.price}+${boardVo.commission}+${boardVo.cleaningFee});
if(price+"" != "NaN"){
  document.getElementById('r_cost').value = price.toString(); //.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); 천단위마다 콤마
}
}
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
        </div>
        <!--//info-->
        <hr />
        <div class="copyright">
          <p>Copyright $copy; <strong>JJBNB</strong> All Rights Reserved.</p>
        </div>
        <!--//copyright-->
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
  

<script>

window.addEventListener('DOMContentLoaded', event => {

    // Navbar shrink function
    var navbarShrink = function () {
        const navbarCollapsible = document.body.querySelector('#mainNav');
        if (!navbarCollapsible) {
            return;
        }
        if (window.scrollY === 0) {
            navbarCollapsible.classList.remove('navbar-shrink');
            
        } else {
            navbarCollapsible.classList.add('navbar-shrink');
           
        }

    };

    // Shrink the navbar 
    navbarShrink();

    // Shrink the navbar when page is scrolled
    document.addEventListener('scroll', navbarShrink);

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            offset: 74,
        });
    };

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });

    // Activate SimpleLightbox plugin for portfolio items
    new SimpleLightbox({
        elements: '#portfolio a.portfolio-box'
    });

    /*숙소 정보 숙소 사진 이벤트*/
    var con2 = document.getElementById("review");
    var con1 = document.getElementById("myDIV1");
    var con = document.getElementById("myDIV");
    var a = document.getElementById("a");
    var b = document.getElementById("b");
    var c = document.getElementById("c");
    
    c.addEventListener("click",function(){
          con.style.display = 'none';
          a.style.color = '#000';
          con1.style.display = 'none';
          b.style.color = '#000';
          con2.style.display = 'block';
          c.style.color = '#f4623a';
          
    });
    b.addEventListener("click",function(){
            con.style.display = 'none';
            a.style.color = '#000';
            con1.style.display = 'block';
            b.style.color = '#f4623a';
            con2.style.display = 'none';
            c.style.color = '#000';
    });
    a.addEventListener("click",function(){
            con.style.display = 'block';
            a.style.color = '#f4623a';
            con1.style.display = 'none';
            b.style.color = '#000';
            con2.style.display = 'none';
            c.style.color = '#000';
    });
    


});
</script>

	
	<script>
	let moveForm = $("#moveForm");
	
	$(".pagination a").on("click", function(e){
		
		
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "${pageContext.request.contextPath}/board/board_view.do?board_idx=${boardVo.board_idx}");
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
	


</body>

</html>