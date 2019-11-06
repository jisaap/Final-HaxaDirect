package com.kh.finalProject.req.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.req.model.dao.ReqDao;
import com.kh.finalProject.req.model.vo.Req;

@Service
public class ReqServiceImpl implements ReqService {
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private ReqDao dao;

	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insertReq(Req req) throws Exception{
		
		int result=dao.insertReq(session,req);
		if(result==0) {
			throw new Exception();
		}
		return result;
	}

	@Override
	public List<Req> reqList() {
		List<Req> list=dao.reqList(session);
		return list;
	}

	@Override
	public Req reqOne(int reqNo) {
		Req req=dao.reqOne(session,reqNo);
		return req;
	}

	@Override
	public int answerUpdate(int reqNo) {
		int answerUpdate=dao.answerUpdate(session,reqNo);
		return answerUpdate;
	}

	@Override
	public int reqUpdate(int reqNo) {
		int reqUpdate=dao.reqUpdate(session,reqNo);
		return reqUpdate;
	}
	
	
	
	
	
	

}
















