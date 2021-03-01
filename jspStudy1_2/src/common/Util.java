package common;


import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class Util {
	
	public int[] getDateTime() {
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int day = cal.get(Calendar.DAY_OF_MONTH);
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int min = cal.get(Calendar.MINUTE);
	int sec = cal.get(Calendar.SECOND);
	
	int[] result = new int[6];
	result[0] = year;
	result[1] = month;
	result[2] = day;
	result[3] = hour;
	result[4] = min;
	result[5] = sec;
	return result;
	}
	
	public int numberCheck(String str, int defaultNumber) {
		String defaultPageNumber = String.valueOf(defaultNumber);
		if(str==null || str.trim().equals("")) {
			str= defaultPageNumber;
		}
		try {
			Double.parseDouble(str);
			return Integer.parseInt(str);
		}catch (Exception e) {
			return Integer.parseInt(defaultPageNumber);
		}
	}
	public int no(String str,int defaultNumber) {
		String defaultNo = String.valueOf(defaultNumber);
		if(str==null || str.trim().equals("")) {
			str= defaultNo;
		}
		try {
			Double.parseDouble(str);
			return Integer.parseInt(str);
		}catch (Exception e) {
			return Integer.parseInt(defaultNo);
		}
	}
	
	public String list_gubunCheck(String list_gubun) {
		if(list_gubun == null || list_gubun.trim().equals("")) {
			list_gubun ="all";
		}
		list_gubun = list_gubun.trim();
		if(list_gubun.equals("all")) {
			
		}else if(list_gubun.equals("ing")) {
			
		}else if(list_gubun.equals("end")) {
			
		}else {
			list_gubun ="all";
		}
		return list_gubun;
	}
	
	public String[] searchCheck(String search_option,String search_data,String search_date_s,String search_date_e,String search_date_check) {
		String[] result=new String[5];
		if(search_option==null|| search_option.trim().equals("")) {
			search_option ="";
		}
		search_option = search_option.trim();
		if(search_option.equals("")) {
			
		}else if(search_option.equals("question")) {
			
		}else {
			search_option="";
		}
		
		if(search_data==null|| search_data.trim().equals("")) {
			search_data ="";

		}
		search_data = search_data.trim();
		
		if(search_date_check==null|| search_date_check.trim().equals("")) {
			search_date_check ="";
		}
		if(search_date_s==null|| search_date_s.trim().equals("")) {
			search_date_s ="";
		}
		search_date_s = search_date_s.trim();
		
		if(search_date_e==null|| search_date_e.trim().equals("")) {
			search_date_e ="";
		}
		
		if(search_date_check.equals("O")) {
			if(search_date_s==null|| search_date_s.trim().equals("")) {
				search_date_s ="";
			}
			search_date_s = search_date_s.trim();
			
			if(search_date_e==null|| search_date_e.trim().equals("")) {
				search_date_e ="";
			}
			search_date_e = search_date_e.trim();
			
			if(search_date_s.equals("")|| search_date_e.equals("")) {
				search_date_check ="";
			}
		}else {
//			search_date_s ="";
//			search_date_e ="";
			search_date_check ="";
		}
		result[0] = search_option;
		result[1] = search_data;
		result[2] = search_date_s;
		result[3] = search_date_e;
		result[4] = search_date_check;
		return result;
	}
	
	public String[] getServerInfo(HttpServletRequest request) throws UnknownHostException{
		String[] result = new String[6];
		String referer = request.getHeader("REFERER");
		if(referer == null || referer.trim().equals("")) {
			referer = "";
		}
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI().toString();
		String ip = Inet4Address.getLocalHost().getHostAddress();
		String ip6 ="";
		
		result[0] = referer;
		result[1] = path;
		result[2] = url;
		result[3] = uri;
		result[4] = ip;
		result[5] = ip6;
		return result;
	}
	
	public String[] sessionCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		int cookNo = 0;
		if(session.getAttribute("cookNo") != null) {
			cookNo = (Integer)session.getAttribute("cookNo");
		}
		
		String cookId = "";
		if(session.getAttribute("cookId") != null) {
			cookId = (String)session.getAttribute("cookId");
		}
		
		String cookName = "";
		if(session.getAttribute("cookId") != null) {
			cookName = (String)session.getAttribute("cookName");
		}
		
		String[] result = new String[3];
		result[0] = cookNo + "";
		result[1] = cookId;
		result[2] = cookName;
		return result; 				
	}
	
	public int[] pager(int pageSize, int blockSize, int totalRecord, int pageNumber) {
		int[] result = new int[6];
		int number = totalRecord - pageSize *(pageNumber -1);
		int startRecord = pageSize * (pageNumber -1)+1;
		int lastRecord = pageSize * pageNumber;
		if(lastRecord > totalRecord) {
			lastRecord = totalRecord;
		}
		int totalPage = 0;
		int startPage = 1;
		int lastPage = 1;
		if(totalRecord>0) {
			totalPage = totalRecord / pageSize +(totalRecord%pageSize == 0? 0:1);
			startPage = (pageNumber/blockSize - (pageNumber % blockSize !=0 ? 0:1))*blockSize +1 ;
			lastPage = startPage + blockSize - 1;
			if(lastPage > totalPage) {	
				lastPage = totalPage;
			}
		}
		
		result[0] = number; 
		result[1] = startRecord;
		result[2] = lastRecord;
		result[3] = totalPage;
		result[4] = startPage;
		result[5] = lastPage;
		return result;
		
	}
	
	public String nullCheck(String str) {
		String result = str;
		if(result == null || result.trim().equals("")) {
			result ="";
		}
		result =result.trim();
		return result;
	}
}
