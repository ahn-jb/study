package shop.controller.product;




import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import shop.common.UtilProduct;
import shop.model.dao.product.ProductDAO;
import shop.model.dto.product.ProductDTO;



@WebServlet("/product_servlet/*")
public class ProductController extends HttpServlet {
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
		
		UtilProduct util = new UtilProduct(); 
		ProductDTO dto = new ProductDTO();
		ProductDAO dao = new ProductDAO();
		
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
			request.setAttribute("menu_gubun", "product_index");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("list.do") != -1) {
			String pageSize_ = request.getParameter("pageSize");
			int pageSize = 0;
			if(pageSize_ == null || pageSize_ == "") {
				pageSize = 10;
			}else {
				pageSize = Integer.parseInt(pageSize_);
			}
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

			ArrayList<ProductDTO> list =dao.search(startRecord,lastRecord,search_data,search_option);
			request.setAttribute("menu_gubun", "board_list");
			request.setAttribute("list",list);
			request.setAttribute("count",totalRecord);
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
			
			page= "/shop/product/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("chuga.do") != -1) {
			request.setAttribute("menu_gubun", "product_chuga");
			
			page = "/shop/product/chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("chugaProc.do") != -1 || url.indexOf("sujungProc.do") != -1) {
			request.setAttribute("menu_gubun", "product_chugaProc");
			
			String img_path01 = request.getSession().getServletContext().getRealPath("/attach/product_img/");			
			String img_path02 = img_path01.replace("\\", "/");
			String img_path03 = img_path01.replace("\\", "\\\\");
			System.out.println(img_path01);
			
			int max_size = 10*1024*1024; //10MB,업로드 최대용량
			MultipartRequest multi = new  MultipartRequest(request,img_path03, max_size,"utf-8",new DefaultFileRenamePolicy());
			//이 순간에 파일이 저장됨
			String name= multi.getParameter("name");
			temp = multi.getParameter("price");
			int price = Integer.parseInt(temp);
			String description = multi.getParameter("description");
			
			String[] array = new String[3];
			
			if(no > 0 ) {
				no = Integer.parseInt(multi.getParameter("no"));
				dto = dao.getView(no);
			
				for(int i=0; i<array.length; i++ ) {
					String[] imsi = dto.getProduct_img().split(",");
					System.out.println(imsi[i]);
				}
			}else {
				
				for(int i=0; i<array.length; i++) {
					array[i]= "-";
				}
				Enumeration files = multi.getFileNames();
				while(files.hasMoreElements()) {
					String formName = (String)files.nextElement();
					String filename = multi.getFilesystemName(formName);
					
					int k =Integer.parseInt(formName);
					array[k] = filename;
				}
				
				java.io.File f1;
				for(int i=0; i<array.length; i++) {
					String filename = array[i];
					 if(filename == null) {
						 continue;
					 }
					 //실제 경로에 파일이 존재하지 않을 경우
					 String old_path = img_path03+filename;
					 f1 = new java.io.File(old_path);
					 if(!f1.exists()) {
						 continue;
					 }
					 int point_index = filename.lastIndexOf(".");
					 String ext="";
					 if(point_index == -1) {
						 f1.delete();
						 array[i]= "-";
						 continue;
					 }
					 ext = filename.substring(point_index+1).toLowerCase();
					 if(!(ext.equals("jpg") || ext.equals("jpeg") || ext.equals("png") || ext.equals("gif"))) {
						 f1.delete();
						 array[i] = "-";
						 continue;
					 }
					 String uuid = util.create_uuid();
					 String new_filename = util.getDateTimeType() + "_" + uuid + "~" + ext;
					 System.out.println("new_filename: "+new_filename);
					 java.io.File newFile = new java.io.File(img_path03+new_filename);
					 f1.renameTo(newFile);
					 array[i] = array[i]+"|"+ new_filename;
				}
					
				String str = "";
				for(int i=0; i<array.length; i++) {
					str += "," + array[i];
				}
				str= str.substring(1);
				System.out.println("str: "+str);
				
				dto.setName(name);
				dto.setPrice(price);
				dto.setDescription(description);
				dto.setProduct_img(str);
					
//				int result = dao.setInsert(dto);
			}
			
			
			
		}else if(url.indexOf("view.do") != -1) {
			request.setAttribute("menu_gubun", "product_view");
			dto = dao.getView(no);
			request.setAttribute("dto", dto);
			page= "/shop/product/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sujung.do") != -1) {
			request.setAttribute("menu_gubun", "product_sujung");
			dto = dao.getView(no);
			request.setAttribute("dto", dto);
			page= "/shop/product/sujung.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("sujungProc.do") != -1) {
			request.setAttribute("menu_gubun", "product_sujungProc");
			String img_path01 = request.getSession().getServletContext().getRealPath("/attach/product_img/");			
			String img_path02 = img_path01.replace("\\", "/");
			String img_path03 = img_path01.replace("\\", "\\\\");
			
			
			String[] array = new String[3];
			System.out.println(no);
			dto = dao.getView(no);
			String filename= dto.getProduct_img();
			System.out.println("파일이름: "+filename);
			
//			java.io.File f1;
//			 String old_path = img_path03+filename;
//			 f1 = new java.io.File(old_path);
			
		}
	}

}
