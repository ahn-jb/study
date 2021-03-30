package survey.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Util;
import survey.model.dao.SurveyDAO;
import survey.model.dto.SurveyAnswerDTO;
import survey.model.dto.SurveyDTO;



@WebServlet("/test_servlet/*")	
public class Survey2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	protected void doProc(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Util util = new Util();
		int[] nalja = util.getDateTime();
		Map<String, Integer> naljaMap = new HashMap<String, Integer>();
		naljaMap.put("now_y", nalja[0]);
		naljaMap.put("now_m", nalja[1]);
		naljaMap.put("now_d", nalja[2]);
		request.setAttribute("naljaMap", naljaMap);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String page = "/main/main.jsp";
		
		String temp="";
		temp = request.getParameter("pageNumber");
		int pageNumber =util.numberCheck(temp , 1);
		temp = request.getParameter("no");
		int no = util.no(temp, 0);
		
		temp = request.getParameter("list_gubun");
		String list_gubun = util.list_gubunCheck(temp);

		String search_option = request.getParameter("search_option");
		String search_data = request.getParameter("search_data");
		String search_date_s = request.getParameter("search_date_s");
		String search_date_e = request.getParameter("search_date_e");
		String search_date_check = request.getParameter("search_date_check");
		
//		System.out.println("1: "+search_date_check);
		String[] searchArray = util.searchCheck(search_option,search_data,search_date_s,search_date_e,search_date_check);
		search_option = searchArray[0];
		search_data = searchArray[1];
		search_date_s = searchArray[2];
		search_date_e = searchArray[3];
		search_date_check = searchArray[4];

//		System.out.println(search_option);
//		System.out.println(search_data);
//		System.out.println(search_date_s);
//		System.out.println(search_date_e);
//		System.out.println(search_date_check);
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("list_gubun", list_gubun);
		request.setAttribute("search_option", search_option);
		request.setAttribute("search_data", search_data);
		request.setAttribute("search_date_s", search_date_s);
		request.setAttribute("search_date_e", search_date_e);
		request.setAttribute("search_date_check", search_date_check);
		
		if(url.indexOf("index.do") != -1) {
			request.setAttribute("menu_gubun", "index");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("chuga.do") != -1) {
			request.setAttribute("menu_gubun", "test_chuga");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("chugaProc.do") != -1) {
			SurveyDAO dao = new SurveyDAO();
			String question = request.getParameter("question");
			String ans1 = request.getParameter("ans1");
			String ans2 = request.getParameter("ans2");
			String ans3 = request.getParameter("ans3");
			String ans4 = request.getParameter("ans4");
			String status = request.getParameter("status");
			
			String syear = request.getParameter("syear");
			String smonth = request.getParameter("smonth");
			String sday = request.getParameter("sday");
			
			String lyear = request.getParameter("lyear");  
			String lmonth = request.getParameter("lmonth");
			String lday = request.getParameter("lday");
			
			String start_date_ = syear + "-" + smonth+ "-" + sday;
			start_date_ = start_date_+ " 00:00:00.0";
//			System.out.println(start_date_);
			java.sql.Timestamp start_date = java.sql.Timestamp.valueOf(start_date_);
			
			String last_date_ = lyear + "-" + lmonth+ "-" + lday;
			last_date_ =last_date_+ " 23:59:59.9";
//			System.out.println(last_date_ );
			
			java.sql.Timestamp last_date = java.sql.Timestamp.valueOf(last_date_);
			SurveyDTO dto = new SurveyDTO();
			dto.setQuestion(question);
			dto.setAns1(ans1);
			dto.setAns2(ans2);
			dto.setAns3(ans3);
			dto.setAns4(ans4);
			dto.setStatus(status);
			dto.setStart_date(start_date);
			dto.setLast_date(last_date);
			
			int result = dao.setInsert(dto);
			temp = "";
			if(result >0){
		 		temp=path+"/test_servlet/list.do";
			}else {
				temp=path+"/test_servlet/chuga.do";
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("list.do") != -1 || url.indexOf("list_2.do") != -1) {
			SurveyDAO dao = new SurveyDAO();
			int pageSize = 5;
			int blockSize= 10;
			int totalRecord = dao.getTotalRecord(list_gubun, search_option,search_data,search_date_s,search_date_e,search_date_check);
			if(url.indexOf("list.do") != -1) {
				request.setAttribute("menu_gubun", "test_list");
			}else {
				pageSize = totalRecord;
				request.setAttribute("menu_gubun", "munje_list_2");
			}
			
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
			List<SurveyDTO> list = dao.getSelectSurvey(startRecord, lastRecord,
					list_gubun, search_option,search_data,search_date_s,search_date_e,search_date_check);
			request.setAttribute("list", list);
			request.setAttribute("pageNumber",pageNumber);
			request.setAttribute("blockSize",blockSize);
			request.setAttribute("totalRecord",totalRecord);
			request.setAttribute("number",number);
			request.setAttribute("startRecord",startRecord);
			request.setAttribute("lastRecord",lastRecord);
			request.setAttribute("totalPage",totalPage);
			request.setAttribute("startPage",startPage);
			request.setAttribute("lastPage",lastPage);
			request.setAttribute("pageSize",pageSize);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("modify.do") != -1) {
			SurveyDAO dao = new SurveyDAO();
			SurveyDTO dto = dao.getSelectOne(no);
			
			request.setAttribute("dto", dto);
			request.setAttribute("menu_gubun", "test_modify");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("modifyProc.do") != -1) {
			SurveyDAO dao = new SurveyDAO();
			String question = request.getParameter("question");
			String ans1 = request.getParameter("ans1");
			String ans2 = request.getParameter("ans2");
			String ans3 = request.getParameter("ans3");
			String ans4 = request.getParameter("ans4");
			String status = request.getParameter("status");

			SurveyDTO dto = new SurveyDTO();
			dto.setNo(no);
			dto.setQuestion(question);
			dto.setAns1(ans1);
			dto.setAns2(ans2);
			dto.setAns3(ans3);
			dto.setAns4(ans4);
			dto.setStatus(status);
			
			int result = dao.updateSurvey(dto);
			temp = "";
			if(result >0){
		 		temp=path+"/test_servlet/list.do";
			}else {
				temp=path+"/test_servlet/modify.do";
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("delete.do") != -1) {
			SurveyDAO dao = new SurveyDAO();
			int result = dao.deleteSurvey(no);
			temp = "";
			if(result >0){
				temp=path+"/test_servlet/list.do";
			}else {
				temp=path+"/test_servlet/list.do";
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("send.do") != -1) {
			SurveyDAO dao = new SurveyDAO();
			SurveyDTO dto = dao.getSelectOne(no);
			
			request.setAttribute("dto", dto);
			request.setAttribute("menu_gubun", "test_send");
			RequestDispatcher rd = request.getRequestDispatcher(page);	
			rd.forward(request, response);
		}else if(url.indexOf("sendProc.do") != -1) {
			SurveyDAO dao = new SurveyDAO();
			String answer_ = request.getParameter("answer");
			
			int answer = Integer.parseInt(answer_);
			SurveyAnswerDTO dto = new SurveyAnswerDTO();
			dto.setNo(no);
			dto.setAnswer(answer);
			int result = dao.setInsertAnswer(dto);
			
			temp = "";
			if(result >0){
				temp=path+"/test_servlet/list.do";
			}else {
				temp=path+"/test_servlet/list.do";
			}
			response.sendRedirect(temp);
			
		}else if(url.indexOf("saveProc.do") != -1) {
			SurveyDAO dao = new SurveyDAO();
			SurveyAnswerDTO dto = new SurveyAnswerDTO();
			String answer_total = request.getParameter("answer_total");
//			System.out.println(answer_total);
			String[] anwer_totalArr = answer_total.split("[|]");
			int result=0;
			for(int i=0; i<anwer_totalArr.length; i++) {
				String[] cases = anwer_totalArr[i].split(":");
				int tempNo = Integer.parseInt(cases[0]); 
				int tempAnswer = Integer.parseInt(cases[1]); 
				dto.setNo(tempNo);
				dto.setAnswer(tempAnswer);
				result = dao.setInsertAnswer(dto);
			}
			temp = "";
			if(result >0){
				temp=path+"/test_servlet/list.do";
			}else {
				temp=path+"/test_servlet/list.do";
			}
			response.sendRedirect(temp);
			
		}else if(url.indexOf("view.do") != -1) {
			SurveyDAO dao = new SurveyDAO();
			SurveyAnswerDTO dto_answer = new SurveyAnswerDTO();
			dto_answer = dao.getCountAnwer(no);
//			System.out.println("1: "+dto_answer.getAnswer_count1());
//			System.out.println("2: "+dto_answer.getAnswer_count2());
//			System.out.println("3: "+dto_answer.getAnswer_count3());
//			System.out.println("4: "+dto_answer.getAnswer_count4());
			int total = dao.getTotalCount(no);
			int ans1_c =  dto_answer.getAnswer_count1();
			int ans2_c =  dto_answer.getAnswer_count2();
			int ans3_c =  dto_answer.getAnswer_count3();
			int ans4_c =  dto_answer.getAnswer_count4();
			Double persent1 = Double.parseDouble(String.format("%.1f", ans1_c*100.0/total));
			Double persent2 = Double.parseDouble(String.format("%.1f", ans2_c*100.0/total));
			Double persent3 = Double.parseDouble(String.format("%.1f", ans3_c*100.0/total));
			Double persent4 = Double.parseDouble(String.format("%.1f", ans4_c*100.0/total));
			
			int[] ans = new int[5];
			ans[0] = total;
			ans[1] = ans1_c;
			ans[2] = ans2_c;
			ans[3] = ans3_c;
			ans[4] = ans4_c;
			Double[] persent = new Double[4];
			persent[0] = persent1;
			persent[1] = persent2;
			persent[2] = persent3;
			persent[3] = persent4;
			
			SurveyDTO dto = dao.getSelectOne(no);
			
			request.setAttribute("dto", dto);
			request.setAttribute("ans", ans);
			request.setAttribute("persent", persent);
			request.setAttribute("menu_gubun", "test_view");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}
}
