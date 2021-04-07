package com.test.springStudy.common.util;

import java.io.File;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Util {
	public Util() {
		// TODO Auto-generated constructor stub
	}

	public String nullCheck(String str) {
		String result = str;
		if (result == null || result.trim().equals("")) {
			result = "";
		}
		result = result.trim();
		return result;
	}

	public String[] getServerInfo(HttpServletRequest request) {
		String[] result = new String[6];
		String referer = request.getHeader("REFERER");
		if(referer == null || referer.trim().equals("")) {
			referer = "";
		}
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI().toString();
	//	String ip = Inet4Address.getLocalHost().getHostAddress();
	
	//  throws UnknownHostException
		String ip = "";
		try {
			ip = Inet4Address.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			//e.printStackTrace();
		}
	
		String ip6 = request.getHeader("X-Forwarded-For");  
	    if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
	    	ip6 = request.getHeader("Proxy-Client-IP");  
	    }  
	    if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
	    	ip6 = request.getHeader("WL-Proxy-Client-IP");  
	    }  
	    if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
	    	ip6 = request.getHeader("HTTP_CLIENT_IP");  
	    }  
	    if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
	    	ip6 = request.getHeader("HTTP_X_FORWARDED_FOR");  
	    }  
	    if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
	    	ip6 = request.getRemoteAddr();  
	    }
	    
		result[0] = referer;
		result[1] = path;
		result[2] = url;
		result[3] = uri;
		result[4] = ip;
		result[5] = ip6;
		return result;
	}

	public int[] getDateTime() {
		Calendar cal = Calendar.getInstance();
		//System.out.println(cal);
	
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		//System.out.println("현재 시각은 " + year + "년도 " + month + "월 " + day + "일 " + hour + "시 " + min + "분 " + sec + "초입니다.");
		
		int[] result = new int[6];
		result[0] = year;
		result[1] = month;
		result[2] = day;
		result[3] = hour;
		result[4] = min;
		result[5] = sec;
		
		return result;
	}

	public String getDateTimeType() {
		String result = "";
		int[] a = getDateTime();
		String y = a[0] + "";
		String m = a[1] + "";
		String d = a[2] + "";
		String s = a[3] + "";
		String b = a[4] + "";
		String c = a[5] + "";
		if (m.length() < 2) { m = "0" + m; }
		if (d.length() < 2) { d = "0" + d; }
		if (s.length() < 2) { s = "0" + s; }
		if (b.length() < 2) { b = "0" + b; }
		if (c.length() < 2) { c = "0" + c; }
		result = y + m + d + s + b + c;
		return result;
	}

/*	
	public String todayTime(int i) {
		Date now = new Date();
		SimpleDateFormat sf;
		
		if (i == 1) {
			sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		} else if (i == 2) {
			sf = new SimpleDateFormat("yyyyMMddHHmmss");
		} else {
			sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");
		}
		
		return sf.format(now);
	}
*/	
	public int numberCheck(String str, int defaultNumber) {
		String defaultPageNumber = String.valueOf(defaultNumber); //String.valueOf(Int값)
		
		if (str == null || str.trim().equals("")) { 
			str = defaultPageNumber; 
		}
		
		try {
			Double.parseDouble(str);
			return Integer.parseInt(str);
		} catch(Exception e) { //NumberFormatException
			return Integer.parseInt(defaultPageNumber);
		}
	}

	public String[] sessionCheck(HttpServletRequest request) {	
		HttpSession session = request.getSession();
		
		int cookNo = 0;
		if (session.getAttribute("cookNo") != null) {
			cookNo = (Integer)session.getAttribute("cookNo");
		}
	
		String cookId = "";
		if (session.getAttribute("cookId") != null) {
			cookId = (String)session.getAttribute("cookId");
		}
		
		String cookName = "";
		if (session.getAttribute("cookId") != null) {
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
		
		int jj = totalRecord - pageSize * (pageNumber - 1);
		
		int startRecord = pageSize * (pageNumber - 1) + 1;
		int lastRecord = pageSize * pageNumber;
	
		//끝페이지의 마지막 행번호에 대한 유효성 검사
		if (lastRecord > totalRecord) {
			lastRecord = totalRecord;
		}
		
		
		int totalPage = 0;
		int startPage = 1;
		int lastPage = 1;
		if (totalRecord > 0) {
			totalPage = totalRecord / pageSize + (totalRecord % pageSize == 0 ? 0 : 1);
			startPage = (pageNumber / blockSize - (pageNumber % blockSize != 0 ? 0 : 1)) * blockSize + 1;
			lastPage = startPage + blockSize - 1;
	
			if (lastPage > totalPage) {
				lastPage = totalPage;
			}
		}
		
		result[0] = jj;
		result[1] = startRecord;
		result[2] = lastRecord;
		result[3] = totalPage;
		result[4] = startPage;
		result[5] = lastPage;
		return result;
	}

	public Map<String, Integer> pagerMap(int pageSize, int blockSize, int totalRecord, int pageNumber) {
		int jj = totalRecord - pageSize * (pageNumber - 1);
		
		int startRecord = pageSize * (pageNumber - 1) + 1;
		int lastRecord = pageSize * pageNumber;
	
		//끝페이지의 마지막 행번호에 대한 유효성 검사
		if (lastRecord > totalRecord) {
			lastRecord = totalRecord;
		}
		
		
		int totalPage = 0;
		int startPage = 1;
		int lastPage = 1;
		if (totalRecord > 0) {
			totalPage = totalRecord / pageSize + (totalRecord % pageSize == 0 ? 0 : 1);
			startPage = (pageNumber / blockSize - (pageNumber % blockSize != 0 ? 0 : 1)) * blockSize + 1;
			lastPage = startPage + blockSize - 1; //화면에 보여질 페이지의 마지막 숫자
	
			if (lastPage > totalPage) {
				lastPage = totalPage;
			}
		}
	
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("jj", jj);
		map.put("startRecord", startRecord);
		map.put("lastRecord", lastRecord);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		return map;
	}

	public String removeTag(String html) throws Exception {
		return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}

	public String create_uuid() {
		return UUID.randomUUID().toString(); //java.util
	}

	public void fileDelete(HttpServletRequest request, String dir) {
		if (dir.trim().equals("")) {
			return;
		}
	
		// Calendar 객체 생성
		Calendar cal = Calendar.getInstance() ;
		long todayMil = cal.getTimeInMillis() ;     // 현재 시간(밀리 세컨드)
		long oneDayMil = 24*60*60*1000 ;            // 일 단위
		 
		Calendar fileCal = Calendar.getInstance() ;
		Date fileDate = null ;
		 
		 
		File path = new File(dir) ; // C:\test\
		File[] list = path.listFiles() ;
		 
		 
		for(int j=0 ; j < list.length; j++){             
		    fileDate = new Date(list[j].lastModified()) ;
		     
		    fileCal.setTime(fileDate);
		    long diffMil = todayMil - fileCal.getTimeInMillis() ;
		    System.out.println("diffMil:" + diffMil);
		    
		    int diffDay = (int)(diffMil/oneDayMil) ;
		 
		     
		    // 3일이 지난 파일 삭제
		    if(diffDay > 3 && list[j].exists()){
		        list[j].delete() ;
		        System.out.println(list[j].getName() + " 파일을 삭제했습니다.");
		    }
		    
		    
		    if(diffMil > 0 && list[j].exists()){ //1000000
		        list[j].delete() ;
		        System.out.println(list[j].getName() + " 파일을 삭제했습니다.");
		    }
		}
	}
	
	
	public Map<String, Object> basicInfo(HttpServletRequest request) {
		String temp;
		
		int[] nalja = getDateTime();
		int now_y = nalja[0];
		int now_m = nalja[1];
		int now_d = nalja[2];
		
		String[] serverInfo = getServerInfo(request);
		String refer = serverInfo[0];
		String path = serverInfo[1];
		String url = serverInfo[2];
		String uri = serverInfo[3];	
		String ip = serverInfo[4];	
//		String ip6 = serverInfo[5];
		
		temp = request.getParameter("pageNumber");
		int pageNumber = numberCheck(temp, 1);
		
		temp = request.getParameter("no");
		int no = numberCheck(temp, 0);
		
		String[] sessionArray = sessionCheck(request);
		int cookNo = Integer.parseInt(sessionArray[0]);
		String cookId = sessionArray[1];
		String cookName = sessionArray[2];
		
		Map<String, Object> map = new HashMap<>();
		map.put("now_y", now_y);
		map.put("now_m", now_m);
		map.put("now_d", now_d);
		
		map.put("refer", refer);
		map.put("path", path);
		map.put("url", url);
		map.put("uri", uri);
		map.put("ip", ip);
		
		map.put("pageNumber", pageNumber);
		map.put("no", no);
		
//		map.put("search_option", search_option);
//		map.put("search_data", search_data);
		
		map.put("cookNo", cookNo);
		map.put("cookId", cookId);
		map.put("cookName", cookName);
		
		return map;
	}
}
