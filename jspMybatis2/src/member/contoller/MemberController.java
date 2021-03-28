package member.contoller;



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

import member.model.dao.MemberDAO;
import member.model.dto.MemberDTO;
import member.util.MemberUtil;


@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			MemberUtil util = new MemberUtil();
			MemberDAO dao = new MemberDAO();
			
//			String path = request.getContextPath();
//			String url = request.getRequestURL().toString();
			
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
//			String ip6 = serverInfo[5];
			
			String temp;
			temp = request.getParameter("pageNumber");
//			System.out.println(temp);
			int pageNumber = util.numberCheck(temp,1);

			temp = request.getParameter("no");
//			System.out.println(temp);
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
//			System.out.println(cookNo);
			
			request.setAttribute("naljaMap",naljaMap );
			request.setAttribute("ip",ip );
			request.setAttribute("pageNumber",pageNumber );
			request.setAttribute("no",no );
			request.setAttribute("search_option",search_option);
			request.setAttribute("search_data",search_data);	
			String page = "/main/main.jsp";
			
			if(url.indexOf("index.do") != -1) {
				request.setAttribute("menu_gubun", "member_index");
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else if(url.indexOf("chuga.do") != -1) {//가입 페이지
				request.setAttribute("menu_gubun", "member_chuga");
				
				page = "/member/chuga.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else if(url.indexOf("chuga2.do") != -1) {//가입 페이지
				request.setAttribute("menu_gubun", "member_chuga2");
				
//				page = "/member/chuga.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else if(url.indexOf("id_check.do") != -1) {
				
				String id = request.getParameter("id");
				
				String result =dao.getSelectIdChk(id);
//				System.out.println(result);
				if(result == null || result.equals("")) {
					result = id;
				}else {
//					System.out.println("중복");
					result ="";
				}
				out.println(result);
				out.flush();
				out.close();
			}else if(url.indexOf("id_check_win_open_proc.do") != -1) {
//				System.out.println("id: "+request.getParameter("id"));
				String id = request.getParameter("id");
				
				String result =dao.getSelectIdChk(id);
//				System.out.println(result);
				if(result == null || result.equals("")) {
					result = id;
				}else {
					result = "";
				}
//				request.setAttribute("id", id);
//				request.setAttribute("result", result);
//				RequestDispatcher rd = request.getRequestDispatcher("/member/id_check.jsp");
//				rd.forward(request, response);
//				System.out.println(result);
				out.println(result);
				out.flush();
				out.close();
				
			}else if(url.indexOf("id_check_win_open.do") != -1){
				
				page = "/member/id_check.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}else if(url.indexOf("chugaProc.do") != -1) {//회원가입  처리
				System.out.println("chugaProc");
				System.out.println("cookNo:"+cookNo);
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				id = replace(id);
				pw = replace(pw);
				String newId = id.replace(" ","");
				String newPw = pw.replace(" ", ""); 
				if(!id.equals(newId)) {
					out.println("<script>");
					out.println("alert('아이디 빈칸 오류');");
					out.println(" sunteak_proc('chuga','1',''); ");
//					out.println("location.href='"+path+"/member_servlet/chuga.do';");
					out.println("</script>");
				}else if(!pw.equals(newPw)) {
					out.println("<script>");
					out.println("alert('비밀번호 빈칸 오류');");
					out.println(" sunteak_proc('chuga','1',''); ");
//					out.println("location.href='"+path+"/member_servlet/chuga.do';");
					out.println("</script>");
					
				}else {
				String name = request.getParameter("name");
				String gender = request.getParameter("gender");
				String bornYear_ = request.getParameter("bornYear");
				String postNum = request.getParameter("postNum");
				String street_addr = request.getParameter("street_addr");
				String parcel_addr = request.getParameter("parcel_addr");
				String detail_addr = request.getParameter("detail_addr");
				String reference   = request.getParameter("reference");
				int bornYear = Integer.parseInt(bornYear_);
				MemberDTO dto =new MemberDTO(); //DTO set
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setGender(gender);
				dto.setBornYear(bornYear);
				dto.setPostNum(postNum);
				dto.setStreet_addr(street_addr);
				dto.setParcel_addr(parcel_addr);
				dto.setDetail_addr(detail_addr);
				dto.setReference(reference);
				
				int result =dao.getSelectId(id);
				if(result >0 || !id.equals(newId)) {
					id = "";
					result = 1;
				}
				if(result >0) {
					out.println("<script>");
					out.println("alert('잘못된 아이디.');");
					out.println(" sunteak_proc('chuga','1',''); ");
//					out.println("location.href='"+path+"/member_servlet/chuga.do';");
					out.println("</script>");
				}else {
					result = dao.setInsert(dto);
	//				String temp="";
					if(result >0){
						System.out.println("qwer");
						if(cookNo >0 ) {
							System.out.println("asdf");
							out.println("<script>");
							out.println("alert('등록완료');");
							out.println(" sunteak_proc('resetList','1',''); ");
							out.println("</script>");
						}else {
							System.out.println("zxcv");
							out.println("<script>");
							out.println("alert('등록완료');");
							out.println(" sunteak_proc('login','1',''); ");
							out.println("</script>");
						}
//						page = "/member/list.jsp";
					}else {
						out.println("<script>");
						out.println("alert('오류 발생.');");
						out.println(" sunteak_proc('chuga','1',''); ");
						out.println("</script>");

//						page = "/member/chuga.jsp";
					}
//					RequestDispatcher rd = request.getRequestDispatcher(page);
//					rd.forward(request, response);
					}
				}
			}else if(url.indexOf("login.do") != -1) {//로그인 페이지
				request.setAttribute("menu_gubun", "member_login");
				
				page = "/member/login.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else if(url.indexOf("login2.do") != -1) {//로그인 페이지
				request.setAttribute("menu_gubun", "member_login2");
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}else if(url.indexOf("loginProc.do") != -1) {//로그인	처리
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				id = replace(id);
				pw = replace(pw);
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
				MemberDTO resultDTO = dao.Login(dto);
				
				response.setContentType("text/html; charset=utf-8");
				if(resultDTO != null ){ 
					HttpSession session = request.getSession(); //세션등록
					session.setAttribute("cookNo", resultDTO.getNo());
					session.setAttribute("cookId", resultDTO.getId());
					session.setAttribute("cookName", resultDTO.getName());
					
					dao.loginCounterSucsess(resultDTO);
					temp=path;
					response.sendRedirect(temp);
				}else {
					dao.loginCounterfail(dto);
					out.println("<script>");
					out.println("alert('비밀번호 다름.');");
					out.println("location.href='"+path+"/member_servlet/login2.do';");
					out.println("</script>");
				}
				
				
			}else if(url.indexOf("logout.do") != -1) {//로그아웃 처리
				response.setContentType("text/html; charset=utf-8");
				HttpSession session = request.getSession();
				session.invalidate(); //세션제거
				out.println("<script>");
				out.println("alert('로그아웃 되었습니다.\\n즐거운 하루 되세요.');");
				out.println("location.href='"+path+"';");
				out.println("</script>");
				
			}else if(url.indexOf("list.do") != -1) {//회원 리스트
				int pageSize = 3;
				int blockSize= 10;
				int totalRecord = dao.getTotalRecord(search_option,search_data);
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
				List<MemberDTO> list = dao.getSelectMember(startRecord,lastRecord,search_option,search_data);//모든 회원정보 가져오기
				response.setContentType("text/html; charset=utf-8");
				if(cookNo == 0) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");

				}else if(cookNo != 0) {
					MemberDTO dto1 = dao.getSelectOneNo(cookNo);
					
					if(dto1.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");
						
					}else {
						request.setAttribute("menu_gubun", "member_list");
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
						page = "/member/list.jsp";
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
					}	
				}
			
			}else if(url.indexOf("view.do") != -1) {//상세보기
				
				response.setContentType("text/html; charset=utf-8");
				if(cookNo == 0) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");

				}else if(cookNo != 0) {
					MemberDTO dto1 = dao.getSelectOneNo(cookNo);
					MemberDTO dto = dao.getSelectOneNo(no);
					request.setAttribute("dto",dto);
					if(no == cookNo || dto1.getGrade() == 1) {
						request.setAttribute("menu_gubun", "member_view");
						page = "/member/view.jsp";
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
						
					}else if(dto1.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");						
					}
										
				}
				
			}else if(url.indexOf("modify.do") != -1) {//수정 페이지
//				MemberDTO dto = dao.getSelectOneNo(no);
//				request.setAttribute("dto",dto);
//				System.out.println(dto.getName());
//				System.out.println(dto.getGender());
				
				
				if(cookNo == 0) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");

				}else if(cookNo != 0) {
					MemberDTO dto = dao.getSelectOneNo(no);
					MemberDTO dto1 = dao.getSelectOneNo(cookNo);
					
					request.setAttribute("dto",dto);
					if(no == cookNo) {
						request.setAttribute("menu_gubun", "member_modify");
						page = "/member/modify.jsp";
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
					}else if(dto1.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");
						
					}else {
						request.setAttribute("menu_gubun", "member_modify");
						page = "/member/modify.jsp";
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
					}
				}
			}else if(url.indexOf("modifyProc.do") != -1){//수정 처리
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				pw = replace(pw);
				String newPw = pw.replace(" ", "");
				String name = request.getParameter("name");
				String grade_ = request.getParameter("grade");
				int grade = Integer.parseInt(grade_);
				String postNum = request.getParameter("postNum");
				String street_addr = request.getParameter("street_addr");
				String parcel_addr = request.getParameter("parcel_addr");
				String detail_addr = request.getParameter("detail_addr");
				String reference   = request.getParameter("reference");
				MemberDTO dto =new MemberDTO(); //DTO set
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setGrade(grade);
				dto.setPostNum(postNum);
				dto.setStreet_addr(street_addr);
				dto.setParcel_addr(parcel_addr);
				dto.setDetail_addr(detail_addr);
				dto.setReference(reference);
				
				HttpSession session = request.getSession(); //관리자&본인 외 접근제한
				int result = 0;
			 if(!pw.equals(newPw)) {
					out.println("<script>");
					out.println("alert('비밀번호 빈칸 오류');");
					out.println("location.href='"+path+"/member_servlet/modify.do?no='"+no+";");
					out.println("</script>");
				}else if(cookNo == 0) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");

				}else if(cookNo != 0) {
					MemberDTO dto1 = dao.getSelectOneNo(cookNo);
					
					if(no == cookNo || dto1.getGrade() == 1) {
						result = dao.update(dto);
						if(result >0 ){
							if(no == cookNo) {//세션초기화
								session.invalidate(); //세션제거
								temp = path+"/member/login.jsp";
							}else {
								temp = path+"/member/list.jsp";
							}
						}else {
							temp = path+"/member/list.jsp";
						}
					}else if(dto1.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");					
					}
					
				}
		 		response.sendRedirect(temp);
			}else if(url.indexOf("delete.do") != -1){//// 삭제 처리 ////
				System.out.println("123456789");
				if(cookNo == 0) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");

				}else if(cookNo != 0) {
					MemberDTO dto1 = dao.getSelectOneNo(cookNo);
					MemberDTO dto = dao.getSelectOneNo(no);
					request.setAttribute("dto",dto);
					if(no == cookNo || dto1.getGrade() == 1) {
						request.setAttribute("menu_gubun", "member_delete");
						page = "/member/delete.jsp";
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);
					}else if(dto1.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");
					}
				}
				
			}else if(url.indexOf("deleteProc.do") != -1) {
				HttpSession session = request.getSession();
				int result = 0;
				
				if(cookNo == 0 ) {
					out.println("<script>");
					out.println("alert('권한 제한.');");
					out.println("location.href='"+path+"';");
					out.println("</script>");

				}else if(cookNo != 0) {
					MemberDTO dto1 = dao.getSelectOneNo(cookNo);
					MemberDTO dto = dao.getSelectOneNo(no);
					request.setAttribute("dto",dto);
					if(no == cookNo || dto1.getGrade() == 1) {
						System.out.println("d_no: "+no);
						result = dao.delete(no);
						System.out.println("result: "+result);
					}else if(dto1.getGrade() != 1) {
						out.println("<script>");
						out.println("alert('권한 제한.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");	
					}
				}
				
				if(result >0){
					if( no == cookNo) {
						session.invalidate(); //// 세션제거 ////
						out.println("<script>");
						out.println("alert('탈퇴처리 되었습니다.');");
						out.println("location.href='"+path+"/index.do';");
						out.println("</script>");
					}else {
						out.println("<script>");
						out.println("alert('탈퇴처리 되었습니다.');");
						out.println("sunteak_proc('list','1','')");
						out.println("</script>");

					}
				}else {
					out.println("<script>");
					out.println("alert('오류 발생.');");
					out.println("location.href='"+path+"/index.do';");
					out.println("</script>");

				}

				}
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("menu_gubun", "exception");
			RequestDispatcher rd = request.getRequestDispatcher("/main/main.jsp");
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProc(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProc(request, response);
	}
	
	public String replace(String a) {
		a = a.replace("<", "&lt;");
		a = a.replace(">", "&gt;");
		a = a.replace("&", "&amp;");
		a = a.replace("\"", "&quot;");
		a = a.replace("'", "&apos;");	
		
		return a;
	}

}
