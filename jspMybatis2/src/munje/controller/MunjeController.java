package munje.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Util;
import munje.model.dao.MunjeDAO;
import munje.model.dto.MunjeDTO;
import survey.model.dto.SurveyDTO;

/**
 * Servlet implementation class MunjeController
 */
@WebServlet("/munje_servlet/*")
public class MunjeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doProc(request, response);
	}
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Util util = new Util(); 
		MunjeDAO dao = new MunjeDAO();
		MunjeDTO dto = new MunjeDTO();
		
		int[] nalja = util.getDateTime();
		Map<String, Integer> naljaMap = new HashMap<String, Integer>();
		naljaMap.put("now_y", nalja[0]);
		naljaMap.put("now_m", nalja[1]);
		naljaMap.put("now_d", nalja[2]);
		
		String serverInfo[] = util.getServerInfo(request); //request.gfetContextPath();
		String refer = serverInfo[0];
		String path = serverInfo[1];
		String url = serverInfo[2];
		String uri = serverInfo[3];
		String ip = serverInfo[4];
//		String ip6 = serverInfo[5];
		
		String temp;
		temp = request.getParameter("pageNumber");
		int pageNumber = util.numberCheck(temp,1);
		
		temp = request.getParameter("no");
		int no = util.numberCheck(temp,0);
		
		String search_option = request.getParameter("search_option");
		String search_data = request.getParameter("search_data");
		String[] searchArray = util.searchCheck(search_option, search_data);
		search_option = searchArray[0];
		search_data = searchArray[1];
		
		String[] sessionArray = util.sessionCheck(request);
		int cookNo = Integer.parseInt(sessionArray[0]);
		String cookId = sessionArray[1];
		String cookName = sessionArray[2];
		
		request.setAttribute("naljaMap",naljaMap );
		request.setAttribute("ip",ip );
		request.setAttribute("pageNumber",pageNumber );
		request.setAttribute("no",no );
		request.setAttribute("search_option", search_option);
		request.setAttribute("search_option", search_option );
			
		String page = "/main/main.jsp";
		if(url.indexOf("index.do") != -1) {
			request.setAttribute("menu_gubun", "munje_index");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sihum_chuga.do") != -1) {
			request.setAttribute("menu_gubun", "munje_chuga");
			page = "/munje/sihum_chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("munje_chuga.do") != -1) {
			request.setAttribute("menu_gubun", "munje_chuga");
			List<MunjeDTO> list = dao.getSihumName();
			request.setAttribute("list", list );
			
			page = "/munje/munje_chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sihum_chugaProc.do" ) != -1 || url.indexOf("sihum_sujeongProc.do" ) != -1) {
			String testName = request.getParameter("testName");
			String testType = request.getParameter("testType");
			
			String syear = request.getParameter("syear");
			String smonth = request.getParameter("smonth");
			String sday = request.getParameter("sday");
			
			String lyear = request.getParameter("lyear");  
			String lmonth = request.getParameter("lmonth");
			String lday = request.getParameter("lday");
			String status = request.getParameter("status");
			
			String start_date_ = syear + "-" + smonth+ "-" + sday;
			start_date_ = start_date_+ " 00:00:00.0";
			java.sql.Timestamp start_date = java.sql.Timestamp.valueOf(start_date_);
			
			String last_date_ = lyear + "-" + lmonth+ "-" + lday;
			last_date_ =last_date_+ " 23:59:59.9";
			java.sql.Timestamp last_date = java.sql.Timestamp.valueOf(last_date_);
			
			dto.setTestName(testName);
			dto.setTestType(testType);
			dto.setStart_date(start_date);
			dto.setLast_date(last_date);
			dto.setStatus(status);
			if(url.indexOf("sihum_chugaProc.do" ) != -1) {
				int result = dao.setInsert_sihum(dto);
				if(result>0) {
					out.println("<script>");
					out.println("alert('시험 추가완료.');");
					out.println("suntaek_proc('resetList','','')");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('오류.');");
					out.println(" suntaek_proc('sihum_chuga','','')");
					out.println("</script>");
				}
				
			}else if(url.indexOf("sihum_sujeongProc.do" ) != -1) {
				dto.setNo(no);
				int result = dao.sihum_update(dto);
				if(result>0) {
					out.println("<script>");
					out.println("alert('시험 수정완료.');");
					out.println("suntaek_proc('sihum_view','','"+no+"')");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('오류.');");
					out.println(" suntaek_proc('sihum_sujeong','','"+no+"')");
					out.println("</script>");
				}
			}
		}else if(url.indexOf("munje_chugaProc.do") != -1 || url.indexOf("munje_sujeongProc.do") != -1) {
			String testNo_ = request.getParameter("testNo");
			int testNo = Integer.parseInt(testNo_);
			String testNumber_ = request.getParameter("testNumber");
			int testNumber = Integer.parseInt(testNumber_);
			String question = request.getParameter("question");
			String ans1 = request.getParameter("ans1");
			String ans2 = request.getParameter("ans2");
			String ans3 = request.getParameter("ans3");
			String ans4 = request.getParameter("ans4");
			
			dto.setTestNo(testNo);
			dto.setTestNumber(testNumber);
			dto.setQuestion(question);
			dto.setAns1(ans1);
			dto.setAns2(ans2);
			dto.setAns3(ans3);
			dto.setAns4(ans4);
			if(url.indexOf("munje_chugaProc.do") != -1) {			
				int result = dao.setInsert_munje(dto);
				if(result>0) {
					out.println("<script>");
					out.println("alert('문제 추가완료.');");
					out.println("suntaek_proc('resetList','','')");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('오류.');");
					out.println(" suntaek_proc('munje_chuga','','')");
					out.println("</script>");
				}
			}else if(url.indexOf("munje_sujeongProc.do") != -1) {
				String testName = request.getParameter("testName");
				String testType = request.getParameter("testType");
				dto.setTestName(testName);
				dto.setTestType(testType);
				dto.setNo(no);
				int result = dao.munje_update(dto);
				if(result>0) {
					request.setAttribute("dto", dto);
					page = "/munje/munje_view.jsp";
					RequestDispatcher rd = request.getRequestDispatcher(page);
					rd.forward(request, response);
				}else {
					out.println("<script>");
					out.println("alert('오류.');");
					out.println(" suntaek_proc('munje_sujeong','','"+no+"')");
					out.println("</script>");
				}
			}
			
		}else if(url.indexOf("list.do") != -1) {
			int pageSize = 5;
			int blockSize= 10;
			int totalRecord = dao.getTotalRecord_sihum(search_option,search_data);
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
			List<MunjeDTO> list = dao.getList_sihum(startRecord,lastRecord,search_option,search_data);
			request.setAttribute("menu_gubun", "survey_list");
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
			
			page = "/munje/list.jsp";		
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sihum_view.do") != -1) {
			
			dto = dao.getView_sihum(no);
			request.setAttribute("dto", dto);
			
			List<MunjeDTO> list = dao.getView_Munje(no);
			request.setAttribute("list", list);
			
			page = "/munje/sihum_view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sihum_sujeong.do") != -1) {
			dto = dao.getView_sihum(no);
			request.setAttribute("dto", dto);
			page = "/munje/sihum_sujeong.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sihum_sakje.do") != -1) {
			
			int result = dao.sihum_delete(no);
			if(result >0) {
				result = dao.munje_delete(no);
				out.println("<script>");
				out.println("alert('시험 삭제완료.');");
				out.println("suntaek_proc('resetList','1','')");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('오류.');");
				out.println("suntaek_proc('sihum_view','','"+no+"')");
				out.println("</script>");
			}
		}else if(url.indexOf("munje_view.do") != -1) {
			String testName = request.getParameter("testName");
			String testType = request.getParameter("testType");
			String testNo_ = request.getParameter("testNo");
			int testNo = Integer.parseInt(testNo_);
			
			dto = dao.getView_munje(no);
			dto.setTestName(testName);
			dto.setTestType(testType);
			dto.setTestNo(testNo);
			request.setAttribute("dto", dto);
			
			page = "/munje/munje_view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("munje_sujeong.do") != -1) {
			String testName = request.getParameter("testName");
			String testType = request.getParameter("testType");
			String testNo_ = request.getParameter("testNo");
			int testNo = Integer.parseInt(testNo_);
			
			dto = dao.getView_munje(no);
			dto.setTestName(testName);
			dto.setTestType(testType);
			dto.setTestNo(testNo);
			request.setAttribute("dto", dto);
			
			page = "/munje/munje_sujeong.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("munje_sakje.do") != -1) {
			String testNo_ = request.getParameter("testNo");
			int testNo = Integer.parseInt(testNo_);
			
			int result = dao.munje_delete2(no);
			if(result >0) {
				out.println("<script>");
				out.println("alert('문제 삭제완료.');");
				out.println("suntaek_proc('sihum_view','1','"+testNo+"')");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('오류.');");
				out.println("suntaek_proc('munje_view','','"+no+"')");
				out.println("</script>");
			}
		}else if(url.indexOf("test_suntaek.do") != -1) {
			request.setAttribute("menu_gubun", "munje_test_suntaek");
			
			List<MunjeDTO> list = dao.getSihumName();
			request.setAttribute("list", list );
			
			page = "/munje/test_suntaek.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("test.do") != -1) {
			request.setAttribute("menu_gubun", "munje_test");
			
			int totalRecord = dao.getTotalRecord_munje(no);
			int number =totalRecord;
			dto = dao.getView_sihum(no);
			List<MunjeDTO> list = dao.getView_Munje(no);
			
			request.setAttribute("dto", dto);
			request.setAttribute("totalRecord", totalRecord);	
			request.setAttribute("number", number);	
			request.setAttribute("list", list);
			
			page = "/munje/test.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("answer_chuga.do") != -1) {
			request.setAttribute("menu_gubun", "munje_answer_chuga");
			
			List<MunjeDTO> list = dao.getSihumName();
			request.setAttribute("list", list );
			
			page = "/munje/answer_chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("jeongdab.do") != -1) {
			request.setAttribute("menu_gubun", "munje_test");
			
			int totalRecord = dao.getTotalRecord_munje(no);
			int number =totalRecord;
			dto = dao.getView_sihum(no);
			List<MunjeDTO> list = dao.getView_Munje(no);
			
			request.setAttribute("dto", dto);
			request.setAttribute("totalRecord", totalRecord);	
			request.setAttribute("number", number);	
			request.setAttribute("list", list);
			
			page = "/munje/jeongdab.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("jeongdabProc.do") != -1) {
			System.out.println("no:"+no);
			String testNo_ = request.getParameter("no");
			int testNo = Integer.parseInt(testNo_);
			String answer_total = request.getParameter("answer_total");
			
			int result = dao.setInsert_test_answer(testNo, answer_total);
			if(result>0) {
				out.println("<script>");
				out.println("alert('저장 완료.');");
				out.println("suntaek_proc('resetList','1','')");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('오류.');");
				out.println("suntaek_proc('jeongdab','','"+testNo+"')");
				out.println("</script>");
			}
			
		}
		
		
	}

}
