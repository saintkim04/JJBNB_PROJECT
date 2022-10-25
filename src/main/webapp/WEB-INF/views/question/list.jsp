<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>

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
				<dd><a href="${pageContext.request.contextPath}/question/question_list.do"><span>자주 묻는 질문</span></a></dd>
				<dd><a href="${pageContext.request.contextPath}/inquiry/inquiry_list.do">1:1 문의</a></dd>
				<dd><a href="${pageContext.request.contextPath}/event/event_list.do">이벤트</a></dd>
				<dd><a href="${pageContext.request.contextPath}/terms/terms_list.do">약관 및 정책</a></dd>
			</dl>
		</nav>
		<section class="content">
			<div class="content-list">
				<ul class="content-list-show">
					<li><p><strong>TOP 7</strong></p></li>
					<li>
						<a href="javascript:doDisplaya();" style="text-decoration:none;">
							<div class="content-terms">
							
								<strong><span>[숙박] </span>&nbsp;&nbsp;&nbsp;예약을 취소하고 싶어요.</strong>
									
								<div class="content-terms-1">						
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-down-square" viewBox="0 0 16 16">
										<path d="M3.626 6.832A.5.5 0 0 1 4 6h8a.5.5 0 0 1 .374.832l-4 4.5a.5.5 0 0 1-.748 0l-4-4.5z"/>
										<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2z"/>
									</svg>
								</div>
									
							</div>
						 </a>				
							
							
						<div id="myDIV1" style="display:none;">    
							<div class="content-list-show-a" style="display: block;">
								<div style="font-size:13px; font-family: Malgun Gothic;">
								
									<div class="term-accordion-content">
		        						예약취소는  앱/웹 > 내정보 > 예약/구매내역에서 직접 가능합니다. <br><br>
		        							
										예약/결제 진행 당시 안내된 취소/환불 규정에 따라 처리되며, 취소수수료가 발생할 경우, <br>
										취소수수료를 차감한 금액으로 환불 처리됩니다.<br><br>
										일부 숙소에 한해 취소가 가능한 시점이나 앱/웹에서 취소가 불가할 수 있으니,<br>
										이 경우에는 고객행복센터로 요청해 주시길 바랍니다.<br>
									</div>
									
								</div>
							</div>
						</div>
					</li>
					
					<li>
						<a href="javascript:doDisplayb();" style="text-decoration:none;">
							<div class="content-terms">
								
								<strong><span>[숙박] </span>&nbsp;&nbsp;&nbsp;체크인날짜/객실타입을 변경하고 싶어요.</strong>
								
								<div class="content-terms-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-down-square" viewBox="0 0 16 16">
										<path d="M3.626 6.832A.5.5 0 0 1 4 6h8a.5.5 0 0 1 .374.832l-4 4.5a.5.5 0 0 1-.748 0l-4-4.5z"/>
										<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2z"/>
									</svg>
								</div>
							</div>
						 </a>				
							
							
						<div id="myDIV2" style="display:none;">    
							<div class="content-list-show-a" style="display: block;">
								<div style="font-size:13px; font-family: Malgun Gothic;">
								
									<div class="term-accordion-content">
		        						예약 결제 완료 후 날짜 및 객실타입 등 부분 변경은 불가합니다.<br><br>
		
										예약취소와 동일하게 취소 및 환불 규정에 따라 처리되므로 예약취소가 가능한 기간에는 예약취소 후 <br> 
										재결제 하셔서 이용 부탁드립니다.<br><br>
										
										만약, 예약취소가 불가하거나 수수료가 발생하는 경우라면 고객행복센터로 문의해주시길 바랍니다. <br><br>
									</div>
								</div>
							</div>
						</div>
					</li>
					
					<li>
							<a href="javascript:doDisplayc();" style="text-decoration:none;">
								<div class="content-terms">
								
								<strong><span>[이용문의] </span>&nbsp;&nbsp;&nbsp;정확한 내 위치 확인이 안돼요.</strong>
								
								<div class="content-terms-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-down-square" viewBox="0 0 16 16">
										<path d="M3.626 6.832A.5.5 0 0 1 4 6h8a.5.5 0 0 1 .374.832l-4 4.5a.5.5 0 0 1-.748 0l-4-4.5z"/>
										<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2z"/>
									</svg>
								</div>
								
							</div>
						 </a>				
							
							
						<div id="myDIV3" style="display:none;">    
							<div class="content-list-show-a" style="display: block;">
								<div style="font-size:13px; font-family: Malgun Gothic;">
									
									<div class="term-accordion-content">
		        						여기어때는 위치기반 서비스로 정확한 위치가 인식되어야 정상적인 이용이 가능합니다. <br><br>
	
										단말기의 GPS를 통한 내 위치 설정 시, 단말기 상태에 따라 위치 인식에 예외사항이 발생할 수 있으니,<br>
										GPS 재설정을 통해 정확하게 확인해 주시기 바랍니다. <br><br>
										 
										만약 같은 불편을 계속 겪으실 경우,<br>
										단말기의 소프트웨어 업데이트 또는 데이터 환경 확인 및 앱을 완전히 삭제 후 재설치 부탁드립니다.<br>
									</div>
									
								</div>
							</div>
						</div>
					</li>
					
					<li>
							<a href="javascript:doDisplayd();" style="text-decoration:none;">
								<div class="content-terms">
								
								<strong><span>[회원정보] </span>&nbsp;&nbsp;&nbsp;회원정보 수정은 어떻게 하나요?</strong>
								
								<div class="content-terms-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-down-square" viewBox="0 0 16 16">
										<path d="M3.626 6.832A.5.5 0 0 1 4 6h8a.5.5 0 0 1 .374.832l-4 4.5a.5.5 0 0 1-.748 0l-4-4.5z"/>
										<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2z"/>
									</svg>
								</div>
								
							</div>
						 </a>				
							
							
							<div id="myDIV4" style="display:none;">    
								<div class="content-list-show-a" style="display: block;">
									<div style="font-size:13px; font-family: Malgun Gothic;">
								
										<div class="term-accordion-content">
		        							웹페이지 상단 내정보 > 내 정보 관리에서 회원정보를 수정할 수 있습니다. <br><br>
	
											닉네임 변경 시, 이미 사용중인 닉네임으로는 변경이 되질 않습니다. <br><br> 
										
											* 회원정보 : 닉네임, 예약자명, 휴대폰 번호, 비밀번호(이메일 로그인 시에만 변경 가능) <br>
										</div>
									
								</div>
							</div>
						</div>
					</li>
					
					<li>
							<a href="javascript:doDisplaye();" style="text-decoration:none;">
								<div class="content-terms">
								
								<strong><span>[이용문의] </span>&nbsp;&nbsp;&nbsp;등록한 리뷰를 삭제/수정 하고 싶어요.</strong>
								
								<div class="content-terms-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-down-square" viewBox="0 0 16 16">
										<path d="M3.626 6.832A.5.5 0 0 1 4 6h8a.5.5 0 0 1 .374.832l-4 4.5a.5.5 0 0 1-.748 0l-4-4.5z"/>
										<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2z"/>
									</svg>
								</div>
								
							</div>
						 </a>				
							
							
						<div id="myDIV5" style="display:none;">    
							<div class="content-list-show-a" style="display: block;">
								<div style="font-size:13px; font-family: Malgun Gothic;">
									
									<div class="term-accordion-content">
		       							등록한 리뷰는 웹 페이지 상단 내정보 > 마이페이지 에서 직접 수정/삭제가 가능합니다. <br>
									</div>
									
								</div>
							</div>
						</div>
					</li>
					
					<li>
							<a href="javascript:doDisplayf();" style="text-decoration:none;">
								<div class="content-terms">
								
								<strong><span>[이용문의] </span>&nbsp;&nbsp;&nbsp;비회원도 예약 가능한가요?</strong>
								
								<div class="content-terms-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-down-square" viewBox="0 0 16 16">
										<path d="M3.626 6.832A.5.5 0 0 1 4 6h8a.5.5 0 0 1 .374.832l-4 4.5a.5.5 0 0 1-.748 0l-4-4.5z"/>
										<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2z"/>
									</svg>
								</div>
								
							</div>
						 </a>				
							
							
						<div id="myDIV6" style="display:none;">    
							<div class="content-list-show-a" style="display: block;">
								<div style="font-size:13px; font-family: Malgun Gothic;">
								
									<div class="term-accordion-content">
		       							JJBNB 회원만 예약이 가능합니다. <br><br>
										비회원으로는 예약이 불가한 점 양해바랍니다.<br>
									</div>
										
								</div>
							</div>
						</div>
					</li>
					
					<li>
							<a href="javascript:doDisplayg();" style="text-decoration:none;">
								<div class="content-terms">
								
								<strong><span>[이용문의] </span>&nbsp;&nbsp;&nbsp;어떻게 하면 엘리트가 될 수 있나요?</strong>
								
								<div class="content-terms-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-caret-down-square" viewBox="0 0 16 16">
										<path d="M3.626 6.832A.5.5 0 0 1 4 6h8a.5.5 0 0 1 .374.832l-4 4.5a.5.5 0 0 1-.748 0l-4-4.5z"/>
										<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2z"/>
									</svg>
								</div>
								
							</div>
						 </a>				
							
							
						<div id="myDIV7" style="display:none;">    
							<div class="content-list-show-a" style="display: block;">
								<div style="font-size:13px; font-family: Malgun Gothic;">
										
									<div class="term-accordion-content">
		       							"노력"<br>
									</div>
										
								</div>
							</div>
						</div>
					</li>
					
				</ul>
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
    
        var aDisplay = true;
        function doDisplaya(){    
            var con = document.getElementById("myDIV1");    
            if(con.style.display=='none'){       
                con.style.display = 'block';    
            }else{       
                con.style.display = 'none';    
            } 
        } 
        
        
        var bDisplay = true;
        function doDisplayb(){    
            var con = document.getElementById("myDIV2");    
            if(con.style.display=='none'){       
                con.style.display = 'block';    
            }else{       
                con.style.display = 'none';    
            } 
        } 
        
        
        var cDisplay = true;
        function doDisplayc(){    
            var con = document.getElementById("myDIV3");    
            if(con.style.display=='none'){       
                con.style.display = 'block';    
            }else{       
                con.style.display = 'none';    
            } 
        }
        
        
        var dDisplay = true;
        function doDisplayd(){    
            var con = document.getElementById("myDIV4");    
            if(con.style.display=='none'){       
                con.style.display = 'block';    
            }else{       
                con.style.display = 'none';    
            } 
        }
        
        
        var eDisplay = true;
        function doDisplaye(){    
            var con = document.getElementById("myDIV5");    
            if(con.style.display=='none'){       
                con.style.display = 'block';    
            }else{       
                con.style.display = 'none';    
            } 
        }
        
        
        var fDisplay = true;
        function doDisplayf(){    
            var con = document.getElementById("myDIV6");    
            if(con.style.display=='none'){       
                con.style.display = 'block';    
            }else{       
                con.style.display = 'none';    
            } 
        }
        
        
        var gDisplay = true;
        function doDisplayg(){    
            var con = document.getElementById("myDIV7");    
            if(con.style.display=='none'){       
                con.style.display = 'block';    
            }else{       
                con.style.display = 'none';    
            } 
        }
        
        
        
        
        
        
    </script> 


</body>


</html>