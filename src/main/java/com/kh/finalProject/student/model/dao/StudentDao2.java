package com.kh.finalProject.student.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.student.model.vo.Grade;
import com.kh.finalProject.student.model.vo.Request;

public interface StudentDao2 {
	
	List<Grade> selectGradeList(SqlSessionTemplate session, String stuNo);
	List<Map> gradeSearchSubType(SqlSessionTemplate session, String stuNo);
	
	int insertAppeal(SqlSessionTemplate session, Request request);

}
