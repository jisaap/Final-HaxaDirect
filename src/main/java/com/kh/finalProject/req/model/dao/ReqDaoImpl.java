package com.kh.finalProject.req.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.req.model.vo.Req;

@Repository
public class ReqDaoImpl implements ReqDao {

	@Override
	public int insertReq(SqlSessionTemplate session, Req req) {
		return session.insert("req.insertReq",req);
	}
	
	

}