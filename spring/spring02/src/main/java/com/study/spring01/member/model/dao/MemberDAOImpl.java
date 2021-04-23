package com.study.spring01.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.study.spring01.member.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	//로깅 처리를 위한 객체 선언
	//import org.slf4j.Logger;
	//import org.slf4j.LoggerFactory;
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	//SqlSession 객체를 개발자가 직접 생성하지 않고 스프링에서 연결시켜 줌.
	@Inject //의존관계를 주입한다.
	SqlSession sqlSession;  //SqlSession이 mybatis 세션이다. 여기서 mybatis를 호출한다.
							//root-context.xml 파일의 아래 부분에 sqlSession 아이디가 나온다.
							//sqlSession을 스프링프레임워크에서 생성해서 주입을 시킨거다. 
							//우리가 만들지 않고 스프링에서 객체관리를 직접 한 것이다.
	
	@Override
	public List<MemberDTO> getList() {
//		logger.info("member.list called...");
		//logger.info("Welcome home! The client locale is {}.", locale);
		
		//sql mapper에 작성된 sql 코드가 실행됨(auto commit & close)
		return sqlSession.selectList("member.getList"); //mapper에 있는 파일을불러오는 것.
													 //member - 네임스페이스, list - 태그의 아이디이다.
		/*
			List<MemebrDTO> list = sqlSession.selectList("member.list");
			return list;
	    */
		
		
		//프로젝트명/src/main/resources/mappers 에 있는 파일을 불러오는 것이다. member.list에서 
		//member : namespace
		//list : 태그의 id
		
		//프로젝트명/src/main/resources/mappers 에 있는 파일을 불러오는 것이다..  sqlSession의 목록을 가져오는 파일이다. 
		//프로젝트명/src/main/resources/mappers 에 파일을 만들도록 하겠다. member.xml 파일을 만든다.
		//내용은 아래와 같은데.. mybatis 매퍼파일이고, mybatis 매퍼의 양식이다.
		/*
			<?xml version="1.0" encoding="UTF-8"?>
			<!DOCTYPE mapper
			PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
			"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
			<mapper namespace="member">
			
			</mapper>
		*/
	}

	@Override
	public MemberDTO getView(String id) {
		return sqlSession.selectOne("member.getView", id);
	}
	
	@Override
	public void setInsert(MemberDTO dto) {
		sqlSession.insert("member.setInsert", dto); //mybatis의 sqlSession을 가지고 추가한다..
		//namespace가 member, id가 insert인 태그에다가 dto 내용을 전달한다.
	}

	@Override
	public void setUpdate(MemberDTO dto) {
		sqlSession.update("member.setUpdate", dto);
	}

	@Override
	public void setDelete(String id) {
		sqlSession.delete("member.setDelete", id);
	}

	@Override
	public int checkPasswd(String id, String passwd) {
		int result = 0;
		//mybatis mapper에 전달할 값이 2개 이상인 경우
		//dto 또는 map 으로 전달
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("passwd", passwd);
		result = sqlSession.selectOne("member.checkPasswd", map); //map 대신에 userid, passwd 이렇게 전달은 못한다. 즉, selectOne 함수는 전달하는 변수를 1개밖에 못쓴다. 그래서 map으로 묶어서 전달한다.
		return result;
	}

	@Override
	public String loginCheck(MemberDTO dto) {
		return sqlSession.selectOne("member.login_check", dto);
	}

	@Override
	public void logout(HttpSession session) {
		//세션을 모두 초기화 시킴
		session.invalidate();
	}

}
