<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>



		<div class="main-panel">
   		<div class="content-wrapper">
<div class="card">
	<div class="card-body">
	<div class="row">
	</div>
			<div class="row">	
					<div class="table-responsive">		
				<table class="table">
					<tr>
						<!-- <th>번 호</th> -->
						<th>학과 명</th>
						<th>교수 번호</th>
						<th>교수 이름</th>
						<th>전화 번호</th>
						<th>이메일</th>
						<th> 주소</th>
					</tr>
			<c:forEach var="pro" items="${list}" varStatus="v">
						
					<tr class="listFor">
						<!-- <td>${v.count}</td> -->
						<td>${pro['DEPT_NAME'] }</td>
						<td>${pro['PROF_ID'] }</td>
						<td>${pro['PROF_NAME']}</td>
						<td>${pro['PHONE'] }</td>
						<td>${pro['EMAIL'] }</td>
						<td>${pro['ADDRESS'] }</td>
						<td>
					<input type="button" class="btn btn-outline-success btn-fw" onclick="detailProf('${pro['PROF_ID']}');" value="상세 정보"/>
				</td>					
			</tr>
		</c:forEach>
	</table>
	
	</div>
	</div>
	<div class="card-footer">
			${pageBar }
		</div>
	</div>
</div>



<div id="myModal" class="modal">
		<div class="modal-content">


		</div>
	</div>	
	



<script>



function insertNewProf() {
   $(".modal").css("display","block");

}

$(function(){
	$(".btn_close").click(function(){
		$(".modal").css("display","none");
	});
});

$(function(){
	$(".close").click(function(){
		$(".modal").css("display","none");
	});
});

</script>
	

<style>

	.listFor > td {
		font-size: 13px;
		
	}
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
	.modal{
		display: none;
		position : fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height:100%;	
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
</style>

	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>