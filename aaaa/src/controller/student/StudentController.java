package controller.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.UtilBoard;
import student.model.dao.StudentDAO;
import student.model.dto.StudentDTO;


@WebServlet("/student_servlet/*")
public class StudentController extends HttpServlet {
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
		HttpSession session = request.getSession();
		UtilBoard util = new UtilBoard();
		StudentDAO dao = new StudentDAO();
		StudentDTO dto = new StudentDTO();
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
			request.setAttribute("menu_gubun", "student_index");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("student.do") != -1) {
			request.setAttribute("menu_gubun", "student_student");
			int pageSize = 10;
			int blockSize= 10;
			int totalRecord = dao.getCount(search_option, search_data);
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

			ArrayList<StudentDTO> list =dao.search(startRecord,lastRecord,search_data,search_option);
			request.setAttribute("list",list);
			request.setAttribute("pageNumber",pageNumber);
			request.setAttribute("pageSize",pageSize);
			request.setAttribute("blockSize",blockSize);
			
			request.setAttribute("totalRecord",totalRecord);
			request.setAttribute("number",number);
			request.setAttribute("startRecord",startRecord);
			request.setAttribute("lastRecord",lastRecord);
			request.setAttribute("totalPage",totalPage);
			request.setAttribute("startPage",startPage);
			request.setAttribute("lastPage",lastPage);
			request.setAttribute("search_option",search_option);
			request.setAttribute("search_data",search_data);
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("studentChuga.do") != -1) {
			request.setAttribute("menu_gubun", "student_studentChuga");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("studentChugaProc.do") != -1) {
			request.setAttribute("menu_gubun", "student_studentChugaProc");
			
			String year_ = request.getParameter("year");
			System.out.println("1: "+request.getParameter("year"));
			int year = Integer.parseInt(year_);
			String Student_class = request.getParameter("Student_class");		
			String num = request.getParameter("num");
			String name = request.getParameter("name");
			String born = request.getParameter("born");
			String s_phone = request.getParameter("s_phone");
			String p_phone =  request.getParameter("p_phone");
			String adr = request.getParameter("adr");
			
			dto.setYear(year);
			dto.setS_class(Student_class);
			dto.setNum(num);
			dto.setName(name);
			dto.setBorn(born);
			dto.setS_phone(s_phone);
			dto.setP_phone(p_phone);
			dto.setAdr(adr);
			
			int result = dao.setInsert(dto);
			if(result >0) {
				temp = path+"/student_servlet/student.do";
			}else {
				temp=path+"/student_servlet/studentChuga.do";
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("test.do") != -1) {
			request.setAttribute("menu_gubun", "student_test");
			
			int pageSize = 10;
			int blockSize= 10;
			int totalRecord = dao.testCount();
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

			ArrayList<StudentDTO> list =dao.testSearch();
			request.setAttribute("list",list);
			request.setAttribute("pageNumber",pageNumber);
			request.setAttribute("pageSize",pageSize);
			request.setAttribute("blockSize",blockSize);
			
			request.setAttribute("totalRecord",totalRecord);
			request.setAttribute("number",number);
			request.setAttribute("startRecord",startRecord);
			request.setAttribute("lastRecord",lastRecord);
			request.setAttribute("totalPage",totalPage);
			request.setAttribute("startPage",startPage);
			request.setAttribute("lastPage",lastPage);
			request.setAttribute("search_option",search_option);
			request.setAttribute("search_data",search_data);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("testChuga.do") != -1) {
			request.setAttribute("menu_gubun", "student_testChuga");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("testChugaProc.do") != -1) {
			request.setAttribute("menu_gubun", "student_testChugaProc");
			
			String test_name = request.getParameter("test_name");
			dto.setTest_name(test_name);
			int result = dao.testInsert(dto);
			if(result >0) {
				temp = path+"/student_servlet/test.do";
			}else {
				temp=path+"/student_servlet/testChuga.do";
			}
			response.sendRedirect(temp);
		}else if(url.indexOf("SJ.do") != -1) {
			request.setAttribute("menu_gubun", "student_SJ");
			
			int pageSize = 10;
			int blockSize= 10;
			int totalRecord = dao.SJCount(search_option,search_data);
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

			ArrayList<StudentDTO> list =dao.SJSearch(startRecord,lastRecord,search_data,search_option);
			request.setAttribute("list",list);
			request.setAttribute("pageNumber",pageNumber);
			request.setAttribute("pageSize",pageSize);
			request.setAttribute("blockSize",blockSize);
			
			request.setAttribute("totalRecord",totalRecord);
			request.setAttribute("number",number);
			request.setAttribute("startRecord",startRecord);
			request.setAttribute("lastRecord",lastRecord);
			request.setAttribute("totalPage",totalPage);
			request.setAttribute("startPage",startPage);
			request.setAttribute("lastPage",lastPage);
			request.setAttribute("search_option",search_option);
			request.setAttribute("search_data",search_data);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("SJChuga.do") != -1) {
			request.setAttribute("menu_gubun", "student_SJChuga");
			
			ArrayList<StudentDTO> Student_list = dao.selectStudent();
			ArrayList<StudentDTO> test_list = dao.selectTest();
			
			request.setAttribute("Student_list", Student_list);
			request.setAttribute("test_list", test_list);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("SJChugaProc.do") != -1) {
			request.setAttribute("menu_gubun", "student_SJChugaProc");
			
			String student_no_ = request.getParameter("student_no");
			int student_no = Integer.parseInt(student_no_);
			String test_no_ = request.getParameter("test_no");
			int test_no = Integer.parseInt(test_no_);
			String kor_ = request.getParameter("kor");
			int kor = Integer.parseInt(kor_);
			String eng_ = request.getParameter("eng");
			int eng = Integer.parseInt(eng_);
			String mat_ = request.getParameter("mat");
			int mat = Integer.parseInt(mat_);
			String sci_ = request.getParameter("sci");
			int sci = Integer.parseInt(sci_);
			String his_ = request.getParameter("his");
			int his = Integer.parseInt(his_);
			
			dto.setNo(student_no);
			dto.setTest_no(test_no);
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMat(mat);
			dto.setSci(sci);
			dto.setHis(his);
			
			int result = dao.SJInsert(dto);
			if(result > 0) {
				temp = path+"/student_servlet/SJ.do";
			}else {
				temp = path+"/student_servlet/SJChuga.do";
			}
			response.sendRedirect(temp);
		}
	}

}
