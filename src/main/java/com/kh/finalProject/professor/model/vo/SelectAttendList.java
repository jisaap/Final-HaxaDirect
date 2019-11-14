package com.kh.finalProject.professor.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;




@Data
@NoArgsConstructor
@AllArgsConstructor
public class SelectAttendList {
	private String profId;
	private String subCode;
	private String checkDate;
	private String stuName;
	private String grade;
	private String deptName;
	private String sysdate;
	
	//ajax용 변수
	private String stuNo;
	
}
