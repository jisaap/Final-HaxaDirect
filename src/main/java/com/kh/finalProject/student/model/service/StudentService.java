package com.kh.finalProject.student.model.service;

import com.kh.finalProject.student.model.vo.Student;

public interface StudentService {
	
	Student selectOne(String loginId,String loginPwd);
	Student stuIdSearch(Student s);
	int stuPwChange(String stuPw,String stuNo);
}
