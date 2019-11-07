package com.kh.finalProject.employee.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.beforeStudent.model.service.BeforeStuService;
import com.kh.finalProject.beforeStudent.model.service.BeforeStuServiceImpl;
import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.common.encrypt.MyEncrypt;
import com.kh.finalProject.email.controller.MailController;
import com.kh.finalProject.employee.model.service.EmployeeService;
import com.kh.finalProject.student.model.vo.Student;

@Controller
public class EmployeeController {

	@Autowired
	MailController handler;
	@Autowired
	private MyEncrypt enc; 
	@Autowired
	private EmployeeService service;
	
	@Autowired
	BeforeStuService bService;

	static Map<Object, Integer> count = new HashMap();

	@RequestMapping("/enrollStudent.hd")
	public ModelAndView enrollStudent() {
		ModelAndView mv = new ModelAndView();
		
		List list = service.enrollStuList();
		mv.setViewName("admin/enrollStudent");
		mv.addObject("list", list);
		return mv;
		}
	
	
		@RequestMapping("insertNewStu.do")
		@ResponseBody
		public int insertNewStu(@RequestParam int beforeStu, HttpServletRequest req) {
			BeforeStu bs = service.selectBeforeStu(beforeStu);
			Student s = settingNewStudent(bs);
			try {
				int result = service.insertNewStu(s, beforeStu);
				handler.forSendEmail(s.getStuEmail(), "KH 대학교에 입학 하신것을 축하드려요!", "아이디 : "+s.getStuNo()+"   \r\n    비밀번호 : "+enc.decrypt(s.getStuPw())+" 입니다 .  \r\n 최초 로그인 이후 비밀번호를 수정해 주세요.", req);
			}catch(Exception e) {
				System.out.println("에러");
				return 0;
			}
			
		
		return beforeStu;
		}
		
	public Student settingNewStudent(BeforeStu bs) {
		
		Student s = new Student();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate  = sdf.format(date);
		Map sMap = settingStudentNumber(bs.getBeforeDeptCode());
		int stuNum = (int)sMap.get(bs.getBeforeDeptCode());
		System.out.println("stuNum : " + stuNum);
		String stuNo = "S" +sysdate.substring(0, 4) + bs.getBeforeDeptCode() + String.format("%03d", stuNum);
		s.setStuNo(stuNo);
		s.setStuName(bs.getBeforeName());
		try {
			//암호화된 주민등록번호 디코딩해서 생년월일만 패스워드로 저장함
			s.setStuPw(enc.decrypt(bs.getBeforeNo()).substring(0, 6));
			//패스워드 초기 패스워드 암호화함 
			s.setStuPw(enc.encrypt(s.getStuPw()));

			// 성별땜에
			bs.setBeforeNo(enc.decrypt(bs.getBeforeNo()));
			// 성별 설정
			s.setGender(bs.getBeforeNo().substring(6, 7).equals("1") || bs.getBeforeNo().substring(6, 7).equals("3")?"M": bs.getBeforeNo().substring(6, 7).equals("2") || bs.getBeforeNo().substring(6, 7).equals("4")?"F":"");
			
			// 다시 암호화
			bs.setBeforeNo(enc.encrypt(bs.getBeforeNo()));
			
			// 로그인 matches 양식
//			String su = "911010";
//			System.out.println("매치 :" + s.getStuPw().matches(su));
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		s.setStuTel(bs.getBeforePhone());
		s.setStuAddr(bs.getBeforeAddr());
		s.setStuSsn(bs.getBeforeNo());
		s.setDeptCode(bs.getBeforeDeptCode());
		s.setStuEmail(bs.getBeforeEmail());
		s.setRegStatus("재학");
		s.setStuYearSem(bs.getBeforeType().equals("정시") || bs.getBeforeType().equals("수시") ?"1-1":"미정");
		return s; 
	}
	
	// 학과 코드랑 
	public Map settingStudentNumber(String deptCode) {

		List<Map> colList = bService.selectColList();
		for(Map col : colList) {
			List<Map> deptList = bService.selectDeptList((String)col.get("COL_CODE"));
			for(int i = 0; i < deptList.size(); i ++) {
			
				if(count.containsKey(deptList.get(i).get("DEPT_CODE"))) {
					if(deptCode.equals(deptList.get(i).get("DEPT_CODE"))) {
					int lastNum = service.selectLastNum(deptCode);
					count.put(deptList.get(i).get("DEPT_CODE"), lastNum + 1);
					}
					}else {
					if(deptCode.equals(deptList.get(i).get("DEPT_CODE"))) {
						int lastNum = service.selectLastNum(deptCode);
					count.put(deptList.get(i).get("DEPT_CODE"), lastNum + 1);
					}else {
						count.put(deptList.get(i).get("DEPT_CODE"), 1);
					}
				}
			}
			
		}
		return count;
	}
	
}
