<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

    
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

  <link href="${pageContext.request.contextPath}/resources/css/ksh/숙소등록.css" rel="stylesheet" />
    
</head>


<body>
	<%@include file="/resources/include/fix-header.jsp" %>
	
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
	   
	          <div class="main-reg">
            <h2>숙소등록</h2>
            <hr class="top-hr">
            <div class="main-container">
            <form action="${pageContext.request.contextPath}/board/board_insert.do" method="post" enctype="multipart/form-data" id="enrollForm">
			<input type="hidden" name="m_idx" value="${m_idx }"/>
                <table class="main-table">
                    <tr>
                        <th>숙소목록 등록</th>
                    </tr>
                    <tr>
                        <td>숙소 이름</td>
                        <td>
                        <input type="text" name="title">
                        <span class="ck_warn title_warn">숙소이름을 입력해주세요.</span>
                        </td>
                    </tr>
                    <tr>
                        <td>숙소 날짜</td>
                        <td>
                        <input type="text" name="early_date">
                        <span class="ck_warn early_date_warn">날짜를 입력해주세요.</span>
                        </td>
                    </tr>
                    <tr>
                        <td>숙소 가격</td>
                        <td>
                        <input type="text" name="price">
                    	<span class="ck_warn price_warn">가격을 입력해주세요.</span>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>숙소 사진1</td>
                        <td>
                        <input type="file" name="uploadFile" multiple/>
                    	<span class="ck_warn img1_warn">사진을 등록해주세요.</span>
                        </td>
                    </tr>
                    <tr>
                        <td>숙소 사진2</td>
                        <td>
                        <input type="file" name="uploadFile" multiple/>
                        <span class="ck_warn img2_warn">사진을 입력해주세요.</span>
                        </td>
                    </tr>
                    <tr>
                        <td>숙소 사진3</td>
                        <td>
                        <input type="file" name="uploadFile" multiple/>
                  		<span class="ck_warn img3_warn">사진을 입력해주세요.</span>
                        </td>
                    </tr>
                    <tr>
                        <td>숙소 사진4</td>
                        <td>
                        <input type="file" name="uploadFile" multiple/>
                        <span class="ck_warn img4_warn">사진을 입력해주세요.</span>
                        </td>
                    </tr>
                    <tr>
                        <td>숙소 정보1</td>
                        <td>
                            훌륭한 숙소위치
                            <select name="accommGrade">
                                <option>100</option>
                                <option>90</option>
                                <option>80</option>
                                <option>70</option>
                                <option>60</option>
                            </select>
                            <select name="accommStar">
                                <option>5</option>
                                <option>4</option>
                                <option>3</option>
                                <option>2</option>
                                <option>1</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>숙소 정보2</td>
                        <td>
                            순조로운 체크인 과정
                            <select name="accommGradeCheck">
                                <option>100</option>
                                <option>90</option>
                                <option>80</option>
                                <option>70</option>
                                <option>60</option>
                            </select>
                            <select name="accommStarCheck">
                                <option>5</option>
                                <option>4</option>
                                <option>3</option>
                                <option>2</option>
                                <option>1</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>취소가능 날짜</td>
                        <td>
                        <input type="text" name="deleteDate">
                        <span class="ck_warn deleteDate_warn">날짜를 입력해주세요.</span>
                        </td>
                    </tr>
                    <tr>
                        <td>숙박장소1</td>
                        <td>
							<label>
							<input type="checkbox" name="iconCheck" value='fa-solid fa-bed'>
							<i class="fa-solid fa-bed">침실</i>
			
							</label>
                            <label><input type="checkbox" name="iconCheck" value='fa-brands fa-creative-commons-share'><i class="fa-brands fa-creative-commons-share">공용공간</i></label>                       
      
                            <select name="accommPlace">
                                <option>침실1</option>
                                <option>침실2</option>
                                <option>침실3</option>
                                <option>공용 공간</option>
                            </select>
                            <select name="accommPlace2">
                                <option>소파 베드</option>
                                <option>더블 베드</option>
                                <option>킹사이즈 침대</option>
                                <option>퀸사이즈 침대</option>
                            </select>
                            <select name="accommPlace3">
                                <option>1개</option>
                                <option>2개</option>
                                <option>3개</option>
                                <option>4개</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>숙박장소2</td>
                        <td>
							<label><input type="checkbox" name="iconCheck2" value='fa-solid fa-bed'><i class="fa-solid fa-bed">침실</i></label>
                            <label><input type="checkbox" name="iconCheck2" value='fa-brands fa-creative-commons-share'><i class="fa-brands fa-creative-commons-share">공용공간</i></label>                       
                       
                            <select name="accommPlace4">
                                <option>침실1</option>
                                <option>침실2</option>
                                <option>침실3</option>
                                <option>공용 공간</option>
                            </select>
                            <select name="accommPlace5">
                                <option>소파 베드</option>
                                <option>더블 베드</option>
                                <option>킹사이즈 침대</option>
                                <option>퀸사이즈 침대</option>
                            </select>
                            <select name="accommPlace6">
                                <option>1개</option>
                                <option>2개</option>
                                <option>3개</option>
                                <option>4개</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                    	<td>편의시설</td>
                        <td>
                        <input type="text" name="convenience" size="10"><span class="ck_warn convenience_warn">편의시설을 입력해주세요.</span>
                        <input type="text" name="convenience2" size="10"><span class="ck_warn convenience2_warn">편의시설을 입력해주세요.</span>
                        <input type="text" name="convenience3" size="10"><span class="ck_warn convenience3_warn">편의시설을 입력해주세요.</span>
                        <input type="text" name="convenience4" size="10"><span class="ck_warn convenience4_warn">편의시설을 입력해주세요.</span><br>
                        <input type="text" name="convenience5" size="10"><span class="ck_warn convenience5_warn">편의시설을 입력해주세요.</span>
                        <input type="text" name="convenience6" size="10"><span class="ck_warn convenience6_warn">편의시설을 입력해주세요.</span>
                        <input type="text" name="convenience7" size="10"><span class="ck_warn convenience7_warn">편의시설을 입력해주세요.</span>
                        <input type="text" name="convenience8" size="10"><span class="ck_warn convenience8_warn">편의시설을 입력해주세요.</span>
                        </td>
                    </tr>
                     <tr>
                    	<td>인원</td>
                    	<td>
                    		<input type="text" name="maxPeople">
                    		<span class="ck_warn maxPeople_warn">인원수를 입력해주세요.</span>
                    	</td>
                    </tr>
                    <tr>
                    	<td>청소비</td>
                    	<td>
                    		<input type="text" name="cleaningFee">
                    		<span class="ck_warn cleaningFee_warn">청소비를 입력해주세요.</span>
                    	</td>
                    </tr>
                    <tr>
                    	<td>서비스 수수료</td>
                    	<td>
                    		<input type="text" name="commission">
                    		<span class="ck_warn commission_warn">수수료를 입력해주세요.</span>
                    	</td>
                    </tr>
                    <tr>
                        <td>숙소 사진5</td>
                        <td><input type="file" name="uploadFile" multiple/></td>
                    </tr>
                    <tr>
                        <td>숙소 사진6</td>
                        <td><input type="file" name="uploadFile" multiple/></td>
                    </tr>
                    <tr>
                        <td>숙소 사진7</td>
                        <td><input type="file" name="uploadFile" multiple/></td>
                    </tr>
                    <tr>
                        <td>숙소 사진8</td>
                        <td><input type="file" name="uploadFile" multiple/></td>
                    </tr>
                    <tr>
                        <td>숙소 사진9</td>
                        <td><input type="file" name="uploadFile" multiple/></td>
                    </tr>
                    <tr>
                        <td>숙소 사진10</td>
                        <td><input type="file" name="uploadFile" multiple/></td>
                    </tr>
                  	<tr>
                        <td>숙소 주변정보1</td>
                        <td>
                        <input type="text" name="accommContent">
                        <span class="ck_warn accommContent_warn">정보를 입력해주세요.</span>
                        </td>
                    </tr>
                    <tr>    
                    	<td>숙소 주변정보2</td>
                        <td>
                        <input type="text" name="accommContent2">
                        <span class="ck_warn accommContent2_warn">정보를 입력해주세요.</span>
                        </td>
                    </tr>
                    <tr>
                    	<td>숙소 주변정보3</td>
                        <td>
                        <input type="text" name="accommContent3">
                        <span class="ck_warn accommContent3_warn">정보를 입력해주세요.</span>
                        </td>
                    </tr>
                </table>
            </form>
            	<div class="btn_section">
            		<button id="cancelBtn" class="btn">취 소</button>
            		<button id="enrollBtn" class="btn">등 록</button>
            	</div>
            
            </div>
        </div>

    </main>
    
    <script>

	let enrollForm = $("#enrollForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="${pageContext.request.contextPath}/board/board_admin_list.do"
	
});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){
	
	e.preventDefault();
	
	let titleCk = false;
	let earlyDateCk = false;
	let priceCk = false;
	let img1Ck = false;
	let deleteDateCk = false;
	let convenienceCk = false;
	let convenience2Ck = false;
	let convenience3Ck = false;
	let convenience4Ck = false;
	let convenience5Ck = false;
	let convenience6Ck = false;
	let convenience7Ck = false;
	let convenience8Ck = false;
	let cleaningFeeCk = false;
	let commissionCk = false;
	let accommContentCk = false;
	let accommContent2Ck = false;
	let accommContent3Ck = false;
	
	let title = $("input[name='title']").val();
	let earlyDate = $("input[name='early_date']").val();
	let price = $("input[name='price']").val();
	let uploadFile = $("input[name='uploadFile']").val();
	let deleteDate = $("input[name='deleteDate']").val();
	let convenience = $("input[name='convenience']").val();
	let convenience2 = $("input[name='convenience2']").val();
	let convenience3 = $("input[name='convenience3']").val();
	let convenience4 = $("input[name='convenience4']").val();
	let convenience5 = $("input[name='convenience5']").val();
	let convenience6 = $("input[name='convenience6']").val();
	let convenience7 = $("input[name='convenience7']").val();
	let convenience8 = $("input[name='convenience8']").val();
	let cleaningFee = $("input[name='cleaningFee']").val();
	let commission = $("input[name='commission']").val();
	let accommContent = $("input[name='accommContent']").val();
	let accommContent2 = $("input[name='accommContent2']").val();
	let accommContent3 = $("input[name='accommContent3']").val();

	
	
	if(title){
		$(".title_warn").css('display','none');
		titleCk = true;
	} else {
		$(".title_warn").css('display','block');
		titleCk = false;
	}
	
	if(earlyDate){
		$(".early_date_warn").css('display','none');
		earlyDateCk = true;
	} else {
		$(".early_date_warn").css('display','block');
		earlyDateCk = false;
	}
	
	if(price){
		$(".price_warn").css('display','none');
		priceCk = true;
	} else {
		$(".price_warn").css('display','block');
		priceCk = false;
	}
	
	if(uploadFile){
		$(".img1_warn").css('display','none');
		img1Ck = true;
	} else {
		$(".img1_warn").css('display','block');
		img1Ck = false;
	}
	
	if(deleteDate){
		$(".deleteDate_warn").css('display','none');
		deleteDateCk = true;
	} else {
		$(".deleteDate_warn").css('display','block');
		deleteDateCk = false;
	}
	
	if(convenience){
		$(".convenience_warn").css('display','none');
		convenienceCk = true;
	} else {
		$(".convenience_warn").css('display','block');
		convenienceCk = false;
	}
	
	if(convenience2){
		$(".convenience2_warn").css('display','none');
		convenience2Ck = true;
	} else {
		$(".convenience2_warn").css('display','block');
		convenience2Ck = false;
	}
	
	if(convenience3){
		$(".convenience3_warn").css('display','none');
		convenience3Ck = true;
	} else {
		$(".convenience3_warn").css('display','block');
		convenience3Ck = false;
	}
	
	if(convenience4){
		$(".convenience4_warn").css('display','none');
		convenience4Ck = true;
	} else {
		$(".convenience4_warn").css('display','block');
		convenience4Ck = false;
	}
	
	if(convenience5){
		$(".convenience5_warn").css('display','none');
		convenience5Ck = true;
	} else {
		$(".convenience5_warn").css('display','block');
		convenience5Ck = false;
	}
	
	if(convenience6){
		$(".convenience6_warn").css('display','none');
		convenience6Ck = true;
	} else {
		$(".convenience6_warn").css('display','block');
		convenience6Ck = false;
	}
	
	if(convenience7){
		$(".convenience7_warn").css('display','none');
		convenience7Ck = true;
	} else {
		$(".convenience7_warn").css('display','block');
		convenience7Ck = false;
	}
	
	if(convenience8){
		$(".convenience8_warn").css('display','none');
		convenience8Ck = true;
	} else {
		$(".convenience8_warn").css('display','block');
		convenience8Ck = false;
	}
	
	if(cleaningFee){
		$(".cleaningFee_warn").css('display','none');
		cleaningFeeCk = true;
	} else {
		$(".cleaningFee_warn").css('display','block');
		cleaningFeeCk = false;
	}
	
	if(commission){
		$(".commission_warn").css('display','none');
		commissionCk = true;
	} else {
		$(".commission_warn").css('display','block');
		commissionCk = false;
	}
	

	if(accommContent){
		$(".accommContent_warn").css('display','none');
		accommContentCk = true;
	} else {
		$(".accommContent_warn").css('display','block');
		accommContentCk = false;
	}
	
	if(accommContent2){
		$(".accommContent2_warn").css('display','none');
		accommContent2Ck = true;
	} else {
		$(".accommContent2_warn").css('display','block');
		accommContent2Ck = false;
	}
	
	if(accommContent3){
		$(".accommContent3_warn").css('display','none');
		accommContent3Ck = true;
	} else {
		$(".accommContent3_warn").css('display','block');
		accommContent3Ck = false;
	}
	
	if(titleCk && earlyDateCk && priceCk && img1Ck && deleteDateCk && convenienceCk && convenience2Ck && convenience3Ck 
			&& convenience4Ck && convenience5Ck && convenience6Ck && convenience7Ck && convenience8Ck && cleaningFeeCk && commissionCk
			&& accommContentCk && accommContent2Ck && accommContent3Ck){
		//alert('통과');
		enrollForm.submit();
	} else {
		return false;
	}

	
});

</script> 	
	
	



<%@include file="/resources/include/footer.jsp" %>
    
    
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