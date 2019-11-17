package com.kh.finalProject.schedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.schedule.model.service.ScheduleService;
import com.kh.finalProject.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	ScheduleService service;
	
	@RequestMapping("/schedule.hd")
	public String makeSchedule() {
		return "schedule/schedule";
	}
	
	@RequestMapping("/getCalendar.hd")
	@ResponseBody
	public HashMap<String, Object> getCalendar(String start, String end, HttpSession s)  {
		HashMap resultMap = new HashMap();		
		HashMap map = new HashMap();
		Employee e = (Employee)s.getAttribute("loginMember");
		resultMap.put("deptCode", e.getDeptCode().substring(0, 1).equals("0")?null:e.getDeptCode());
		resultMap.put("start", start);
		resultMap.put("end", end);
		List<Schedule> list = service.getCalendar(resultMap);
		map.put("list", list);
		return map;
	}
	
	
	@RequestMapping("/insertPlan.hd")
		public String insertPlan(String start, String end, String title, String deptCode, HttpSession s, Model model) {
		String msg ="";
		String loc = "/schedule.hd";
		Employee e = (Employee)s.getAttribute("loginMember");
		try {
			HashMap map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("title", title);
			map.put("deptCode", deptCode);
			service.insertPlan(map);
			msg = "일정 등록 완료";
		}catch(Exception x){
			msg = "일정 등록 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
		
	}
	
	@RequestMapping("/deleteCalendar.hd")
	@ResponseBody
//	public int deleteCalendar(String title, String start, String end) {
	public int deleteCalendar(String title, String start, String end, String deptCode) {
		Map map = new HashMap();
		int result = 0;
		map.put("title", title);
		map.put("start", start);
		map.put("end", end);
		map.put("deptCode", deptCode);
		try{
			result = service.deleteCalendar(map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
