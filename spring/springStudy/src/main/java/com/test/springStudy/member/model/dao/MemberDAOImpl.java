package com.test.springStudy.member.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.springStudy.member.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;

		
		String table_1 ="member";
		@Override
		public int setInsert(MemberDTO dto) {//회원 정보 입력
			Map<String,Object> map = new HashMap<>();
			map.put("dto", dto);
			int result=0;
			result = sqlSession.insert("member.setInsert",map);
			return result;
		}
		

		@Override
		public MemberDTO getSelectOneNo(int no) {//no으로 찾는  회원 정보
			

			return sqlSession.selectOne("member.getSelectOneNo",no);
		}
		
		@Override
		public int getSelectId(String id) {

			int result=0;
			result = sqlSession.selectOne("member.getSelectOneNo",id);
			return result;
		}

		@Override
		public MemberDTO Login(MemberDTO dto) {//로그인 		
			Map<String,Object> map = new HashMap<>();
			map.put("dto", dto);
			
			MemberDTO dto2 = sqlSession.selectOne("member.Login", map);
			return dto2;
		}
		
		@Override
		public void loginCounterfail(MemberDTO dto) {//로그인 실패 카운트
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("dto", dto);

			
			sqlSession.insert("member.loginCounterfail",map);
		}
		
		@Override
		public void loginCounterSucsess(MemberDTO dto) {//로그인 성공시 카운트 리셋
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("dto", dto);

			sqlSession.insert("member.loginCounterSucsess",map);
		}
		
		@Override
		public int update(MemberDTO dto) {//회원정보 수정
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("dto", dto);
			int result = 0;
			result = sqlSession.insert("member.update",map);
		
			return result;
		}
		
		@Override
		public int delete(int no) {//회원정보 삭제
			int result = 0;
			result = sqlSession.insert("member.delete",no);
			return result;
		}
		
		@Override
		public int getTotalRecord(String search_option,String search_data) {
			Map<String,String> map = new HashMap<>();
			map.put("search_option", search_option);
			map.put("search_data", search_data);
			map.put("table_1", table_1);
			int result= 0;
			result = sqlSession.selectOne("member.getTotalRecord",map);
			return result;
		}
		
		@Override
		public List<MemberDTO> getSelectMember(int startRecord,int lastRecord,String search_option,String search_data){//가입된 모든 회원정보 
			Map<String,String> map = new HashMap<>();
			map.put("startRecord", startRecord+"");
			map.put("lastRecord", lastRecord+"");
			map.put("search_option",search_option );
			map.put("search_data", search_data);
			map.put("table_1", table_1);
			
		
			return sqlSession.selectList("member.getSelectMember",map);
		}
		
		@Override
		public String getSelectIdChk(String id) {
			String result = sqlSession.selectOne("member.getSelectIdChk",id);
			
			return result;
		}
	
}
