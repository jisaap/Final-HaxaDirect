package com.kh.finalProject.student.model.service;

import com.kh.finalProject.student.model.vo.Student;

public interface StudentService1 {
	
	Student selectOne(String loginId,String loginPwd);

}