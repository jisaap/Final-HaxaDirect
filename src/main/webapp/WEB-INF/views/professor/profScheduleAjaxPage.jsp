<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> <!-- 구글 i태그 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> <!-- 폰트어썸 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script> <!-- jsPDF -->
<script src="${pageContext.request.contextPath }/resources/js/html2canvas.js"></script> <!-- html2canvas -->


<!-- <div class="main-panel">
	<div class="content-wrapper">
Body section Start	
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">시간표</h4>
					</div>
				</div>
			</div>
			</div>
Main Content start -->





	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
			
<!-- <div class="row">
<div class="col-10"></div>
<div class="col-2">
	<i class="material-icons"><input type='button' style="border:0;background-color:rgba(255,255,255,0.3);" id="pdfschedule" value="picture_as_pdf"/></i>
	<i class="material-icons"><input type='button' style="border:0;background-color:rgba(255,255,255,0.3);" value='print' onclick='printSchedule();'></i>
</div>
</div> -->
 
				<table class="table table-hover" Border="1" style="text-align:center;">
					<thead>
						<tr>
							<th>/</th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th style="color:red;">토</th>
							<th style="color:blue">일</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<!-- <th style="width:50px;"><input type='text' value="1교시 (09:00~10:00)" style="border:none;text-align:center;font-weight:bold;" readonly/></th> -->
							<th style="width:50px;">1교시 <br/>(09:00~09:50)</th>
							<td><div id="mon1"></div></td>
							<td><div id="tue1"></div></td>
							<td><div id="wed1"></div></td>
							<td><div id="thu1"></div></td>
							<td><div id="fri1"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>2교시 <br/>(10:00~10:50)</th>
							<td><div id="mon2"></div></td>
							<td><div id="tue2"></div></td>
							<td><div id="wed2"></div></td>
							<td><div id="thu2"></div></td>
							<td><div id="fri2"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>3교시 <br/>(11:00~11:50)</th>
							<td><div id="mon3"></div></td>
							<td><div id="tue3"></div></td>
							<td><div id="wed3"></div></td>
							<td><div id="thu3"></div></td>
							<td><div id="fri3"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>4교시 <br/>(13:00~13:50)</th>
							<td><div id="mon4"></div></td>
							<td><div id="tue4"></div></td>
							<td><div id="wed4"></div></td>
							<td><div id="thu4"></div></td>
							<td><div id="fri4"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>5교시 <br/>(14:00~14:50)</th>
							<td><div id="mon5"></div></td>
							<td><div id="tue5"></div></td>
							<td><div id="wed5"></div></td>
							<td><div id="thu5"></div></td>
							<td><div id="fri5"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>6교시 <br/>(15:00~15:50)</th>
							<td><div id="mon6"></div></td>
							<td><div id="tue6"></div></td>
							<td><div id="wed6"></div></td>
							<td><div id="thu6"></div></td>
							<td><div id="fri6"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>7교시 <br/>(16:00~16:50)</th>
							<td><div id="mon7"></div></td>
							<td><div id="tue7"></div></td>
							<td><div id="wed7"></div></td>
							<td><div id="thu7"></div></td>
							<td><div id="fri7"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>8교시 <br/>(17:00~17:50)</th>
							<td><div id="mon8"></div></td>
							<td><div id="tue8"></div></td>
							<td><div id="wed8"></div></td>
							<td><div id="thu8"></div></td>
							<td><div id="fri8"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>9교시 <br/>(19:00~19:50)</th>
							<td><div id="mon9"></div></td>
							<td><div id="tue9"></div></td>
							<td><div id="wed9"></div></td>
							<td><div id="thu9"></div></td>
							<td><div id="fri9"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>10교시 <br/>(20:00~20:50)</th>
							<td><div id="mon10"></div></td>
							<td><div id="tue10"></div></td>
							<td><div id="wed10"></div></td>
							<td><div id="thu10"></div></td>
							<td><div id="fri10"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


<!-- <button id="inHere" onclick="testInnerHTML();">
	
</button>
<script type="text/javascript">
function testInnerHTML(){

	var str = "";
	var printme = document.getElementById("printme");
	var ptm=window.open('','Print-Window');
	ptm.document.open();
	str += "<html>";
	
	str += "<head>";
	str += '<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">'
	str += '<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js">'
	str += "</"
	str += "script>"
	str += "</head>";
	
	str += "<body onload='window.print()'>"+printme.innerHTML;
	
	
	str += "</body>";
	str += "</html>";
	
	console.log("str : " + str);
	ptm.document.write(str);
	ptm.document.close();
	ptm.print();
	ptm.close();

}
</script> -->




<script>

//프린트 버튼
function printSchedule(){
	var printme = document.getElementById("printme");
	var pt=window.open('','Print-Window');
	pt.document.open();
	pt.document.write('<html>'
			+'<head>'
			+'<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">'
			+'</head>'
			+'<body onload="window.print()">'
			+printme.innerHTML
			+'</body></html>');
	pt.document.body.innerHTML+='<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js">'+'</'+'script>';
	pt.document.body.innerHTML+='<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">'+'</'+'script>';
	pt.document.body.innerHTML+='<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">'+'</'+'script>';
	pt.document.close();
	pt.location.reload();
	pt.print();
	pt.close();
}


//PDF로 저장
$('#pdfschedule').click((e) => {
	html2canvas(document.querySelector("#printme")).then(canvas => { // jsPDF 객체 생성 생성자에는 가로, 세로 설정, 페이지 크기 등등 설정할 수 있다.
		// 현재 파라미터는 기본값이다 굳이 쓰지 않아도 되는데 저것이 기본값이라고 보여준다.
		var imgData = canvas.toDataURL('image/png'); //이미지 코드뽑기
		var imgWidth = 210; //이미지 width값 설정
		var pageHeight = 295; // 페이지 height값 설정
		var imgHeight = canvas.height * imgWidth / canvas.width; //이미지 height값 설정
		var heightLeft = imgHeight;
		var doc = new jsPDF('p', 'mm');
		var position = 0;
		doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
		heightLeft -= pageHeight;
		while (heightLeft >= 0) {
			position = heightLeft - imgHeight; doc.addPage();
			doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
			heightLeft -= pageHeight; 
		}
		doc.save('강의 시간표.pdf');

	});
});





//css설정
var scheduleCSS = {'background-color':'lightgray',
					'width':'115px',
					'font-weight':'bold',
					'border':'1px solid black'
					
}; //css에 들어갈 변수 

function profSchedule(subDate, subCode, subName, subTime, subYear, subRoom){
	
	console.log(subDate);
	if(subDate=='월'){
		if(subTime.includes("09:00")){
			$("#mon1").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("10:00")){
			$("#mon2").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("11:00")){
			$("#mon3").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("13:00")){
			$("#mon4").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("14:00")){
			$("#mon5").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("15:00")){
			$("#mon6").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("16:00")){
			$("#mon7").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("17:00")){
			$("#mon8").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("19:00")){
			$("#mon9").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("20:00")){
			$("#mon10").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
	}
	if(subDate=='화'){
		if(subTime.includes("09:00")){
			$("#tue1").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("10:00")){
			$("#tue2").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("11:00")){
			$("#tue3").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("13:00")){
			$("#tue4").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("14:00")){
			$("#tue5").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("15:00")){
			$("#tue6").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("16:00")){
			$("#tue7").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("17:00")){
			$("#tue8").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("19:00")){
			$("#tue9").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("20:00")){
			$("#tue10").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
	}
	if(subDate=='수'){
		if(subTime.includes("09:00")){
			$("#wed1").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("10:00")){
			$("#wed2").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("11:00")){
			$("#wed3").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("13:00")){
			$("#wed4").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("14:00")){
			$("#wed5").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("15:00")){
			$("#wed6").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("16:00")){
			$("#wed7").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("17:00")){
			$("#wed8").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("19:00")){
			$("#wed9").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("20:00")){
			$("#wed10").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
	}
	if(subDate=='목'){
		if(subTime.includes("09:00")){
			$("#thu1").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("10:00")){
			$("#thu2").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("11:00")){
			$("#thu3").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("13:00")){
			$("#thu4").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("14:00")){
			$("#thu5").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("15:00")){
			$("#thu6").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("16:00")){
			$("#thu7").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("17:00")){
			$("#thu8").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("19:00")){
			$("#thu9").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("20:00")){
			$("#thu10").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
	}
	if(subDate=='금'){
		if(subTime.includes("09:00")){
			$("#fri1").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("10:00")){
			$("#fri2").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("11:00")){
			$("#fri3").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("13:00")){
			$("#fri4").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("14:00")){
			$("#fri5").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("15:00")){
			$("#fri6").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("16:00")){
			$("#fri7").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("17:00")){
			$("#fri8").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("19:00")){
			$("#fri9").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
		if(subTime.includes("20:00")){
			$("#fri10").html(subName+"<br/>("+subRoom+"호)").parent().css(scheduleCSS);
		}
	}
	
}


<%List<Map<String,String>> schedule=null; 
	if(request.getAttribute("schedule")!=null){
		schedule = (ArrayList)request.getAttribute("schedule");
		for(int i=0; i<schedule.size(); i++){
%>
			<%-- var str<%=i%> = JSON.stringify("<%=schedule.get(i).get("SUB_TIME")%>");
			console.log(str<%=i%>); --%>
			var subDate<%=i%>='<%=schedule.get(i).get("SUB_DATE")%>';
			var subCode<%=i%>='<%=schedule.get(i).get("SUB_CODE")%>';
			var subName<%=i%>='<%=schedule.get(i).get("SUB_NAME")%>';
			var subTime<%=i%>='<%=schedule.get(i).get("SUB_TIME")%>';
			var subYear<%=i%>='<%=schedule.get(i).get("SUB_YEAR")%>';
			var subRoom<%=i%>='<%=schedule.get(i).get("SUB_ROOM")%>';
			console.log(subDate<%=i%>);
			console.log(subCode<%=i%>);
			console.log(subName<%=i%>);
			console.log(subTime<%=i%>);
			console.log(subYear<%=i%>);
			console.log(subRoom<%=i%>);
			
			profSchedule(subDate<%=i%>, subCode<%=i%>, subName<%=i%>, subTime<%=i%>, subYear<%=i%>, subRoom<%=i%>);

<%
		}
	}
%>

</script>

<style>
	.gap0{
		height:50px;
	}
	.gap1{
		height:100px;
	}
	.gap2{
		height:200px;
	}
	.gap3{
		height:300px;
	}
</style>

