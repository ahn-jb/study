package com.test.springStudy.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.test.springStudy.board.model.dao.BoardDAO;
import com.test.springStudy.board.model.dto.BoardDTO;
import com.test.springStudy.board.util.BoardUtil;



@Controller
@RequestMapping("board")
public class BoardController {
	
	@Inject
	BoardDAO boardDao;
	BoardUtil util = new BoardUtil();
	String temp="";
	
	
	public Map<String, Object> topInfo(
			HttpServletRequest request
			){	
		String search_option = request.getParameter("search_option");
		String search_data = request.getParameter("search_data");
		String[] searchArray = util.searchCheck(search_option, search_data);
		search_option = searchArray[0];
		search_data = searchArray[1];
		
		temp = request.getParameter("tbl");
		int result_tbl = boardDao.tblchk(temp);
		if(result_tbl == 0) {
			temp ="";
		}		
		String tbl = util.tblCheck(temp,"freeboard");
		
		Map<String, Object> map = util.basicInfo(request);
		map.put("search_option", search_option);
		map.put("search_data", search_data);
		map.put("tbl", tbl);
		return map;
	}
	
	@RequestMapping("/index.do")
	public String index(HttpServletRequest request, Model model){
		Map<String, Object> map = topInfo(request);
		String ip = (String) map.get("ip");
		String tbl = (String) map.get("tbl");
		String arg01 = request.getParameter("arg01");
		arg01 = util.nullCheck(arg01);
		
		model.addAttribute("menu_gubun","board_index");
		model.addAttribute("ip",ip);
		model.addAttribute("arg01","arg01");
		model.addAttribute("tbl",tbl);
		
		return "main/main";
	}
	
	@RequestMapping("/list.do")
	public String list(
		HttpServletRequest request, Model model,
		@RequestParam(value="pageSize", defaultValue="") String pageSize_
			) {
//		Map<String, Object> map = util.basicInfo(request);
		Map<String, Object> map = topInfo(request);
		int pageNumber = (int)map.get("pageNumber");
		int no = (int)map.get("no");
		String search_option = (String) map.get("search_option");
		String search_data = (String) map.get("search_data");
		String tbl = (String) map.get("tbl");
		
		int pageSize = 10;
		if(pageSize_ != null && pageSize_ != "") {
			pageSize = Integer.parseInt(pageSize_);
		}
		int blockSize = 10;
		int totalRecord = boardDao.getCount(tbl,search_option, search_data);
		int[] pagerArray = util.pager(pageSize, blockSize, totalRecord, pageNumber);
		int jj = pagerArray[0];
		int startRecord = pagerArray[1];
		int lastRecord = pagerArray[2];
		int totalPage = pagerArray[3];
		int startPage = pagerArray[4];
		int lastPage = pagerArray[5];
		
		List<BoardDTO> list = boardDao.search(startRecord,lastRecord,tbl,search_data,search_option);
		
		model.addAttribute("menu_gubun", "board_list");
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
		
		return "board/list";
	}
	
	@RequestMapping(value = {"/write.do", "/reply.do"})
	public String write(
			HttpServletRequest request, Model model
				) {
		Map<String, Object> map = topInfo(request);
		
		String ip = (String) map.get("ip");
		String arg01 = request.getParameter("arg01");
		String tbl = (String) map.get("tbl");
		arg01 = util.nullCheck(arg01);
		
		model.addAttribute("menu_gubun","board_write");
		model.addAttribute("ip",map.get("ip"));
		model.addAttribute("arg01","arg01");
		model.addAttribute("tbl",tbl);
		
		return "board/write";
	}
	
	@RequestMapping(value = {"/writeProc.do"})
	public String writeProc(
			Model model,
			@ModelAttribute BoardDTO dto,
			HttpServletRequest request
			) {
		Map<String, Object> map = topInfo(request);
		
		String ip = (String) map.get("ip");
		int no = (int)map.get("no");
		String search_option = (String) map.get("search_option");
		String search_data = (String) map.get("search_data");
		String tbl = (String) map.get("tbl");
		
		int noticeNo;
	 	if(dto.getNoticeGubun() == null || dto.getNoticeGubun().trim().equals("")|| !dto.getNoticeGubun().contentEquals("T")) {
	 		noticeNo = 0;
	 	}else {
	 		noticeNo = boardDao.getMaxNoticeNo(tbl)+ 1;
	 	}
	 	String secretGubun = dto.getSecretGubun();
	 	if(secretGubun == null || secretGubun.trim().contentEquals("")|| !secretGubun.contentEquals("T")) {
	 		secretGubun = "F";
	 	}else {
	 		secretGubun ="T";
	 	}
		
		int num=boardDao.getMaxNum()+1;
		int refNo=boardDao.getMaxRefNo()+1;
		int stepNo = 1;
		int levelNo = 1;
		int p_no =0;
	 	int hit = 0;
	 	
	 	if(no>0) {
	 		BoardDTO dto2 = boardDao.getView(no,tbl,search_data,search_option);
	 		boardDao.setUpdateReLevel(dto2);
	 		refNo= dto2.getRefNo();
			stepNo =dto2.getStepNo()+1;
			levelNo =dto2.getLevelNo()+1;
			p_no =dto2.getNo();
			dto.setNo(no);
	 	}
	 	
		dto.setNum(num);
	 	dto.setRefNo(refNo);
	 	dto.setStepNo(stepNo);
	 	dto.setLevelNo(levelNo);
	 	dto.setHit(hit);
	 	dto.setIp(ip);
	 	dto.setP_no(p_no);
	 	dto.setNoticeNo(noticeNo);
	 	dto.setSecretGubun(secretGubun);
		int result=0;
		result = boardDao.setInsert(dto);
		
		if(result>0) {
			temp = "board/list";
		}else {
			temp = "board/write";
		}
		return temp;
	}
	
	@RequestMapping("/view.do")
	public String view(
			Model model,
			HttpServletRequest request
			) {
		Map<String, Object> map = topInfo(request);
		
		int no = (int)map.get("no");
		String ip = (String) map.get("ip");
		String arg01 = request.getParameter("arg01");
		String tbl = (String) map.get("tbl");
		arg01 = util.nullCheck(arg01);
		BoardDTO dto = boardDao.getSelectOne(no);
		
		String imsiPage = "viewPage";
		if(dto.getSecretGubun().equals("T")) {//비밀글이면
			String view_passwd = util.nullCheck(request.getParameter("view_passwd"));
			if(dto.getPasswd().equals(view_passwd) && !dto.getPasswd().equals("")) {
				
			}else {
				imsiPage = "viewPasswdPage";
			}
		}
		
		model.addAttribute("imsiPage",imsiPage );
		model.addAttribute("menu_gubun","board_view");
		model.addAttribute("ip",map.get("ip"));
		model.addAttribute("arg01","arg01");
		model.addAttribute("tbl",tbl);
		model.addAttribute("dto",dto);
		
		return "board/view";
	}
	
	@RequestMapping(value = {"/sujeong.do", "/sakje.do"})
	public String sujeong(
			Model model,
			HttpServletRequest request
			) {
		Map<String, Object> map = topInfo(request);
		
		int no = (int)map.get("no");
		String ip = (String) map.get("ip");
		String arg01 = request.getParameter("arg01");
		String tbl = (String) map.get("tbl");
		arg01 = util.nullCheck(arg01);
		BoardDTO dto = boardDao.getSelectOne(no);
		
		model.addAttribute("ip",map.get("ip"));
		model.addAttribute("arg01","arg01");
		model.addAttribute("tbl",tbl);
		model.addAttribute("dto",dto);
		String temp = "";
		if(request.getServletPath().equals("/board/sujeong.do")) {
			model.addAttribute("menu_gubun","board_sujeong");
			temp = "board/sujeong";
		}else if(request.getServletPath().equals("/board/sakje.do")){
			model.addAttribute("menu_gubun","board_sakje");
			temp = "board/sakje";
		}
		return temp;
	}
	@RequestMapping("/sujeongProc.do")
	public void sujeongProc(
			Model model,
			@ModelAttribute BoardDTO dto,
			HttpServletRequest request,
			HttpServletResponse response
			) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Map<String, Object> map = topInfo(request);
		int no = (int)map.get("no");
		String tbl = (String) map.get("tbl");
		
		int noticeNo;
	 	if(dto.getNoticeGubun() == null || dto.getNoticeGubun().trim().equals("")|| !dto.getNoticeGubun().contentEquals("T")) {
	 		noticeNo = 0;
	 	}else {
	 		noticeNo = boardDao.getMaxNoticeNo(tbl)+ 1;
	 	}
	 	String secretGubun = dto.getSecretGubun();
	 	if(secretGubun == null || secretGubun.trim().contentEquals("")|| !secretGubun.contentEquals("T")) {
	 		secretGubun = "F";
	 	}else {
	 		secretGubun ="T";
	 	}
	 	
	 	dto.setNo(no);
	 	dto.setNoticeNo(noticeNo);
	 	dto.setSecretGubun(secretGubun);
	 	
	 	BoardDTO dto2 = new BoardDTO();
	 	dto2 = boardDao.getSelectOne(no);
	 	String dbPasswd = dto2.getPasswd();
	 	
		if(dto.getPasswd().equals(dbPasswd)) {
	 		int result = boardDao.setUpdate(dto);
	 		if(result >0) {
	 			out.println("<script>alert('정상적으로 수정되었습니다.'); GoPage('view','"+no+"');</script>");
	 		}else {
	 			out.println("<script>alert('오류 발생.');GoPage('view','"+no+"');</script>");
	 		}
	 	}else {
	 		out.println("<script>alert('비밀번호가 다릅니다.');GoPage('view','"+no+"');</script>");
	 	}
	}
	
	@RequestMapping("/sakjeProc.do")
	public void sakjeProc(
			Model model,
			@ModelAttribute BoardDTO dto,
			HttpServletRequest request,
			HttpServletResponse response
			) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Map<String, Object> map = topInfo(request);
		int no = (int)map.get("no");
		
		BoardDTO dto2 = new BoardDTO();
	 	dto2 = boardDao.getSelectOne(no);
	 	String dbPasswd = dto2.getPasswd();
	 	
		if(dto.getPasswd().equals(dbPasswd)) {
			int result = boardDao.Delete(no);
	 		if(result >0) {
	 			out.println("<script>alert('정상적으로 수정되었습니다.'); GoPage('view','"+no+"');</script>");
	 		}else {
	 			out.println("<script>alert('오류 발생.');GoPage('view','"+no+"');</script>");
	 		}
	 	}else {
	 		out.println("<script>alert('비밀번호가 다릅니다.');GoPage('view','"+no+"');</script>");
	 	}
	}
	
	@RequestMapping("/comment_up")
	public void comment_up(
			Model model,
			@ModelAttribute BoardDTO dto,
			HttpServletRequest request,
			HttpServletResponse response
			) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Map<String, Object> map = topInfo(request);
		int no = (int)map.get("no");
		String ip = (String) map.get("ip");
		int cookNo = (int) map.get("cookNo");
		
		dto.setBoard_no(no);
		dto.setMemberNo(cookNo);
		dto.setIp(ip);
		int result = boardDao.CommentInsert(dto);
		if(result >0) {
			out.print("<script> suntaek_proc2('comment_result','1',''); </script>");

		}
	}
	
	@RequestMapping("/comment_result.do")
	public String comment_result(
			Model model,
			@ModelAttribute BoardDTO dto,
			HttpServletRequest request,
			HttpServletResponse response
			) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Map<String, Object> map = topInfo(request);
		int pageNumber = (int)map.get("pageNumber");
		int no = (int)map.get("no");
		
		int pageSize = 5;
		int blockSize= 10;
		int totalRecord = boardDao.getTotalRecord(no);
		int number =totalRecord - pageSize * (pageNumber-1);
		int startRecord = pageSize * (pageNumber -1) +1;
		int lastRecord = pageSize * pageNumber;
		int totalPage =0;
		int startPage =1;
		int lastPage = 1;
		if(totalRecord>0) {
			totalPage = totalRecord / pageSize +(totalRecord%pageSize == 0? 0:1);
			startPage = (pageNumber/blockSize - (pageNumber % blockSize !=0 ? 0:1))*blockSize +1 ;
			lastPage = startPage + blockSize - 1;
			if(lastPage > totalPage) {	
				lastPage = totalPage;
			}
		}
		
		List<BoardDTO> list = boardDao.getComment(no, startRecord, lastRecord);
		int list_size = list.size();
		model.addAttribute("list_size", list_size);
		model.addAttribute("list",list);
		model.addAttribute("count",totalRecord);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("blockSize",blockSize);
		model.addAttribute("totalRecord",totalRecord);
		model.addAttribute("number",number);
		model.addAttribute("startRecord",startRecord);
		model.addAttribute("lastRecord",lastRecord);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("lastPage",lastPage);
		
		return "board/comment_list";
	}
	
	@RequestMapping("/commentSujeong.do")
	public void commentSujeong(
			Model model,
			@ModelAttribute BoardDTO dto,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="comment_passwd", defaultValue="") String pwchk
			) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		int comment_no = dto.getComment_no();
		
		BoardDTO dto2 = new BoardDTO();
	 	dto2 = boardDao.comment_selectOne(comment_no);
	 	
	 	
	 	int result = 0;
		if(pwchk.equals(dto2.getComment_passwd())) {
			result = boardDao.comment_update(dto);
			out.print("<script> suntaek_proc2('comment_result','1',''); </script>");
		}else {
			out.print("<script>alert('비밀번호 다름.'); suntaek_proc2('comment_result','','');</script>");
		}
	}

	@RequestMapping("/commentSakje.do")
	public void commentSakje(
			Model model,
			@ModelAttribute BoardDTO dto,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="pwchk", defaultValue="") String pwchk
			) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int comment_no = dto.getComment_no();
		
		BoardDTO dto2 = new BoardDTO();
		dto2 = boardDao.comment_selectOne(comment_no);
		
		int result = 0;
		if(pwchk.trim().equals(dto2.getComment_passwd().trim())) {
			result = boardDao.comment_sakje(comment_no);
			out.print("<script> suntaek_proc2('comment_result','1',''); </script>");
		}else {
			out.println("<script>alert('비밀번호 다름.'); suntaek_proc2('comment_result','','');</script>");
		}
	}
}
