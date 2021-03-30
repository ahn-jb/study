package shop.mall.controller;

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

import shop.common.UtilProduct;
import shop.mall.model.dao.CartDAO;
import shop.mall.model.dto.CartDTO;
import shop.product.model.dao.ProductDAO;
import shop.product.model.dto.ProductDTO;


@WebServlet("/mall_servlet/*")
public class MallController extends HttpServlet {
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
		
		CartDAO cartDao = new CartDAO();
		CartDTO cartDto = new CartDTO();
		
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
			request.setAttribute("menu_gubun", "mall_index");
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("mall_list.do") != -1) {
			request.setAttribute("menu_gubun", "mall_list");
			
			int pageSize = 9;
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
			List<ProductDTO> list =dao.search(startRecord,lastRecord,search_data,search_option);		
			request.setAttribute("menu_gubun", "mall_list");
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
			
			page= "/shop/mall/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("mall_view.do") != -1) {
			request.setAttribute("menu_gubun", "product_view");
			dto = dao.getView(no);
			request.setAttribute("dto", dto);
			page= "/shop/mall/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("mall_cart.do") != -1) {
			request.setAttribute("menu_gubun", "product_mall_cart");

			String amount_ = request.getParameter("amount");
			int amount = Integer.parseInt(amount_);
			
			cartDto.setMemberNo(cookNo);
			cartDto.setProductNo(no);
			cartDto.setAmount(amount);
			
			int result = cartDao.setInsert(cartDto);
			if(result>0) {
				out.println("<script>alert('장바구니 추가완료'); suntaek_proc('mall_list','1','');</script>");
			}else {
				out.println("<script>alert('실패'); suntaek_proc('mall_view','','"+no+"');</script>");
			}
			
		}else if(url.indexOf("cart_list2.do") != -1) {
			request.setAttribute("menu_gubun", "product_cart_list");
			if(cookNo == 0) {
				out.println("<script>alert('로그인이 필요한 페이지입니다.'); suntaek_proc('mall_list','1','');</script>");
				return;
			}
			int pageSize = 10;
			int blockSize= 10;
			int totalRecord = cartDao.getCount(cookNo);
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
			List<CartDTO> Cart_list = cartDao.getCartlist(cookNo,startRecord, lastRecord);	
			request.setAttribute("menu_gubun", "mall_list");
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
			request.setAttribute("Cart_list", Cart_list);
			page= "/shop/mall/cart.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("cart_sakje.do") != -1) {
			request.setAttribute("menu_gubun", "product_cart_sakje");
			
			if(request.getParameter("index")==null || request.getParameter("index")=="") {
				temp=path+"/mall_servlet/cart_list2.do";
				response.sendRedirect(temp);
				return;
			}

			String cartDel = request.getParameter("cartDel");
			String index_ = request.getParameter("index");
			int index = Integer.parseInt(index_);
			String[] imsi = new String[index];
			imsi = cartDel.split(",");
			
			int result =0;
			for(int i=0; i<imsi.length; i++) {
				int cartNo = Integer.parseInt(imsi[i]);
				result = cartDao.CartDelete(cookNo, cartNo);
			}
			
			temp=path+"/mall_servlet/cart_list2.do";
			response.sendRedirect(temp);
		}else if(url.indexOf("jumun.do") != -1) {
			
			String total_price = request.getParameter("total_price");
			System.out.println("total_price:"+total_price);
			request.setAttribute("total_price", total_price);
			
			page= "/shop/mall/jumun.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}
		
	}

}
