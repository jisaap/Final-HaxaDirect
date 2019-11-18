<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
	tr, td, th {
			text-align: left;
			font-size: 13px;
			border:1px solid lightgray;
		
		}
	
	.form-control{
		font-size: 12px;
		width:150px;
		height:30px;
		padding:5px;
		color:black;
		display:inline-block;
		}
</style>

<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">Main Content</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<div class="col-md-8 row"
							style="display: block; text-align: center;">
			<table class="table table-condensed table-bordered table-hover"
				style="text-align: center;">
				<thead class="thead-dark">
					<tr>
						<th>
							<form method="get" action="${path }/prof/choiceClass.hd">
								<span>내강의리스트<span>
									<select id="selectSubList" class="form-control" style="color:black">
									<option value="">강의를 선택하세요</option>
									<c:forEach items="${studyList}" var="e" varStatus="v">
									<option value="${e.SUB_SEQ}">${e.SUB_NAME }</option>
									</c:forEach>
								</select>
								<input id="selectSubListhd" name="selectSubListhd" type="hidden" value=""/>
							
						</th>
						<th>
								<span>년도-학기선택</span>
								<select id="semChoice" class="form-control" style="color:black">
									<option value="">선택하세요</option>
									<c:forEach items="${acasemList}" var="e" varStatus="v">
									<option value="${e.ACA_YEAR_SEM}">${e.ACA_YEAR_SEM}</option>
									</c:forEach>
									
								</select>
								<input id="semChoicehd" name="semChoicehd" type="hidden" value=""/>
								
							</div>
						</th>
						
						<th>
							<button class="btn btn-primary btn-sm" type="submit" value="">검색</button>
						</form>
						</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	<div class="card-body">
		<div class="col-md-12">
			<table class="table table-condensed table-bordered table-hover"
				style="text-align: center;">
				<thead class="thead-dark">
					<tr>
						<th>학번</th>
						<th>이름</th>
						<th>학년</th>
						<th>학과</th>
						<th>과목</th>
						<th>평가</th>
						
					</tr>
				</thead>
				<tbody>
					
					<c:forEach items="${list}" var="e" varStatus="v">
					<tr>		
						<td>${e.STU_NO }</td>
						<td>${e.STU_NAME }</td>
						<td>${fn:substring(e.STU_YEAR_SEM,0,1)}</td>
						<td>${e.DEPT_NAME }</td>
						<td>${e.SUB_NAME }</td>
						<td>
							<button class="btn btn-primary btn-sm" 
							value="${e.STU_NO},${e.SUB_SEQ},${e.PROF_ID},${e.SUB_YEAR}-${e.SUB_SEMESTER},${e.SUB_CODE},${e.SUB_NAME},${e.COMPLETE_PT}"
							id="insertPoint" onclick="stuInsertScore(value)">평가하기</button>
							
						</td>
					</tr>
						</c:forEach>
					
					
				</tbody>
			</table>
						</div>
					</div>
					<div class="card-footer">
						<div style="display: block; text-align: right;">
							asdf
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Main-content End -->
		<!-- Body section End -->
		
<script>





	$("#selectSubList").change(function(){
		$("#selectSubListhd").val($("#selectSubList").val())
		console.log($("#selectSubListhd").val());
	});
	
	$("#semChoice").change(function(){
		$("#semChoicehd").val($("#semChoice").val())
		console.log($("#semChoicehd").val());
	});

	
	function stuInsertScore(value){
		
		

		 var url= "${path}/prof/stuInsertScore.hd?value="+value    //팝업창 페이지 URL
		 var winWidth = 1000;
	     var winHeight = 1000;
	     var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
		
	    window.open(url ,"",
			       "toolbar=no, width=1024, height=700, directories=no, status=no,scrollorbars=no, resizable=no");
	    
	}

</script>
	
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />