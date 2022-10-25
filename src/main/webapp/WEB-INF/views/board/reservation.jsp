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

  <link href="${pageContext.request.contextPath}/resources/css/ksh/숙소예약.css" rel="stylesheet" />

<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
	<script>
    var IMP = window.IMP; // 생략 가능
       IMP.init("imp43327815"); // 예: imp00000000
       
       function requestPay() {
          
          var r_name = $("#r_name").val();
          var r_tell = $("#r_tell").val();
         var pattern= /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;

          
          let obj={
                "r_sdate" : $("#r_sdate").val(),
                "r_edate" : $("#r_edate").val(),
                "r_cost" : $("#r_cost").val(),
                "board_idx" : $("#board_idx").val(),
                "m_idx" : $("#m_idx").val(),
                "r_name" : r_name,
                "r_tell" : r_tell
          }
          
          if(r_name == ""){
             alert("예약자 이름을 입력해 주세요.")
             return false;
          }else if(r_tell == ""){
             alert("휴대폰 번호를 입력해 주세요.")
             return false;
          }else if(!pattern.test(r_tell)){
             alert("휴대폰 번호 형식이 올바르지 않습니다.")
             return false;
          }else{
             $.ajax({
                type : "post",
                url : "<%=request.getContextPath()%>/board/reservation_insert.do",
                dataType : "json",
                data : obj,
                success : function(result){
                   if(result != 0){
                      //성공
                      // IMP.request_pay(param, callback) 결제창 호출
                       var r_idx = result;
                
                      console.log(r_idx);
                        IMP.request_pay({ // param
                            pg: "html5_inicis",
                            pay_method: "card",
                            merchant_uid: result,
                            name: "${boardVo.title}",
                            amount: "${reservationVo.r_cost}",
                        }, function (rsp) { // callback
                            if (rsp.success) {
                               jQuery.ajax({
                                    url: "${pageContext.request.contextPath}/board/payment_ok.do", 
                                    method: "POST",
                                    headers: { "Content-Type": "application/json" },
                                    data: {
                                        imp_uid: rsp.imp_uid,
                                        merchant_uid: rsp.merchant_uid
                                    }
                                }).done(function (result1) {
                                   location.href= "${pageContext.request.contextPath}/board/payment.do?r_idx="+result;
                                  
                                })
                              } else {
                               
                                $.ajax({
                                   
                                   type : "post",
                                 url : "<%=request.getContextPath()%>/board/reservation_delete.do",
                                 dataType : "json",
                                data : {"r_idx" : r_idx},
                                success : function(result2){
                                   if(result2 != 0){
                                      //삭제성공
                                       alert("결제에 실패하였습니다. 다시 시도해 주세요. 에러 내용: " +  rsp.error_msg);
                                   }else{
                                     //삭제실패
                                   }
                                }
                                })
                              }
                        });
                   }else{
                      // insert 실패
                   }
                }
             
             })
          }
          
          
          
          
          
          
          
           
         }
    
    
    
      
   </script>
</head>

<%@include file="/resources/include/fix-header.jsp" %>





	<nav class="main-check-box">
<div class="check-payment">
    <h2>확인 및 결제</h2>                                                                                                                                                    
</div >
<hr class="main-hr">
<div class="box-tong">
    <div class="reservation-info">
    <input type="hidden" name="r_sdate" id="r_sdate" value="${reservationVo.r_sdate}"/>
    <input type="hidden" name="r_edate" id="r_edate" value="${reservationVo.r_edate}"/>
    <input type="hidden" name="r_cost" id="r_cost" value="${reservationVo.r_cost}"/>
    <input type="hidden" name="board_idx" id="board_idx" value="${boardVo.board_idx}"/>
    <input type="hidden" name="m_idx" id="m_idx" value="${m_idx}"/>
        <h3>예약자 정보</h3>
        <p class="infoss">예약자 이름</p><br>
        <input class="regSize" type="text" name="r_name" id="r_name"> </br>
        <p class="infoss">핸드폰 번호</p> <br>
        <input class="regSize" type="text" name="r_tell" id="r_tell" placeholder="-를 넣어서 작성해 주세요.">
        
    </div>
    <hr class="hr-width">
    
    <div class="refund-policy">
        <h3>환불 정책</h3>
        <p>${boardVo.deleteDate } 전까지 무료로 취소하실 수 있습니다.<br>
             체크인 날짜인 ${r_sdate} 전에 취소하면 부분 환불을 받으실 수 있습니다.</p>
    </div>
    <hr class="hr-width">
    <div class="info-down">
        <p>아래 버튼을 선택하면 호스트가 설정한 숙소 이용규칙, JJBNB 
            재예약 및 환불 정책에 동의하며, <br>피해에 대한 책임이 본인에게 
            있을 경우 JJBNB가 결제 수단으로 청구의 조치를 취할 수 있다는 <br>
             사실에 동의하는 것입니다.</p>
    </div>
    	
   		 	<button class="w-btn w-btn-red" onclick="requestPay()">확인 및 결제</button>
   	  
</div>
<div class="payment-detail">
    <div class="top-content">
    <div class="img-view"><img src="${pageContext.request.contextPath}/resources/upload/${boardVo.origin_filename1}" width="120px" height="120px"></div>
    <div class="img-content">
        <p class="img-p">숙소 이름</p>
       
        <p class="img-pp">${boardVo.title}</p>
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
    </div>
</div>
 
<hr class="top-hr">
<h4>요금 세부정보</h4>
    <p class="p1">₩${boardVo.price} x 1박</p>
    <p class="p2">₩${boardVo.price}</p>
    <p class="p1">청소비</p>
    <p class="p2">₩${boardVo.cleaningFee}</p>
    <p class="p1">서비스 수수료</p>
    <p class="p2">₩${boardVo.commission}</p>
    
    <hr>
    <h4>예약 일자</h4>
    <p class="p1">체크인 날짜</p>
    <p class="p2">${reservationVo.r_sdate} 오후 3:00</p>
    <p class="p1">체크아웃 날짜</p>
    <p class="p2">${reservationVo.r_edate} 오전 11:00</p>
    <hr>
    <p class="p3">총 합계</p>
    <p class="p4"><input style="background-color: rgb(250,250,250);" type="text" id="days" size="10" value="${reservationVo.r_cost}" readonly/>원</p>
</div>

</nav>




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