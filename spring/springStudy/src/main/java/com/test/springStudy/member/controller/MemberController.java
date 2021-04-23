package com.test.springStudy.member.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.test.springStudy.member.model.dao.MemberDAO;
import com.test.springStudy.member.model.dto.MemberDTO;
import com.test.springStudy.member.util.MemberUtil;


@Controller
@RequestMapping("member")
public class MemberController {
	
	
	@Inject
	MemberDAO memberDao;
	MemberUtil util = new MemberUtil();
	String temp="";
	
    public Map<String, Object> topInfo(
			HttpServletRequest request
			){
		String search_option = request.getParameter("search_option");
		String search_data = request.getParameter("search_data");
		String[] searchArray = util.searchCheck(search_option, search_data);
		search_option = searchArray[0];
		search_data = searchArray[1];
		
		Map<String, Object> map = util.basicInfo(request);
		map.put("search_option", search_option);
		map.put("search_data", search_data);
		return map;
	}
	
	@RequestMapping("/index.do")
	public String index(HttpServletRequest request, Model model){
		Map<String, Object> map = topInfo(request);
		String ip = (String) map.get("ip");
		
		String arg01 = request.getParameter("arg01");
		arg01 = util.nullCheck(arg01);
		
		model.addAttribute("menu_gubun","member_index");
		model.addAttribute("ip",map.get("ip"));
		model.addAttribute("arg01","arg01");
		return "main/main";
	}
	
	@RequestMapping("/list.do")
	public String list(
		HttpServletRequest request, Model model
			) {
//		Map<String, Object> map = util.basicInfo(request);
		Map<String, Object> map = topInfo(request);
		int pageNumber = (int)map.get("pageNumber");
		int no = (int)map.get("no");
		String search_option = (String) map.get("search_option");
		String search_data = (String) map.get("search_data");
		
		int pageSize = 10;
		int blockSize = 10;
		int totalRecord = memberDao.getTotalRecord(search_option, search_data);
		int[] pagerArray = util.pager(pageSize, blockSize, totalRecord, pageNumber);
		int jj = pagerArray[0];
		int startRecord = pagerArray[1];
		int lastRecord = pagerArray[2];
		int totalPage = pagerArray[3];
		int startPage = pagerArray[4];
		int lastPage = pagerArray[5];
		
		List<MemberDTO> list = memberDao.getSelectMember(startRecord, lastRecord, search_option, search_data);
		
		model.addAttribute("menu_gubun", "member_list");
		model.addAttribute("list", list);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("jj", jj);
		model.addAttribute("startRecord", startRecord);
		model.addAttribute("lastRecord", lastRecord);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		
		return "member/list";
	}
	
	@RequestMapping("/view.do")
	public String view(
			HttpServletRequest request, Model model
			) {
		Map<String, Object> map = topInfo(request);
		int no = (int) map.get("no");

		
		MemberDTO dto = memberDao.getSelectOneNo(no);
		model.addAttribute("dto",dto);
		
		return "member/view";
	}
	
	@RequestMapping("/chuga.do")
	public String chuga(
			HttpServletRequest request, Model model
				) {
		Map<String, Object> map = topInfo(request);
		
		String ip = (String) map.get("ip");
		String arg01 = request.getParameter("arg01");
		arg01 = util.nullCheck(arg01);
		
		model.addAttribute("menu_gubun","member_chuga");
		model.addAttribute("ip",map.get("ip"));
		model.addAttribute("arg01","arg01");
		
		return "member/chuga";
	}
	
	@RequestMapping("/chuga2.do")
	public String chuga2(
		HttpServletRequest request, Model model
			) {
		Map<String, Object> map = topInfo(request);
		String ip = (String) map.get("ip");
		
		String arg01 = request.getParameter("arg01");
		arg01 = util.nullCheck(arg01);
		
		model.addAttribute("menu_gubun","member_chuga2");
		model.addAttribute("ip",map.get("ip"));
		model.addAttribute("arg01","arg01");
		
		return "main/main";
	}
	
	@RequestMapping("/chugaProc.do")
	public String chugaProc(
			Model model,
			@ModelAttribute MemberDTO dto,
			@RequestParam(value="id", defaultValue="") String id
			) {
		System.out.println(dto.toString());
		int result=0;
		result = memberDao.setInsert(dto);
		
		if(result>0) {
			temp = "member/list";
		}else {
			temp = "member/chuga";
		}
		return temp;
	}
	
	@RequestMapping("/id_check.do")
	public void id_check(
			Model model,
			@RequestParam(value="id", defaultValue="") String id,
			HttpServletResponse response
			)  {
		String result = memberDao.getSelectIdChk(id);
		if(result == null || result.equals("")) {
			result = id;
		}else {
			result ="";
		}
		
		try {
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/login2.do")
	public String login2(
		HttpServletRequest request, Model model
			) {
		Map<String, Object> map = topInfo(request);
		String ip = (String) map.get("ip");
		
		String arg01 = request.getParameter("arg01");
		arg01 = util.nullCheck(arg01);
		
		model.addAttribute("menu_gubun","member_login2");
		model.addAttribute("ip",map.get("ip"));
		model.addAttribute("arg01","arg01");
		
		return "main/main";
	}
	
	@RequestMapping("/login.do")
	public String login(
			HttpServletRequest request, Model model
			) {
		Map<String, Object> map = topInfo(request);
		String ip = (String) map.get("ip");
		
		String arg01 = request.getParameter("arg01");
		arg01 = util.nullCheck(arg01);
		
		model.addAttribute("menu_gubun","member_login");
		model.addAttribute("ip",map.get("ip"));
		model.addAttribute("arg01","arg01");
		
		return "member/login";
	}
	

	@RequestMapping("/loginProc.do")
	public void loginProc(
			HttpServletRequest request, Model model, HttpServletResponse response,
			@RequestParam(value="id", defaultValue="") String id,
			@RequestParam(value="pw", defaultValue="") String pw
			) throws IOException {
		Map<String, Object> map = topInfo(request);
		String path = (String) map.get("path");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String newId = id.replace(" ","");
		String newPw = pw.replace(" ","");
		if(!id.equals(newId)) {
			out.println("<script>");
			out.println("alert('아이디 빈칸 오류');");
			out.println(" sunteak_proc('login','1',''); ");
			out.println("</script>");
			return;
		}else if(!pw.equals(newPw)) {
			out.println("<script>");
			out.println("alert('비밀번호 빈칸 오류');");
			out.println(" sunteak_proc('login','1',''); ");
			out.println("</script>");
			return;	
		}
		
		MemberDTO dto =new MemberDTO(); //DTO set
		dto.setId(id);
		dto.setPw(pw);
		MemberDTO resultDTO = memberDao.Login(dto);
		
		response.setContentType("text/html; charset=utf-8");
		if(resultDTO != null ){ 
			HttpSession session = request.getSession(); //세션등록
			session.setAttribute("cookNo", resultDTO.getNo());
			session.setAttribute("cookId", resultDTO.getId());
			session.setAttribute("cookName", resultDTO.getName());
			
			memberDao.loginCounterSucsess(resultDTO);
			
			out.println("<script>");
			out.println("location.href='"+path+"';");
			out.println("</script>");
			return;	
		}else {
			memberDao.loginCounterfail(dto);
			out.println("<script>");
			out.println("alert('비밀번호 다름.');");
			out.println("location.href='"+path+"/member/login2.do';");
			out.println("<script>");
			return;	
		}
	}
		@RequestMapping("/logout.do")
		public void logout(
			HttpServletResponse response, HttpServletRequest request
				) throws IOException {
			Map<String, Object> map = topInfo(request);
			String path = (String) map.get("path");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			HttpSession session = request.getSession();
			session.invalidate(); //세션제거
			out.println("<script>");
			out.println("alert('로그아웃 되었습니다.\\n즐거운 하루 되세요.');");
			out.println("location.href='"+path+"';");
			out.println("</script>");
		}
		
	
}
