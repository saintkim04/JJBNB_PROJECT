<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관 및 정책</title>

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
				<dd><a href="${pageContext.request.contextPath}/inquiry/inquiry_list.do">1:1 문의</a></dd>
				<dd><a href="${pageContext.request.contextPath}/event/event_list.do">이벤트</a></dd>
				<dd><a href="${pageContext.request.contextPath}/terms/terms_list.do"><span>약관 및 정책</span></a></dd>
			</dl>
		</nav>
		<section class="content">
			<div class="content-list">
				<ul class="content-list-show">
					<li><h2>JJBNB 이용약관</h2></li>
					
					<li>
						<a href="javascript:doDisplaya();" style="text-decoration:none;">
							<div class="content-terms">
							
							<strong><span>01.</span>&nbsp;&nbsp;&nbsp;제 1조 (목적)</strong>
							
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
        							이 약관은 주식회사 JJBNB 컴퍼니(이하 "회사"라 함)이 운영하는 공간예약 플랫폼(이하 "플랫폼"이라 한다)에서 제공하는 예약 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 "회사"와 "이용자"의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.<br>
        							※「PC통신, 무선 등을 이용하는 경우에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
								</div>
									
								</div>
							</div>
						</div>
					</li>
					
					<li>
						<a href="javascript:doDisplayb();" style="text-decoration:none;">
							<div class="content-terms">
							
							<strong><span>02.</span>&nbsp;&nbsp;&nbsp;제 2조 (정의)</strong>
							
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
        							<ul>
							            <li>① "플랫폼"이란 "이용자"가 컴퓨터 등 정보통신설비를 이용하여 "서비스"를 이용할 수 있도록 "회사"가 제공하는 가상의 영업장을 말하며, 아울러 "플랫폼"을 운영하는 사업자의 의미로도 사용합니다.</li>
							            <li>② "이용자"란 "플랫폼"을 통하여 이 약관에 따라 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
							            <li>③ "회원"이라 함은 "플랫폼"에 회원등록을 한 자로서, 계속적으로 "플랫폼"이 제공하는 서비스를 이용할 수 있는 자를 말합니다.</li>
							            <li>④ "비회원"이라 함은 회원에 가입하지 않고 "플랫폼"이 제공하는 서비스를 이용하는 자를 말합니다.</li>
							            <li>⑤ 서비스수수료란 "이용자"가 "홈&amp;빌라" 서비스를 이용할 때 "플랫폼"에 지급하는 수수료를 말합니다.</li>
							        </ul>
								</div>
									
								</div>
							</div>
						</div>
					</li>
					
					<li>
						<a href="javascript:doDisplayc();" style="text-decoration:none;">
							<div class="content-terms">
							
							<strong><span>03.</span>&nbsp;&nbsp;&nbsp;제 3조 (서비스이용 및 개인정보 제공 동의)</strong>
							
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
        							<ul>
							            <li>① "이용자"는 "플랫폼"상에서 다음 또는 이와 유사한 방법에 의하여 서비스를 이용하며, "플랫폼"은 "이용자"가 서비스를 이용을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
							                <ul>
							                    <li>1. 시설 등의 검색 및 선택</li>
							                    <li>2. "이용자"의 성명, 전화번호, 객실타입, 입실날짜 및 시간 등의 입력</li>
							                    <li>3. 약관내용, 취소•환불이 제한되는 상품안내, 시설별 이용규정 및 취소환불규정의 동의 등 비용부담과 관련한 내용에 대한 확인</li>
							                    <li>4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시</li>
							                    <li>5. 결제방법의 선택</li>
							                </ul>
							            </li>
							        </ul>
								</div>
									
								</div>
							</div>
						</div>
					</li>
					
					<li>
						<a href="javascript:doDisplayd();" style="text-decoration:none;">
							<div class="content-terms">
							
							<strong><span>04.</span>&nbsp;&nbsp;&nbsp;제 4조 (결제수단)</strong>
							
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
        							"플랫폼"에서 제공하는 서비스를 이용하는 것에 대한 결제방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. <br><br>
        							<ul>
							            <li>1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 </li>
							            <li>2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li>
							            <li>3. 온라인무통장입금</li>
							            <li>4. 전자화폐에 의한 결제</li>
							            <li>5. 수령 시 대금지급</li>
							            <li>6. "플랫폼"이 발행한 포인트에 의한 결제</li>
							            <li>7. "플랫폼"과 계약을 맺었거나 "플랫폼"이 인정한 상품권에 의한 결제 </li>
							            <li>8. 기타 전자적 지급 방법에 의한 대금 지급 등</li>
							        </ul>
								</div>
									
								</div>
							</div>
						</div>
					</li>
					
					<li>
						<a href="javascript:doDisplaye();" style="text-decoration:none;">
							<div class="content-terms">
							
							<strong><span>05.</span>&nbsp;&nbsp;&nbsp;제 5조 ("회사"의 의무)</strong>
							
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
        							<ul>
							            <li>① "회사"는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하는데 최선을 다하여야 합니다.</li>
							            <li>② "회사"는 "이용자"가 안전하게 서비스를 이용할 수 있도록 "이용자"의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.</li>
							            <li>③ "회사"는 이외에 관계 법령이 정한 의무사항을 준수합니다. </li>
							        </ul>
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
        
        
        
        
        
        
    </script> 


</body>


</html>