package chart.controller;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import chart.service.ChartService;
import common.UtilBoard;



@WebServlet("/chart_servlet/*")
public class ChartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
//		String path = request.getContextPath();
//		String url = request.getRequestURL().toString();
		
		UtilBoard util = new UtilBoard();
		
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
		request.setAttribute("search_option",search_option);
		request.setAttribute("search_data",search_data);
		
		String page = "/main/main.jsp";
		
		if(url.indexOf("index.do") != -1) {
			request.setAttribute("menu_gubun", "chart_index");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("googleChartJson.do") != -1) {
			request.setAttribute("menu_gubun", "chart_googleChartJson");
			page="/chart/googleChartJson.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("createJson.do") != -1) {
			request.setAttribute("menu_gubun", "chart_createJson");

	        ChartService service = new ChartService();
	        JSONObject json = service.getChartData();
	        request.setAttribute("data", json);

	        String img_path01 = request.getSession().getServletContext().getRealPath("/attach/json/");
//	        System.out.println(img_path01);
	        java.io.File isDir = new java.io.File(img_path01);
	        if(!isDir.isDirectory()){
	            isDir.mkdir();
	        }
	        String img_path02 = img_path01.replace("\\", "/");
	        String img_path03 = img_path01.replace("\\", "\\\\");

	        util.fileDelete(request, img_path03);


	        String newFileName = util.getDateTimeType() + "_" + util.create_uuid() + ".json";
	        File file = new File(img_path03 + newFileName);
	        file.createNewFile();
	        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
	        bufferedWriter.write(json.toString());
	        bufferedWriter.close();

	        request.setAttribute("menu_gubun", "chart_myChart");
	        request.setAttribute("chart_subject", "챠트 제목입니다."); 
	        request.setAttribute("chart_type", "PieChart");
	        request.setAttribute("chart_jsonFileName", newFileName);

	        page = "/chart/myChart.jsp";
	        RequestDispatcher rd = request.getRequestDispatcher(page);
	        rd.forward(request, response);   
		}
		
		
	}

}
