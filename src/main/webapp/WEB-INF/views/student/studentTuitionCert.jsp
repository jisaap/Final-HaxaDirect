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
	 div { 
	 	border: 1px solid black;
	 }
	 
	 .divMarginBottom {
	 	margin-bottom: 3px;
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
</style>
<div class="main-panel">
	<div class="content-wrapper">
	<c:if test="${tuition eq null}">
		<div class="row">
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body" style="padding-bottom:3px;">
							<div style="margin-bottom: 10px;">
								<h4 class="font-weight-bold mb-0 textAlignCenter">
									<div id="acaYearSemByAjax">
									${selectYearSemKor} 조회된 등록금 납부 내역이 없습니다.
									</div>
								</h4>
							</div>
							<div class="divMarginBottom divMarginLeft">
								<h5 class="font-weight-bold mb-0"></h5>
							</div>
						</div>
						<div class="card-body" style="padding-bottom:13px;">
							<div class="form-group">
								<label for="selectYearSem">년도 학기별 선택</label>
								<select class="form-control form-control-sm" style="color:black;" id="selectYearSem">
								<c:forEach items="${tuitionCertList}" var="tcList">
									<option value="<c:out value="${tcList.acaYearSem }"/>">
										<c:out value="${tcList.acaYearSemKor }"/>
									</option>
								</c:forEach>
								</select>
							</div>
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
							<div class="form-group">
								<label for="selectYearSem">년도 학기별 선택</label>
								<select class="form-control form-control-sm" style="color:black;" id="selectYearSem">
								<c:forEach items="${tuitionCertList}" var="tcList">
									<option value="<c:out value="${tcList.acaYearSem }"/>">
										<c:out value="${tcList.acaYearSemKor }"/>
									</option>
								</c:forEach>
								</select>
							</div>
							<div style="margin-bottom:13px;"><h4 class="font-weight-bold mb-0">
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
							<div class="divMarginBottom divMarginLeft"><h4 class="font-weight-bold mb-0">
								<div class="textAlignCenter" style="margin-top:13px;" id="paymentStat"></div>
							</h4></div>
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
								<h5 class="font-weight-bold mb-0">
								<div id="paymentDate"></div>
								</h5>
							</div>
							<div class="divMarginBottom divMarginLeft">
								<h5 class="font-weight-bold mb-0">
								<div id="paymentCompleteText"></div>
								</h5>
							</div>
							<div class="divMarginBottom divMarginLeft font-weight-bold"  style="margin-top:10px;">
								<div class="textAlignCenter" style="margin-top:10px; margin-bottom:10px;" id="todayDate"></div>
								<div class="textAlignRight" style="padding-right:10px;">
									<h3 class="font-weight-bold mb-0"><div id="sign"></div></h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>	
		<script>
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
			<%if(tuition==null) { %>
				console.log("조회된 등록금이 없습니다.");
			<%}else { %>
				var acaYearSem='${tuition.acaYearSem}'.substring(0,4)+'학년도 '+'${tuition.acaYearSem}'.substring(6,7)+"학기";
				<%if(tuition.getPaymentStat()=='N') { %>
				console.log("아직 납부하지 않음.");
				$("#paymentStat").html(acaYearSem).css('color', 'royalblue');
				$("#paymentStat").append(" 등록금 납부 내역이 없습니다.");
				<%}else if(tuition.getPaymentStat()=='Y') { %>
				tuition=${tuition.tuition}; // 등록금 저장
				$("#tuition").html(numberWithCommas(tuition)+"원");  // 등록금에 1000원 단위로 컴마 추가하기
				//console.log('${tuition.acaYearSem}');
				$("#acaYearSem").html(acaYearSem+' 등록금 납입 증명서');
				
				var reductionMoney=0; // 감면금액 저장할 변수
				if("${tuition.reductionStat}"=="Y") { // 감면여부가 'Y'이면
					reductionMoney=${tuition.tuition}/2; // 등록금의 1/2 감면해 준다.
				}else if("${tuition.reductionStat}"=="N"){ // 감면여부가 'N'이면
					reductionMoney=0;
					console.log("감면 되지 않습니다.");
				}
				$("#reduction").html(numberWithCommas(reductionMoney)+"원");  // 감면금액에 1000원 단위로 컴마 추가하기
				var totalTuition=0;
				totalTuition=tuition-reductionMoney;
				$("#totalTuition").html(numberWithCommas(totalTuition)+"원");  // 총액에 1000원 단위로 컴마 추가하기
				
				var paymentDate; // 납부일 저장할 변수
				paymentDate="${tuition.paymentDate}";
				//console.log("paymentDate:"+paymentDate);
				$("#paymentDate").html("납부일: "+transDate(paymentDate));
				$("#paymentCompleteText").html("가상계좌 납부 완료");
				
				
				var today=new Date();
			    //console.log("today:"+getFormatDate(today));
			    
				$("#todayDate").html(getFormatDate(today));
				$("#sign").html("KH대학교 총장");
				
			<% 	}
			} %>
			
			$("#selectYearSem").on('change', function(){
				alert(this.value);
				
				// aJax 통신으로 해당 학년 학기 선택하기
				$.ajax({
						url:"${path}/student/tuitionCertAjax.hd",
						data:{"selectYearSem":this.value},
						success:function(data) {
							console.log("ajax 통신 성공:"+data);
							var tuitionObj=new Object();
							tuitionObj=JSON.parse(data); // JSON을 자바스크립트 객체로 변환하기
							var acaYearSemByAjax=tuitionObj.acaYearSem; // tuitionObj 객체의 acaYearSem 맴버변수 가져오기
							console.log("acaYearSemByAjax:"+acaYearSemByAjax);
			                acaYearSemByAjax=acaYearSemByAjax.substring(0,4)+'학년도 '+acaYearSemByAjax.substring(6,7)+"학기";
			                console.log(acaYearSemByAjax);
			                if(tuitionObj.paymentStat=='Y') {
			                	$("#acaYearSemByAjax").html(acaYearSemByAjax+" 조회된 등록금 납부 내역이 있습니다.");
			                }else if(tuitionObj.paymentStat=='N') {
				                $("#acaYearSemByAjax").html(acaYearSemByAjax+" 조회된 등록금 납부 내역이 없습니다.");
			                }
						}
					});
			});
		</script>


			<jsp:include page="/WEB-INF/views/common/footer.jsp" />