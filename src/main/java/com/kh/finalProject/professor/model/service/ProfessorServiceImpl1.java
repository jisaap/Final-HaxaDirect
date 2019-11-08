package com.kh.finalProject.professor.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.professor.model.dao.ProfessorDao1;
import com.kh.finalProject.professor.model.vo.InsertClass;
import com.kh.finalProject.professor.model.vo.ProfBoardAttachment;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

@Service
public class ProfessorServiceImpl1 implements ProfessorService1 {

	@Autowired
	private ProfessorDao1 dao;
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public String selectProfName() {
		
		String profName = dao.selectProfName(session);
		
		return profName;
	}
	//페이징 토탈데이타
	@Override
	public int selectBoardCount() {
		int totalData = dao.selectBoardCount(session);
		return totalData;
	}
	//강의 개설
	@Override
	@Transactional
	public List<InsertClass> insertSubjectEnd(Map<String, String> map) throws RuntimeException {
		int result = 0;
		
		result = dao.insertSubjectEnd(session, map); // insertClass
		if(result==0) {
				throw new RuntimeException();
		}
		List<InsertClass> list = dao.subjectView(session,map); 
		
		return list;
	}

	//교수뷰
	@Override
	public Professor professorView() {
		
		Professor p = dao.professorView(session);
		
		return p;
	}

	@Override
	public int updateProfessorEnd(Professor p) {
		
		int result = dao.updateProfessorEnd(session, p);
//		if(result>0) {session.commit();}
//		else {session.rollback();}
		
		return result;
	}
	
	@Override
	public int profUpdatePwdEnd(Map<String,String> map) {
		
		int result = dao.profUpdatePwdEnd(session, map);
		
		return result;
	}
	//게시판뷰
	@Override
	public List<ProfessorBoard> boardView(int cPage,int numPerPage){
		List<ProfessorBoard> list = dao.boardView(session,cPage,numPerPage);
		return list;
	}
	//게시판 작성
	@Override
	@Transactional
	public int insertBoardEnd(ProfessorBoard pb, List<ProfBoardAttachment> list) throws RuntimeException {
		int result = 0;
		
		result = dao.insertBoardEnd(session,pb);
		
		for(ProfBoardAttachment pba : list) {
			pba.setProfBoardNo(pb.getProfBoardNo());
			result = dao.insertBoardAttachment(session, pba);
			
		}
		if(result==0) {
			throw new RuntimeException();
		}
		
		return result;
		
	}
	//게시판 수정
	@Override
	@Transactional
	public int updateBoardEnd(ProfessorBoard pb, List<ProfBoardAttachment> list) throws RuntimeException{
		int result = 0;
		
		result = dao.updateBoardEnd(session,pb);
		
		for(ProfBoardAttachment pba : list) {
			pba.setProfBoardNo(pb.getProfBoardNo());
			result = dao.updateAttachment(session, pba);
		}
		if(result == 0) {
			throw new RuntimeException();
		}
		return result;
		
	}
//	게시판select
	@Override
	public ProfessorBoard selectBoardView(int profBoardNo) {
		return dao.selectBoardView(session, profBoardNo);
	}
	@Override
	public List<ProfBoardAttachment> selectProfAttachment(int profBoardNo) {
		return dao.selectProfAttachment(session, profBoardNo);
	}
//	subject
	@Override
	public List<Subject> subjectCodeView(String profId){
		
		List<Subject> list = dao.subjectCodeView(session,profId);
		
		return list;
	}
	//코드불러오기
	@Override
	public Map<String,String> selectSubject(String subCode) {
		Map<String,String> map = dao.selectSubject(session, subCode);
		return map;
	}
}
