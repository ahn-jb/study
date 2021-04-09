package member.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.dao.MemberDAO;
import member.model.dto.MemberDTO;


@Controller
public class memberController {
	@Inject
	MemberDAO memberDao;
	
	
	@RequestMapping("/memberChuga.do") //url mapping
	public String memberChuga() {
		
		return "member/chuga";
	}
	
	@RequestMapping("/memberChugaProc.do")
	public String memberChugaProc(
			@ModelAttribute MemberDTO dto,
			Model model
			) {
		memberDao.setInsert(dto);
		return "redirect:memberList.do";
	}
	
	@RequestMapping("/memberList.do") //url mapping
	public String memberList(Model model) {
		List<MemberDTO> list = memberDao.list();
		model.addAttribute("list",list);
		return "member/list";
	}
	
	@RequestMapping("/memberView.do") //url mapping
	public String memberView(Model model,
		@RequestParam(value="id", defaultValue="") String id
			) {
		MemberDTO dto = memberDao.view(id);
		model.addAttribute("dto", dto);
		return "member/view";
	}
	@RequestMapping("/memberSujeong.do") //url mapping
	public String memberSujeong(Model model,
			@RequestParam(value="id", defaultValue="") String id
			) {
		MemberDTO dto = memberDao.view(id);
		model.addAttribute("dto", dto);
		return "member/sujeong";
	}
	@RequestMapping("/memberSujeongProc.do") //url mapping
	public String memberSujeongProc(
			@ModelAttribute MemberDTO dto,
			Model model
			) {
		memberDao.setUpdate(dto);

		return "redirect:memberList.do";
	}
	@RequestMapping("/memberSakje.do") //url mapping
	public String membersakje(Model model,@RequestParam(value="id", defaultValue="") String id) {
		memberDao.setDelete(id);
		return "redirect:memberList.do";
	}
	
	
}
