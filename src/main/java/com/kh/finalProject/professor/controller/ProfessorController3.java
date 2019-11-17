package com.kh.finalProject.professor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalProject.professor.model.service.ProfessorService3;
import com.kh.finalProject.professor.model.vo.Professor;

@Controller
public class ProfessorController3 {
	// 학과생조회

	@Autowired
	ProfessorService3 service;

	
	
	@RequestMapping("/prof/editClassPoint.hd")	
	public String gradeEdit(HttpSession session, Model m,HttpServletRequest req) {	
		
		Professor p=(Professor)session.getAttribute("loginMember");
		
		/*Map<String,Object> param=new HashMap();*/
		String profId=p.getProfId();
		/*String profPw=p.getProfPw();*/
		/* param.put("profId",profId); */
		/*param.put("profPw",profPw);*/
		List<Map> list = service.gradeEdit(profId);
		List<Map> studyList=service.studyList(profId);
		
		m.addAttribute("studyList",studyList);
		m.addAttribute("list",list);
	
		
		return "professor/stu_edit_classResult";
	
	}	
	
	@RequestMapping("/prof/choiceClass.hd")	
	public String choiceClass(HttpSession session, Model m,HttpServletRequest req) {
		Map<String,Object> param = new HashMap();
		Professor p=(Professor)session.getAttribute("loginMember");
		String profId=p.getProfId();
		
		String subSeq=req.getParameter("selectSubListhd");
		String semester=req.getParameter("semChoicehd");
		param.put("subSeq",subSeq);
		param.put("semester",semester);
		param.put("profId",profId);
		List<Map> list = service.choiceClass(param);
		
		m.addAttribute("list",list);
	
		return"professor/stu_edit_classResult";
	}

	@RequestMapping("/prof/stuInsertScore.hd")	
	public String stuInsertScore(HttpSession session, Model m,HttpServletRequest req) {	
		Map<String,Object> param=new HashMap();	
		String value=req.getParameter("value");
		System.out.println(value);
		String[] value1=value.split(",");
		String stuId=value1[0];
		String subSeq=value1[1];
		String profId=value1[2];
		String yearSem=value1[3];
		String subCode=value1[4];
		String subName=value1[5];
		String compPt=value1[6];
		param.put("profId",profId);
		param.put("stuId",stuId);
		param.put("subSeq",subSeq);
		param.put("yearSem",yearSem);
		param.put("subCode",subCode);
		param.put("subName",subName);
		param.put("compPt",compPt);
		
		Map<String,Object> flag = service.gradeFlag(param);
		
		if(flag==null) {
			
			int result1=service.firstGrade(param);
			
		}
	
		 Map<String,Object> result=service.stuInsertScore(param); 
		 m.addAttribute("result",result);
		 System.out.println(result);
		
		
		return "professor/stuInsertScore";
		
		
	}
	
	
	@RequestMapping(value = "/prof/updatePoint.hd", method = RequestMethod.POST)
	@ResponseBody
	public String updatePoint(HttpSession session, Model m,HttpServletRequest req) {
		
		Map<String,Object> param=new HashMap();
			String pointInfo=req.getParameter("value");
			String[] pointInfo1=pointInfo.split(",");
			
			String updateCol=pointInfo1[0];
			String subSeq=pointInfo1[1];
			String stuId=pointInfo1[2];
			String updatePoint=pointInfo1[3];
			
			param.put("updateCol",updateCol);
			param.put("subSeq",subSeq);
			param.put("stuId",stuId);
			param.put("updatePoint",updatePoint);
			
		
			int result = service.updatePoint(param);
			
	
		
		
		return "";
		
		
	}
	
	
	
	
	
	
	
}
	
	