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

  <link href="${pageContext.request.contextPath}/resources/css/ksh/숙소수정.css" rel="stylesheet" />
    
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
            <h2>숙소수정</h2>
            <hr class="top-hr">
            <div class="main-container" style="width:850px;">
            <form action="${pageContext.request.contextPath}/board/board_view.do?board_idx=${boardVo.board_idx}" method="post" enctype="multipart/form-data">
			<input type="hidden" name="m_idx" value="${m_idx }"/>
                <table class="main-table">
                    <tr>
                        <th>숙소목록 수정</th>
                    </tr>
                    <tr>
                        <td>숙소 이름</td>
                        <td><input type="text" name="title" value="${boardVo.title}"></td>
                    </tr>
                    <tr>
                        <td>숙소 날짜</td>
                        <td><input type="text" name="early_date" value="${boardVo.early_date}"></td>
                    </tr>
                    <tr>
                        <td>숙소 가격</td>
                        <td><input type="text" name="price" value="${boardVo.price}"></td>
                    </tr>
                    
                    <tr>
                        <td>숙소 사진1</td>
                        <td><input type="file" name="uploadFile" multiple/>${boardVo.origin_filename1}</td>
                    </tr>
                    <tr>
                        <td>숙소 사진2</td>
                        <td><input type="file" name="uploadFile" multiple/>${boardVo.origin_filename2}</td>
                    </tr>
                    <tr>
                        <td>숙소 사진3</td>
                        <td><input type="file" name="uploadFile" multiple/>${boardVo.origin_filename3}</td>
                    </tr>
                    <tr>
                        <td>숙소 사진4</td>
                        <td><input type="file" name="uploadFile" multiple/>${boardVo.origin_filename4}</td>
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
                        <td><input type="text" name="deleteDate" value="${boardVo.early_date}"></td>
                    </tr>
                    <tr>
                        <td>숙박장소1</td>
                        <td>
							<label><input type="checkbox" name="iconCheck" value='fa-solid fa-bed'><i class="fa-solid fa-bed">침실</i></label>
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
                        <input type="text" name="convenience" size="10" value="${boardVo.convenience}">
                        <input type="text" name="convenience2" size="10" value="${boardVo.convenience2}">
                        <input type="text" name="convenience3" size="10" value="${boardVo.convenience3}">
                        <input type="text" name="convenience4" size="10" value="${boardVo.convenience4}"><br>
                        <input type="text" name="convenience5" size="10" value="${boardVo.convenience5}">
                        <input type="text" name="convenience6" size="10" value="${boardVo.convenience6}">
                        <input type="text" name="convenience7" size="10" value="${boardVo.convenience7}">
                        <input type="text" name="convenience8" size="10" value="${boardVo.convenience8}">
                        </td>
                    </tr>
                    <tr>
                    	<td>청소비</td>
                    	<td>
                    		<input type="text" name="cleaningFee" value="${boardVo.cleaningFee}">
                    	</td>
                    </tr>
                    <tr>
                    	<td>서비스 수수료</td>
                    	<td>
                    		<input type="text" name="commission" value="${boardVo.commission}">
                    	</td>
                    </tr>
                    <tr>
                        <td>숙소 사진5</td>
                        <td><input type="file" name="uploadFile" multiple/>${boardVo.origin_filename5}</td>
                    </tr>
                    <tr>
                        <td>숙소 사진6</td>
                        <td><input type="file" name="uploadFile"  multiple/>${boardVo.origin_filename6}</td>
                    </tr>
                    <tr>
                        <td>숙소 사진7</td>
                        <td><input type="file" name="uploadFile"  multiple/>${boardVo.origin_filename7}</td>
                    </tr>
                    <tr>
                        <td>숙소 사진8</td>
                        <td><input type="file" name="uploadFile"  multiple/>${boardVo.origin_filename8}</td>
                    </tr>
                    <tr>
                        <td>숙소 사진9</td>
                        <td><input type="file" name="uploadFile"  multiple/>${boardVo.origin_filename9}</td>
                    </tr>
                    <tr>
                        <td>숙소 사진10</td>
                        <td><input type="file" name="uploadFile"  multiple/>${boardVo.origin_filename10}</td>
                    </tr>
                  	<tr>
                        <td>숙소 주변정보1</td>
                        <td><input type="text" name="accommContent" value="${boardVo.accommContent}"></td>
                    </tr>
                    <tr>    
                    	<td>숙소 주변정보2</td>
                        <td><input type="text" name="accommContent2" value="${boardVo.accommContent2}"></td>
                    </tr>
                    <tr>
                    	<td>숙소 주변정보3</td>
                        <td><input type="text" name="accommContent3" value="${boardVo.accommContent3}"></td>
                    </tr>
                    
                    
                    
                    <tr>
                        <td colspan="2" align="right"><input type="submit" value="전송"></td>
                    </tr>
                </table>

            </form>
            </div>
        </div>
        


    </main>


    <!--캘린더-->
    <script>
        $(document).ready(function () {
            $("#datepicker").datepicker({
                showOn: "button", buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
                , buttonImageOnly: true
                , dateFormat: "mm월 dd일"
                , nextText: "다음"
                , prevText: "이전"
                , dayNamesMin: ['월', '화', '수', '목', '금', '토', '일']
                , monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
                , showOtherMonths: true
            });
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