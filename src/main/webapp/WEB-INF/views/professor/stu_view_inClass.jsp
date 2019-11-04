<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="{$pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/sool_header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>

<div class="container-fluid">
	수강생 조회
	<h3> 검색 입력 </h3>
  <form action="" method="post">
	  <table class="table table-bordered table-hover col-md-10" style="text-align : center;">
		  <thead class="thead-dark">
		  	<tr>
		  		<th>개설년도</th>
		  		<th>강의명</th>
		  		<th>학번</th>
		  		<th>이름</th>
		  		<th>학년</th>
		  		<th>학과</th>
		  		<th>검색하기</th>
		  	</tr>
		  </thead>
		  
		  <tbody>
		  	<tr>
		  		<td>
		  		<select name="openYear">
			  				<option value="#" selected>개설기간 선택</option>
			  				<option value="2019">2019</option>
						    <option value="2018">2018</option>
						    <option value="2017">2017</option>
						    <option value="2016">2016</option>
					</select>
		  		</td>
		  		<td>
			  		<select name="subjectName">
			  				<option value="*" selected>과목선택</option>
			  				<option value="E1203">영어영문학</option>
						    <option value="J123">자바프로그래밍</option>
						    <option value="chul">철학입문1</option>
						    <option value="Muyeok">무역영어</option>
					</select>
		  		</td>
		  		<td><input type="text" placeholder="학번검색(미입력시 전체)" value="" name="studentNo"/></td>
		  		<td><input type="text" placeholder="이름검색(미입력시 전체)" value="" name="studentName"/></td>
		  		<td>
		  			<select name="grade">
		  				<option value="*" selected>학년검색</option>
		  				<option value="1">1학년</option>
					    <option value="2">2학년</option>
					    <option value="3">3학년</option>
					    <option value="4">4학년</option>
					</select>
				</td>
		  		<td>
		  			<input type="text" placeholder="학과검색" value="" name="major"/>
		  		</td>
		  		<td><input type="submit" value="검색"></td>
		  		
		  	</tr>
		 	
		  </tbody>
		  
	  </table>
  </form>
	<!-- 수강생 정보 출력 끝 -->
	
	
	  <!-- 수업 정보 출력  -->
  <table class="table table-bordered table-hover" style="text-align : center;" >
  	<thead class="thead-dark">
  		<tr>
  			<th>
  			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon3">과목코드 &nbsp;&nbsp;&nbsp;</span>
			  <input type="text" class="form-control" aria-describedby="sizing-addon3" value="A3018" readonly>
			</div>
			</th>
  			<th>
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon3">개설년도 &nbsp;&nbsp;&nbsp;</span>
			  <input type="text" class="form-control" aria-describedby="sizing-addon3" value="2019" readonly>
			</div>
			</th>
  			<th>
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon3">개설학기 &nbsp;&nbsp;&nbsp;</span>
			  <input type="text" class="form-control"  aria-describedby="sizing-addon3" value="2학기" readonly>
			</div>
			</th>
  			<th>
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon3">교수이름 &nbsp;&nbsp;&nbsp;</span>
			  <input type="text" class="form-control"  aria-describedby="sizing-addon3" value="박성술" readonly>
			</div>
			</th>
  			<th>
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon3">핸드폰번호 &nbsp;&nbsp;&nbsp;</span>
			  <input type="text" class="form-control"  aria-describedby="sizing-addon3" value="01020176846" readonly>
			</div>
			</th>
		</tr>	
		<tr>	
  			<th>
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon3">강의시간 &nbsp;&nbsp;&nbsp;</span>
			  <input type="text" class="form-control"  aria-describedby="sizing-addon3" value="09:00~11:50 3교시" readonly>
			</div>
			</th>
  			<th>
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon3">강의장 &nbsp;&nbsp;&nbsp;</span>
			  <input type="text" class="form-control" aria-describedby="sizing-addon3" value="A-101" readonly>
			</div>
			</th>
  			<th>
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon3">교재-제목&nbsp;&nbsp;&nbsp;</span>
			  <input type="text" class="form-control"  aria-describedby="sizing-addon3" value="자바기초" readonly>
			</div>
			</th>
  			<th>
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon3">교재-저자&nbsp;&nbsp;&nbsp;</span>
			  <input type="text" class="form-control"  aria-describedby="sizing-addon3" value="유병승" readonly>
			</div>
			</th>
  			<th>
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon3">총원 &nbsp;&nbsp;&nbsp;</span>
			  <input type="text" class="form-control"  aria-describedby="sizing-addon1" value="32" readonly>
			</div>
			</th>
  		</tr>
  	</thead>
  	</table>
  
  <!-- 수업 정보 출력 끝 -->
	
	
	<!-- 수강생 출력 테이블 시작 -->	
	 <table class="table table-bordered table-hover" style="text-align : center;">
  	<thead class="thead-dark">
  		<tr>
  			<th>학번</th>
  			<th>이름</th>
  			<th>성별</th>
	 		<th>학과</th> 			
  			<th>학년</th>
  			<th>휴대폰번호</th>
			<th>메일주소</th>  			
  			<th>주소</th>
  			<th>과제A</th>
  			<th>과제B</th>
  			<th>과제C</th>
  			<th>과제D</th>
  			<th>중간고사</th>
  			<th>기말고사</th>
  		</tr>
  	</thead>
  	<tbody>
  		<tr>
  			<td>2019A123</td>
  			<td>박성술</td>
  			<td>남</td>
  			<td>영어영문학과</td>
  			<td>2학년</td>
  			<td>010-1234-1234</td>
  			<td>tjdtnf110@naver.com</td>
  			<td>서울시 성북구 하월곡동 오패산로 3길 17</td>
  			<td>제출</td>
  			<td>제출</td>
  			<td>미제출</td>
  			<td>미제출</td>
  			<td>91.79</td>
  			<td>98.50</td>
  		</tr>
  		<tr>
  			<td>2019A123</td>
  			<td>박성술</td>
  			<td>남</td>
  			<td>영어영문학과</td>
  			<td>2학년</td>
  			<td>010-1234-1234</td>
  			<td>tjdtnf110@naver.com</td>
  			<td>서울시 성북구 하월곡동 오패산로 3길 17</td>
  			<td>과제A</td>
  			<td>과제B</td>
  			<td>과제C</td>
  			<td>과제D</td>
  			<td>중간고사</td>
  			<td>기말고사</td>
  		</tr>
  		<tr>
  			<td>2019A123</td>
  			<td>박성술</td>
  			<td>남</td>
  			<td>영어영문학과</td>
  			<td>2학년</td>
  			<td>010-1234-1234</td>
  			<td>tjdtnf110@naver.com</td>
  			<td>서울시 성북구 하월곡동 오패산로 3길 17</td>
  			<td>과제A</td>
  			<td>과제B</td>
  			<td>과제C</td>
  			<td>과제D</td>
  			<td>중간고사</td>
  			<td>기말고사</td>
  		</tr>
  		
  		</tbody>
  </table>

	<ul class="pagination" style="justify-content: center;">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</div>
  
	

	<jsp:include page = "/WEB-INF/views/common/sool_footer.jsp"/>