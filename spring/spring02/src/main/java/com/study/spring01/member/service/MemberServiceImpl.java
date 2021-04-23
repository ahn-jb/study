package com.study.spring01.member.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.study.spring01.member.model.dao.MemberDAO;
import com.study.spring01.member.model.dto.MemberDTO;

@Service //서버가 올라올 때 자동으로 서비스를 메모리로 올려준다.
public class MemberServiceImpl implements MemberService {

	@Inject	//스프링 컨테이너가 만든 dao 객체가 연결됨(의존관계 주입)
	MemberDAO memberDao; 
	
	@Override
	public List<MemberDTO> getList() {
		return memberDao.getList();
	}

	@Override
	public MemberDTO getView(String id) {
		return memberDao.getView(id);
	}

	@Override
	public void setInsert(MemberDTO dto) {
		memberDao.setInsert(dto);
	}

	@Override
	public void setUpdate(MemberDTO dto) {
		memberDao.setUpdate(dto);
	}

	@Override
	public void setDelete(String id) {
		memberDao.setDelete(id);
	}

	@Override
	public int checkPasswd(String id, String passwd) {
		return memberDao.checkPasswd(id, passwd);
	}

	@Override
	public String loginCheck(MemberDTO dto, HttpSession session) {
		//맞으면 이름이 나오고 틀리면 null이 넘어옴
		String name = memberDao.loginCheck(dto);

		if (name != null) { //맞으면
			//세션변수 등록
			session.setAttribute("id", dto.getId());
			session.setAttribute("name", name);
		}
		return name;
	}

	@Override
	public void logout(HttpSession session) {
		//세션을 모두 초기화 시킴
		session.invalidate();
	}

}
