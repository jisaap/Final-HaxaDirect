package com.kh.finalProject.professor.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.service.ProfessorService2;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.student.model.vo.Student;

@Controller
public class ProfessorController2 {
	//학과생조회
	
	@Autowired
	ProfessorService2 service;
	
	@RequestMapping("prof/viewInMajor.hd")
	public String viewInMajor(SelectInMajor sim, @RequestParam(value="cPage",required=false,defaultValue="1")int cPage ,Model model, HttpSession session){
//		@RequestParam(required = false) ? 왜 
		int numPerPage=10;
//		List<ProfessorBoard> list = service.boardView(cPage, numPerPage);
//		int totalData = service.selectBoardCount();
		Professor p = (Professor)session.getAttribute("loginMember");
		String deptCode = p.getDeptCode();
		if(sim != null) {
			System.out.println("notnull"+sim.getDeptCode());
			System.out.println(sim.getStuName());
			System.out.println(sim.getStuNo());
			System.out.println(sim.getGrade());
		sim.setDeptCode(deptCode);
		} else if(sim == null) {
			sim = new SelectInMajor();
			sim.setDeptCode(deptCode);
			System.out.println("null"+sim.getDeptCode());
			System.out.println(sim.getStuName());
			System.out.println(sim.getStuNo());
			System.out.println(sim.getGrade());
		}
		System.out.println(sim.getDeptCode());
		
		List<Student> list = service.selectInMajor(sim, cPage, numPerPage);
		
		int totalData = service.countInDept(sim);
		
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalData);
		model.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/prof/viewInMajor.hd"));
		
		return "professor/stu_view_inMajor";
	}
	//수강생 조회
	@RequestMapping("prof/viewInClass.hd")
	public String viewInClass(@RequestParam(value="cPage",required=false,defaultValue="1")int cPage ,Model model) {
		int numPerPage=5;
		
		
//		List<Student> list = service.selectInClass();
//		
//		model.addAttribute("board",list);
//		model.addAttribute("totalCount",totalData);
//		model.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/professor/lectureData"));
		
		return "professor/stu_view_inClass";
	}
	
	//출결조회
	@RequestMapping("prof/viewClassAttend.hd")
	public String viewClassAttend(HttpServletRequest req , Model model) {
		System.out.println(req.getParameter("attendDate"));
		System.out.println(req.getParameter("subjectName"));
		System.out.println(req.getParameter("studentName"));
		System.out.println(req.getParameter("grade"));
		
		return "professor/stu_view_classAttend";
	}
	//성적 관리
	@RequestMapping("prof/editClassResult.hd")
	public String editClassResult() {
		
		return "professor/stu_edit_classResult";
	}
	
	//강의평가조회
	@RequestMapping("prof/view_evaluation.hd")
	public String viewEvaluation() {
		
		return "professor/prof_view_classEvaluation";
	}
	
	
	//과제등록
	@RequestMapping("prof/upAssignment.hd")
	public String upAssignment() {
		
		
		return "professor/up_assignment";
	}
	
	//과제 제출 조회
	@RequestMapping("prof/viewAssignment.hd")
	public String viewAssignment () {
		
		
		return "professor/view_assignment";
	}
	
	
	
	//성적 이의신청 조회
	@RequestMapping("prof/viewObjection.hd")
	public String viewObjection () {
		
		return "professor/stu_view_objection";
	}
	
	
	@RequestMapping("prof/popupBoard")
	public String popupBoard() {
		
		return "professor/prof_view_subjectBoard";
	}
}
