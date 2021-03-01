package shop.common;

import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

import common.Util;

public class UtilProduct extends Util {

	@Override
	public int[] getDateTime() {

		return super.getDateTime();
	}

	@Override
	public int numberCheck(String str, int defaultNumber) {
		return super.numberCheck(str, defaultNumber);
	}

	@Override
	public int no(String str, int defaultNumber) {

		return super.no(str, defaultNumber);
	}

	@Override
	public String list_gubunCheck(String list_gubun) {

		return super.list_gubunCheck(list_gubun);
	}

	public String[] searchCheck(String search_option,String search_data) {
		String[] result=new String[2];
		if(search_option==null|| search_option.trim().equals("")) {
			search_option ="";
		}
		search_option = search_option.trim();
		if(search_option.equals("")) {
			
		}else if(search_option.equals("name")) {
			
		}else if(search_option.equals("description")) {
			
		}else if(search_option.equals("total")) {
			
		}else {
			search_option="";
		}
		
		if(search_data==null|| search_data.trim().equals("")) {
			search_data ="";

		}
		search_data = search_data.trim();
		
		if(search_option.equals("")||search_data.equals("")) {
			search_option = "";
			search_data = "";
		}
		
		result[0] = search_option;
		result[1] = search_data;
		return result;
	}

	@Override
	public String[] getServerInfo(HttpServletRequest request) throws UnknownHostException {

		return super.getServerInfo(request);
	}

	@Override
	public String[] sessionCheck(HttpServletRequest request) {

		return super.sessionCheck(request);
	}

	@Override
	public int[] pager(int pageSize, int blockSize, int totalRecord, int pageNumber) {

		return super.pager(pageSize, blockSize, totalRecord, pageNumber);
	}

	@Override
	public String nullCheck(String str) {

		return super.nullCheck(str);
	}
	
	
}
