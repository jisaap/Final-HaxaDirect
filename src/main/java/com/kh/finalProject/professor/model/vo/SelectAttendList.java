package com.kh.finalProject.professor.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;




@Data
@NoArgsConstructor
@AllArgsConstructor
public class SelectAttendList {
	
	private String subCode;
	private Date atDate;
	private String stuName;
	private String grade;
	private String deptName;
	
	
}
