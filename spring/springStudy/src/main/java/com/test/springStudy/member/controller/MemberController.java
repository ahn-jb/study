package com.test.springStudy.member.controller;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		int pageNumber = (int) map.get("pageNumber");
		int no = (int) map.get("no");
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
//		model.addAttribute("pageNumber", pageNumber);
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
	
	@RequestMapping("/chugaProc.do")
	public String chugaProc(
			Model model,
			@ModelAttribute MemberDTO dto,
			@RequestParam(value="id", defaultValue="") String id
			) {
		System.out.println("id:"+id);
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
}
