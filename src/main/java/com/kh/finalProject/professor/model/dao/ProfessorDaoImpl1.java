package com.kh.finalProject.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.professor.model.vo.InsertClass;
import com.kh.finalProject.professor.model.vo.ProfBoardAttachment;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

@Repository
public class ProfessorDaoImpl1 implements ProfessorDao1 {
	
	@Override
	public String selectProfName(SqlSessionTemplate session) {
		return session.selectOne("professor1.selectProfName");
	}
	//페이징 토탈데이타
	@Override
	public int selectBoardCount(SqlSessionTemplate session) {
		return session.selectOne("professor1.selectBoardCount");
	}
	//강의 개설뷰
	@Override
	public List<InsertClass> insertSubject(SqlSessionTemplate session){
		return session.selectList("professor1.insertSubject");
	}
	//강의 개설
	@Override
	public int selectSubCode(SqlSessionTemplate session, Map<String,String> map) {
		return session.selectOne("professor1.selectSubCode",map);
	}
	@Override
	public int insertSubjectEnd(SqlSessionTemplate session, Map<String, String> map) {
		return session.insert("professor1.insertSubjectEnd",map);
	}
	@Override
	public List<InsertClass> subjectView(SqlSessionTemplate session, Map<String,String> map){
		return session.selectList("professor1.subjectView",map);
	}
	//강의 상세조회
	public Map<String,String> selectSubjectView(SqlSessionTemplate session, String subCode){
		return session.selectOne("professor1.selectSubjectView",subCode);
	}

//	@Override
//	public int insertClassEnd(SqlSessionTemplate session, MultipartFile upfile, Map<String, String> map) {
//		return session.insert("professor1.insertClassEnd", map);
//	}
	//강의 개설 YN
	@Override
	public int subjectYn(SqlSessionTemplate session, String subCode) {
		return session.update("professor1.subjectYn", subCode);
	}
	//교수뷰
	@Override
	public Professor professorView(SqlSessionTemplate session) {
		return session.selectOne("professor1.professorView");
	}

	@Override
	public int updateProfessorEnd(SqlSessionTemplate session, Professor p) {
		
//		return session.insert("professor1.updateProfessor",profId);
		return session.update("professor1.updateProfessor",p);
		
	}
	
	@Override
	public int profUpdatePwdEnd(SqlSessionTemplate session, Map<String,String> map) {
		
		return session.update("professor1.profUpdatePwdEnd",map);
	}
	//게시판뷰
	@Override
	public List<ProfessorBoard> boardView(SqlSessionTemplate session,int cPage,int numPerPage){
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("professor1.boardView",null,row);
	}
	//게시판 작성
	
	@Override
	public int insertBoardEnd(SqlSessionTemplate session,ProfessorBoard pb) {
		return session.insert("professor1.insertBoardEnd",pb);
	}
	@Override
	public int insertBoardAttachment(SqlSessionTemplate session, ProfBoardAttachment pba) {
		return session.insert("professor1.insertBoardAttachment",pba);
	}
	//게시판 수정
	@Override
	public int updateBoardEnd(SqlSessionTemplate session, ProfessorBoard pb) {
		return session.update("professor1.updateBoardEnd",pb);
	}
	@Override
	public int updateAttachment(SqlSessionTemplate session, ProfBoardAttachment pba) {
		return session.update("professor1.updateAttachment",pba);
	}
	//게시판 삭제
	@Override
	public int deleteBoard(SqlSessionTemplate session, ProfessorBoard pb) {
		return session.delete("professor1.deleteBoard", pb);
	}
	@Override
	public int deleteAttachment(SqlSessionTemplate session, ProfBoardAttachment pba) {
		return session.delete("professor1.deleteAttachment", pba);
	}
	//게시판 상세
	@Override
	public ProfessorBoard selectBoardView(SqlSessionTemplate session, int profBoardNo) {
		return session.selectOne("professor1.selectBoardView",profBoardNo);
	}
	@Override
	public List<ProfBoardAttachment> selectProfAttachment(SqlSessionTemplate session, int profBoardNo) {
		return session.selectList("professor1.selectProfAttachment",profBoardNo);
	}
//	subject
	@Override
	public List<Subject> subjectCodeView(SqlSessionTemplate session,String profId){
		return session.selectList("professor1.subjectCodeView",profId);
	}
	@Override
	public Map<String,String> selectSubject(SqlSessionTemplate session, String subCode) {
		return session.selectOne("professor1.selectSubject",subCode);
	}
//	과목코드 눌렀을때 보이는 뷰
	@Override
	public int selectSubjectCode(SqlSessionTemplate session, String profId) {
		return session.selectOne("professor1.selectSubjectCode",profId);
	}
}
