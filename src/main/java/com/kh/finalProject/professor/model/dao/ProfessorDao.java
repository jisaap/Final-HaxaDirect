package com.kh.finalProject.professor.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.professor.model.vo.Professor;

public interface ProfessorDao {
	
	Professor selectOne(SqlSessionTemplate session, String loginId, String loginPwd);

}
