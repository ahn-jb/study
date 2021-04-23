package com.study.spring01.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.spring01.member.model.dao.MemberDAO;
import com.study.spring01.member.model.dto.MemberDTO;
import com.study.spring01.member.service.MemberService;

@Controller //현재 클래스가 스프링에서 관리하는 컨트롤러라고 등록을 하는 것이다.
//@RequestMapping("/member/*")  //공통적인 url mapping
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject //객체 관리를 우리가 직접 코딩해서 만들지 않고, 스프링에서 해주도록 한다는 의미..
	MemberDAO memberDao; //dao가 인터페이스이다.
	@Inject
	MemberService memberService;
	
	int imsi = 0; //0-dao, 1-service
	
	@RequestMapping("memberList.do")
	public String memberList(Model model) {
		
		List<MemberDTO> list;
		if (imsi == 0) {
			list = memberDao.getList();
			System.out.println("imsi : 111");
		} else {
			list = memberService.getList();
			System.out.println("imsi : 222");
		}

		model.addAttribute("list", list);
		return "member/list";
	}

	@RequestMapping("memberView.do")
	public String memberView(
			@RequestParam(value="id", defaultValue="") String id,
			Model model
			) {
		
		MemberDTO dto;
		if (imsi == 0) {
			dto = memberDao.getView(id);
		} else {
			dto = memberService.getView(id);
		}

		model.addAttribute("dto", dto); //회원정보를 모델에 저장
		return "member/view"; //views/member/view.jsp로 포워딩
	}
	
	@RequestMapping("memberChuga.do")
	public String memberChuga() {
		return "member/chuga";
	}
	
	@RequestMapping("memberChugaProc.do")
	public String memberChugaProc(@ModelAttribute MemberDTO dto) {
		
		if (imsi == 0) {
			memberDao.setInsert(dto);
		} else {
			memberService.setInsert(dto);
		}
		
		return "redirect:memberList.do";
	}
	
	@RequestMapping("memberUpdate.do")
	public String memberUpdate(@ModelAttribute MemberDTO dto, Model model) {
		//비밀번호체크
		int result = memberDao.checkPasswd(dto.getId(), dto.getPasswd());
		if (result == 1) {
			
			if (imsi == 0) {
				memberDao.setUpdate(dto);
			} else {
				memberService.setUpdate(dto);
			}
			
			return "redirect:memberList.do";
		} else {
			MemberDTO dto2 = memberDao.getView(dto.getId());
			model.addAttribute("dto", dto2);
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "member/view";
		}
	}
	
	@RequestMapping("memberDelete.do")
	public String memberDelete(
		@RequestParam String id, 
		@RequestParam String passwd, 
		Model model) {
		//비밀번호 체크
		int result = memberDao.checkPasswd(id, passwd);
		if (result == 1) {
			
			if (imsi == 0) {
				memberDao.setDelete(id);
			} else {
				memberService.setDelete(id);
			}
			
			return "redirect:memberList.do";
		} else {
			
			MemberDTO dto;
			if (imsi == 0) {
				dto = memberDao.getView(id);
			} else {
				dto = memberService.getView(id);
			}
			
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("dto",  dto);
			return "member/view";
		}
	}
	
	
	@RequestMapping("memberLogin") //   /member/login.do과 동일..
	public String memberLogin() {
		return "member/login";
	}
	
	@RequestMapping("memberLoginCheck")
	public ModelAndView memberLoginCheck(@ModelAttribute MemberDTO dto, HttpSession session) {
		//로그인 성공 => 이름이 넘오옴, 실패=>null이 넘어옴.
		String name = memberService.loginCheck(dto, session);
		logger.info("name:" + name);
		ModelAndView mav = new ModelAndView();
		if (name == null) { //로그인 실패
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		} else { //로그인성공
			mav.setViewName("index");
		}
		return mav;
	}
	
	@RequestMapping("memberLogout") //   /member/login.do과 동일..
	public ModelAndView memberLogout(HttpSession session, ModelAndView mav) {
		if (imsi == 0) {
			memberDao.logout(session);
		} else {
			memberService.logout(session); //세션 초기화 작업 ---> session.invalidate(); 이렇게 해도 된다.
		}
		mav.setViewName("member/login"); //이동할 페이지의 이름
		mav.addObject("message", "logout"); //변수 저장
		return mav; //페이지로 이동
	}
	
}
