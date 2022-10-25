<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
    
    <!-- 웹 폰트 -->
    <script src="https://kit.fontawesome.com/35e0a03178.js" crossorigin="anonymous"></script>
    
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet"/>
    
    <script>
    	$(document).ready(function(){
    		$("#btn_ok").click(function(){
    			
    			var title = $("#title").val();
    			var sdate = $("#e_sdate").val();
    			var edate = $("#e_edate").val();
    			var sfile = $("#sfile").val();
    			var file = $("#file").val();
    			
    			if(title == ""){
    				alert("이벤트 제목을 입력해주세요.");
    				$("#title").focus();
    				return false;
    			}else if(sdate == ""){
    				alert("이벤트 시작일을 입력해주세요.");
    				$("#e_sdate").focus();
    				return false;
    			}else if(edate == ""){
    				alert("이벤트 종료일을 입력해주세요.");
    				$("#e_edate").focus();
    				return false;
    			}else if(sfile == ""){
    				alert("썸네일 사진을 첨부해주세요.");
    				$("#sfile").focus();
    				return false;
    			}else if(file == ""){
    				alert("이벤트 내용파일을 첨부해주세요.");
    				$("#file").focus();
    				return false;
    			}else if(confirm("이벤트 내용을 등록하시겠습니까?")){
    				$("#regform").submit();
    			}else{
    				return false
    			}
    		})
    		
    		$("#e_sdate").hover(function(){
    			$(obj).css('cursor', 'pointer');
    		}, function() {
    			$(obj).css('cursor', 'default');
    			});
    	})
    </script>
    
    

</head>
<body>

	<%@include file="/resources/include/fix-header.jsp" %>
	
	<main class="container main-box">

		 <nav class="side-nav">
			<dl class="side-nav-title">
				<dt>관리자
				<dd><a href="${pageContext.request.contextPath}/admin/member_list.do">회원목록</a></dd>
				<dd><a href="${pageContext.request.contextPath}/notice/admin/notice_list.do">공지사항 관리</a></dd>
				<dd><a href="${pageContext.request.contextPath}/inquiry/admin/inquiry_list.do">1:1문의 관리</a></dd>
				<dd><a href="${pageContext.request.contextPath}/event/admin/event_list.do"><span>이벤트 관리</span></a></dd>
				<dd><a href="${pageContext.request.contextPath}/board/board_admin_list.do">숙소 관리</a></dd>
			</dl>
		</nav>
		
		<section class="content-notice">
			<form id="regform" class="e_regform" action="${pageContext.request.contextPath}/event/admin/event_write_process.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="m_idx" value="${m_idx}"/>
				<div class="content-list">
					<ul>
						<li>
							<section class="text_wrap">
								<p>이벤트 제목</p>
							</section>
							<input type="text" class="text_type_1" id="title" name="e_title" placeholder="제목을 작성해주세요."/>
						</li>
						<li>
							<section class="text_wrap">
								<p>이벤트 기간</p>
							</section>
							
							<input type="text" class="text_type_2 btn-1" name="e_sdate" id="e_sdate" size="12" placeholder="시작일" readonly value="" style="cursor:pointer;"/> ~
							<input type="text" class="text_type_2 btn-1" name="e_edate" id="e_edate" size="12" placeholder="종료일" readonly value="" style="cursor:pointer;"/>
						</li>
					</ul>
					
					<ul>
						<li>
							<section class="text_wrap">
								<p>이벤트 썸네일 사진 첨부</p>
							</section>
							<input type="file" class="text_type_1 e_file" id="sfile" name="uploadFile" multiple/>
						</li>
						
						<li>
							<section class="text_wrap">
								<p>이벤트 내용파일 첨부</p>
							</section>
							<input type="file" class="text_type_1 e_file" id="file" name="uploadFile" multiple/>
						</li>
					</ul>
				</div>
				<button id="btn_ok" class="btn_red_fill" type="submit">작성 완료</button>
			</form>
		</section>
	</main>
	
	<div class="footer-height">
		<%@include file="/resources/include/footer.jsp" %>
	</div>
	
	

		<!--캘린더-->
		<script>
			$(document).ready(function() {
	       
				$("#e_sdate").datepicker({
					buttontext:'sdate',
					dateFormat:"yy-mm-dd",
					nextText:"다음",
					prevText:"이전",
					dayNamesMin : ['월','화','수','목','금','토','일'],
					monthNamesShort:  [ "1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월" ],
					showOtherMonths:true,
					onClose: function( selectedDate ) {    
			            // 시작일(fromDate) datepicker가 닫힐때
			            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
			            var tempdate = new Date(selectedDate);
			            
			            tempdate.setDate(tempdate.getDate()+1);
			            
			            
			            var tempyear = tempdate.getFullYear();
			            var tempmonth = tempdate.getMonth()+1;
			            var tempday = tempdate.getDate();
			            
			            
			            $("#e_edate").datepicker( "option", "minDate", tempyear+"-"+tempmonth+"-"+tempday);
			        }
				});
	        
				$("#e_edate").datepicker({
					buttontext:'edate',
					dateFormat:"yy-mm-dd",
					nextText:"다음",
					prevText:"이전",
					dayNamesMin : ['월','화','수','목','금','토','일'],
					monthNamesShort:  [ "1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월" ],
					showOtherMonths:true
				});
		     
	        
			});
	
		
		
	    </script>
	
	
	
	
	
	
	
	
	
	

</body>
</html>