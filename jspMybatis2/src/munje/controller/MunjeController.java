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
			List<MunjeDTO> list = dao.getList();
			request.setAttribute("list", list );
			
			page = "/munje/munje_chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sihum_chugaProc.do") != -1) {
			String testName = request.getParameter("testName");
			
			String syear = request.getParameter("syear");
			String smonth = request.getParameter("smonth");
			String sday = request.getParameter("sday");
			
			String lyear = request.getParameter("lyear");  
			String lmonth = request.getParameter("lmonth");
			String lday = request.getParameter("lday");
			
			String start_date_ = syear + "-" + smonth+ "-" + sday;
			start_date_ = start_date_+ " 00:00:00.0";
			java.sql.Timestamp start_date = java.sql.Timestamp.valueOf(start_date_);
			
			String last_date_ = lyear + "-" + lmonth+ "-" + lday;
			last_date_ =last_date_+ " 23:59:59.9";
			java.sql.Timestamp last_date = java.sql.Timestamp.valueOf(last_date_);
			
			dto.setTestName(testName);
			dto.setStart_date(start_date);
			dto.setLast_date(last_date);
			
			int result = dao.setInsert_sihum(dto);
			if(result>0) {
				out.println("<script>");
				out.println("alert('추가 완료.');");
				out.println("suntaek_proc('munje_chuga','','')");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('오류.');");
				out.println(" suntaek_proc('sihum_chuga','','')");
				out.println("</script>");
			}
		}else if(url.indexOf("munje_chugaProc.do") != -1) {
			
		}
		
		
	}

}
