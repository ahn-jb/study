package com.study.spring01.member.model.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.study.spring01.member.model.dto.MemberDTO;

public interface MemberDAO {
	
	//인터페이스이므로 메소드를 선언만 하면 된다.
	public List<MemberDTO> getList(); //List는 ArrayList를 담기 위한 것이다.
	                               //import java.util.List;
	public MemberDTO getView(String id);
	public void setInsert(MemberDTO dto);
	public void setUpdate(MemberDTO dto);
	public void setDelete(String id);
	
	public int checkPasswd(String id, String passwd);
	
	public String loginCheck(MemberDTO dto);
	public void logout(HttpSession session);
}
