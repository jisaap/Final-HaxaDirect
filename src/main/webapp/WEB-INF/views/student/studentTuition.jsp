<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page import="com.kh.finalProject.student.model.vo.StuTuition" %>
<%
	// 등록금 관련 객체 가져오기
	StuTuition tuition = null; 
	if(request.getAttribute("tuition") != null) {
		tuition = (StuTuition)request.getAttribute("tuition");
	}
%> 
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
	table, tr, td, th {
	 	cursor: auto;
	 }
	 
	 /* ui 테스트용 */
	/* div { 
	 	border: 1px solid black;
	 } */
	 
	 .divMarginBottom {
	 	margin-bottom: 7px;
	 }
	  .divMarginLeft {
	 	margin-left: 13px;
	 }
	 .textAlignCenter {
	 	text-align:center;
	 }
	 .textAlignRight {
	 	text-align:right;
	 }
	 #signImg{
	 	position: relative;
	 	z-index: 2;
	 	background-repeat: no-repeat;
	 	background-image: url(${path }/resources/images/image/KH대학교_총장직인.png);
	 	background-position: 1% 1%;
	 	height:100px;
	 }
	 .btn-primary {
	    background-color: #3ec172;
	    border-color: #3ec172;
	}
	.btn-primary:hover {
	    background-color: #0dad4c;
	    border-color: #0dad4c;
	}
</style>
<div class="main-panel">
	<div class="content-wrapper">
	<c:if test="${tuition eq null}">
		<div class="row">
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body" style="padding-bottom:3px;">
							<div style="margin-bottom: 10px;"><h4 class="font-weight-bold mb-0 textAlignCenter">
								조회된 등록금 고지서가 없습니다.
							</h4></div>
							<div class="divMarginBottom divMarginLeft"><h5 class="font-weight-bold mb-0">
						</div>
						<div class="card-body" style="padding-top:3px; padding-bottom:3px;">
						<div class="table-responsive">
							<table class="table table-hover table-striped">
								<thead class="thead-dark">
									<tr>
										<th class="textAlignCenter">구분</th>
										<th class="textAlignCenter">금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="font-weight-bold mb-0 textAlignCenter">등록금</td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="tuition"></div></td>
									</tr>
									<tr>
										<td class="font-weight-bold mb-0 textAlignCenter">감면액</td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="reduction"></div></td>
									</tr>
									<tr>
										<td class="font-weight-bold mb-0 textAlignCenter">총액</td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="totalTuition"></div></td>
									</tr>
								</tbody>
							</table>
						</div>
						</div>
						<div class="card-body" style="padding-top:3px; padding-bottom:30px;">
						</div>
					</div>
				</div>
			</div>
	</c:if>
	<c:if test="${tuition ne null}">
		<div class="row">
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body" style="padding-bottom:13px;">
							<div style="margin-bottom:13px; color:royalblue;"><h4 class="font-weight-bold mb-0">
								<div id="acaYearSem"></div>
							</h4></div>
							<div class="divMarginBottom divMarginLeft"><h5 class="font-weight-bold mb-0">
								학번: ${tuition.stuNo}
							</h5></div>
							<div class="divMarginBottom divMarginLeft"><h5 class="font-weight-bold mb-0">
								성명: ${tuition.stuName}
							</h5></div>
							<div class="divMarginBottom divMarginLeft"><h5 class="font-weight-bold mb-0">
								생년월일: ${tuition.birthday}
							</h5></div>
							<div class="divMarginBottom divMarginLeft"><h5 class="font-weight-bold mb-0">
								학과: ${tuition.deptName}
							</h5></div>
						</div>
						<div class="card-body" style="padding-top:3px; padding-bottom:3px;">
						<div class="table-responsive">
							<table class="table table-hover table-striped">
								<thead class="thead-dark">
									<tr>
										<th class="textAlignCenter">구분</th>
										<th class="textAlignCenter">금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="font-weight-bold mb-0 textAlignCenter">등록금</td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="tuition"></div></td>
									</tr>
									<tr>
										<td class="font-weight-bold mb-0 textAlignCenter">감면액</td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="reduction"></div></td>
									</tr>
									<tr>
										<td class="font-weight-bold mb-0 textAlignCenter">총액</td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="totalTuition"></div></td>
									</tr>
								</tbody>
							</table>
						</div>
						</div>
						<div class="card-body" style="padding-top:13px; padding-bottom:30px;">
							<div class="divMarginBottom divMarginLeft">
								<h6 class="font-weight-bold mb-0">
								<div id="dueDate"></div>
								</h6>
							</div>
							<div class="divMarginBottom divMarginLeft">
								<h6 class="font-weight-bold mb-0">
									가상계좌 납부: 국민은행 20-12321-12421
								</h6>
							</div>
							<div class="divMarginBottom divMarginLeft font-weight-bold">
								<div class="textAlignCenter" id="todayDate"></div>
								<div class="row">
									<div class="col-6" style="padding-right:0px;">
										<div style="padding-top:30px; text-align:right;">
										<h3 class="font-weight-bold mb-0">K&nbsp;H&nbsp;대&nbsp;학&nbsp;교</h3>
										</div>
									</div>
									<div class="col-6">
										<div id="signImg">
											<div style="padding-top:29px; margin-left:10px; text-align:left;">
											<h3 class="font-weight-bold mb-0">총&nbsp;장</h3>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="divMarginBottom divMarginLeft font-weight-bold textAlignCenter">
							<%if(tuition.getPaymentStat()=='Y') { %>
							<h3 class="font-weight-bold mb-0" style="color:royalblue;">납부 완료</h3>
							<%}else if(tuition.getPaymentStat()=='N') { %>
								<input type="button" class="btn btn-primary font-weight-bold" style="font-size:25px; width:70%;" value="납부하기" onclick="payTuition();">
							<%} %>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>	
		
		<!-- 아임포트 cdn -->
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		
		<script>
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp79492569'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		

		function getFormatDate(date) { // yyyyMMdd 포맷으로 변환하는 함수
		    var year=date.getFullYear(); // yyyy
		    var month=(1+date.getMonth()); // M
		    month=month>=10?month:'0'+month; // month 두자리로 저장하기
		    var day=date.getDate(); // d
		    day=day>=10?day:'0'+day; // day 두자리로 저장
		    return year+'년 '+month+'월 '+day+'일';
		}
		
		function transDate(date) { // 문자열 매개변수를 년월일 형태로 변환해주는 함수
			var year=date.split('-')[0];
			var month=date.split('-')[1];
			var day=date.split('-')[2];
			
			return year+'년 '+month+'월 '+day+'일';
		}
		
			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			};
			
			var tuition=0; // 등록금 저장할 변수
			var totalTuition=0; // 등록금-감면액 저장할 변수
			<%if(tuition==null) { %>
				console.log("조회된 등록금이 없습니다.");
			<%}else { %>
				tuition=${tuition.tuition}; // 등록금 저장
				$("#tuition").html(numberWithCommas(tuition)+"원");  // 등록금에 1000원 단위로 컴마 추가하기
				
				var acaYearSem='${tuition.acaYearSem}'.substring(0,4)+'학년도 '+'${tuition.acaYearSem}'.substring(6,7)+"학기";
				// console.log(acaYearSem);
				$("#acaYearSem").html(acaYearSem+' 등록금 고지서');
				
				var reductionMoney=0; // 감면금액 저장할 변수
				if("${tuition.reductionStat}"=="Y") { // 감면여부가 'Y'이면
					reductionMoney=${tuition.tuition}/2; // 등록금의 1/2 감면해 준다.
				}else if("${tuition.reductionStat}"=="N"){ // 감면여부가 'N'이면
					reductionMoney=0;
					// console.log("감면 되지 않습니다.");
				}
				$("#reduction").html(numberWithCommas(reductionMoney)+"원");  // 감면금액에 1000원 단위로 컴마 추가하기
				totalTuition=tuition-reductionMoney;
				$("#totalTuition").html(numberWithCommas(totalTuition)+"원");  // 총액에 1000원 단위로 컴마 추가하기
				
				var dueDate; // 납입기한 저장할 변수
				dueDate="${tuition.dueDate}";
				//console.log("dueDate:"+dueDate);
				dueDate=dueDate.substring(0, 10);
				$("#dueDate").html("납입기한: "+transDate(dueDate)+" 까지");
				
				var today=new Date();
			    //console.log("today:"+getFormatDate(today));
			    
				$("#todayDate").html(getFormatDate(today));
				//var msg="";
				function payTuition() {
					IMP.request_pay({
					    pg : 'html5_inicis', // version 1.1.0부터 지원.
					    pay_method : 'vbank',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : 'KH대학교 ${tuition.acaYearSem} 등록금 납부', // 결제창에서 보여질 이름
					    amount : totalTuition, // 총 등록금액
					    buyer_email : '${student.stuEmail}',
					    buyer_name : '${student.stuName}',
					    buyer_tel : '${student.stuTel}',
					    buyer_addr : '${student.stuAddr}',
					    buyer_postcode : '${student.stuPostcode}',
					    vbank_due : dueDate
					   //  m_redirect_url : 'https://www.yourdomain.com/payments/complete'
					}, function(rsp) {
					    if ( rsp.success ) {
					    	// aJax 통신으로 해당 학년 학기 선택하기
							var result='';
							$.ajax({
									url:"${path}/student/payTuitionAjax.hd",
									type: 'POST',
									data:{"acaYearSem": '${tuition.acaYearSem}'},
									success:function(data) {
										//console.log("ajax 통신 성공:"+data);
										var resultObj=new Object();
										resultObj=JSON.parse(data); // JSON을 자바스크립트 객체로 변환하기
										//console.log("resultObj:"+resultObj);
										//console.log("typeof resultObj:"+typeof resultObj);
										if(resultObj=='1') {
											var msg = 'KH대학교 ${tuition.acaYearSem} 등록금 납부가 완료되었습니다.';
											//alert("1:"+data);
									        //console.log("1:"+data);
									        alert(msg);
									        location.href="${path}/student/tuitionBill.hd";
										}else if(resultObj=='0') {
											var msg = 'KH대학교 ${tuition.acaYearSem} 등록금 납부에 실패하였습니다.';
											//alert("2:"+data);
									        //console.log("2:"+data);
											alert(msg);
											location.href="${path}/student/tuitionBill.hd";
										}
									}
								})


					    } else {
					    	var msg = '등록금 납부에 실패하였습니다.\n';
					        msg += rsp.error_msg; // 에러 내용
						    alert(msg);
					    	location.href="${path}/student/tuitionBill.hd";
					    }
					});
				}
			<%} %>
			
		</script>


			<jsp:include page="/WEB-INF/views/common/footer.jsp" />