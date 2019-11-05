package com.kh.finalProject.req.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Req {
	
	private String reqNo;
	private String reqTitle;
	private String reqContents;
	private String fromName;
	private String toName;
	private Date toTime;
	private String reqRead;
	

}
