package com.test.springStudy.member.model.dao;

import java.util.List;

import com.test.springStudy.member.model.dto.MemberDTO;

public interface MemberDAO {
	
	public int setInsert(MemberDTO dto);
	public MemberDTO getSelectOneNo(int no);
	public int getSelectId(String id);
	public MemberDTO Login(MemberDTO dto);
	public void loginCounterfail(MemberDTO dto);
	public void loginCounterSucsess(MemberDTO dto);
	public int update(MemberDTO dto);
	public int delete(int no);
	public int getTotalRecord(String search_option,String search_data);
	public List<MemberDTO> getSelectMember(int startRecord,int lastRecord,String search_option,String search_data);
	public String getSelectIdChk(String id);
}
