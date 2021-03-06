package model.dao.survey;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DbExample;
import model.dto.member.MemberDTO;
import model.dto.survey.SurveyAnswerDTO;
import model.dto.survey.SurveyDTO;


public class SurveyDAO {
	Connection conn= DbExample.dbConn();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String tableName01 = "survey";
	String tableName02 = "survey_answer";
	
	public int setInsert(SurveyDTO dto) {
		int result = 0;
		try {
			String sql = "insert into "+tableName01+" values(seq_survey.nextval,?,?,?,?,?,?,?,?,current_timestamp)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getQuestion() );
			pstmt.setString(2,dto.getAns1() );
			pstmt.setString(3,dto.getAns2() );
			pstmt.setString(4,dto.getAns3() );
			pstmt.setString(5,dto.getAns4() );
			pstmt.setString(6,dto.getStatus() );
			pstmt.setTimestamp(7,dto.getStart_date() );
			pstmt.setTimestamp(8,dto.getLast_date() );
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	public int getTotalRecord(String list_gubun,String search_option,String search_data,String search_date_s,String search_date_e,String search_date_check) {
		int count = 0;
		int k = 0;
		try {
			if(search_date_s.length()>0 && search_date_e.length() > 0) {
				search_date_s = search_date_s + " 00:00:00.0";
				search_date_e = search_date_e + " 23:59:59.999999";
//				System.out.println(search_date_s);
//				System.out.println(search_date_e);
//				java.sql.Timestamp start_date = java.sql.Timestamp.valueOf(search_date_s);
//				java.sql.Timestamp last_date = java.sql.Timestamp.valueOf(search_date_e);
			}
			String sql="select count(*) from survey where no >?";
			if(list_gubun.equals("all")) {
				sql += "";
			}else if(list_gubun.equals("ing")) {
				sql += " and current_timestamp between start_date and last_date";
			}else if(list_gubun.equals("end")) {
				sql += " and current_timestamp > last_date";
			}
			if(search_option.length() > 0 && search_data.length()>0) {
				sql += " and "+search_option+" like '%"+search_data+"%'";
			}
			if(search_date_s.length()>0 && search_date_e.length() > 0 && search_date_check.equals("O")) {
				sql += " and (start_date >= to_timestamp(?) and last_date <= to_timestamp(?))";
			}
//			System.out.println("count:"+sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(++k, 0);
			if(search_date_s.length()>0 && search_date_e.length() > 0 && search_date_check.equals("O")) {
				pstmt.setString(++k, search_date_s);
				pstmt.setString(++k, search_date_e);
				}
			rs= pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<SurveyDTO> getSelectSurvey(int startRecord,int lastRecord,String list_gubun,String search_option,String search_data,String search_date_s,String search_date_e,String search_date_check){
		ArrayList<SurveyDTO> list = new ArrayList<>();
		int k= 0;
		try {
			if(search_date_s.length()>0 && search_date_e.length() > 0) {
				search_date_s = search_date_s + " 00:00:00.0";
				search_date_e = search_date_e + " 23:59:59.999999";
//				System.out.println(search_date_s);
//				System.out.println(search_date_e);
//				java.sql.Timestamp start_date = java.sql.Timestamp.valueOf(search_date_s);
//				java.sql.Timestamp last_date = java.sql.Timestamp.valueOf(search_date_e);
			}
			String basicSql ="";
			basicSql += "select t1.*,"
					+ " (select count(*) from "+tableName02+" t2 where t2.no = t1.no) survey_count"
					+" from "+tableName01+" t1 where no>?";
			if(list_gubun.equals("ing")) {
				basicSql += " and current_timestamp between start_date and last_date";
			}else if(list_gubun.equals("end")) {
				basicSql += " and current_timestamp > last_date";
				}
			
			if(search_option.length() > 0 && search_data.length()>0) {
				basicSql += " and "+search_option+" like '%"+search_data+"%'";
			}
			if(search_date_s.length()>0 && search_date_e.length() > 0 && search_date_check.equals("O")) {
				basicSql += " and (start_date >= to_timestamp(?) and last_date <= to_timestamp(?))";
			}
			basicSql += " order by no desc";
			String sql = "";
			sql += "select * from (select A.*, Rownum Rnum from ("+basicSql+") A) where Rnum >=? and Rnum<=? ";
//			System.out.println("list :"+sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(++k, 0);
			if(search_date_s.length()>0 && search_date_e.length() > 0 && search_date_check.equals("O")) {
			pstmt.setString(++k, search_date_s);
			pstmt.setString(++k, search_date_e);
			}
			pstmt.setInt(++k, startRecord);
			pstmt.setInt(++k, lastRecord);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SurveyDTO dto =new SurveyDTO();
				dto.setNo(rs.getInt("no"));
				dto.setQuestion(rs.getString("question"));
				dto.setAns1(rs.getString("ans1"));
				dto.setAns2(rs.getString("ans2"));
				dto.setAns3(rs.getString("ans3"));
				dto.setAns4(rs.getString("ans4"));
				dto.setStatus(rs.getString("status"));
				dto.setStart_date(rs.getTimestamp("start_date"));
				dto.setLast_date(rs.getTimestamp("last_date"));
				dto.setRegi_date(rs.getTimestamp("regi_date"));
				dto.setSurvey_count(rs.getInt("survey_count"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public SurveyDTO getSelectOne(int no) {//no으로 찾는  회원 정보
		SurveyDTO dto = new SurveyDTO();
		try {
			String sql = "select * from survey where no =?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setNo(rs.getInt("no"));
				dto.setQuestion(rs.getString("question"));
				dto.setAns1(rs.getString("ans1"));
				dto.setAns2(rs.getString("ans2"));
				dto.setAns3(rs.getString("ans3"));
				dto.setAns4(rs.getString("ans4"));
				dto.setStatus(rs.getString("status"));
				dto.setStart_date(rs.getTimestamp("start_date"));
				dto.setLast_date(rs.getTimestamp("last_date"));
				dto.setRegi_date(rs.getTimestamp("regi_date"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int updateSurvey(SurveyDTO dto) {
		int result = 0;
		try {
			String sql = "update survey set question=?,ans1=?,ans2=?,ans3=?,ans4=?,status=? where no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getQuestion());
			pstmt.setString(2,dto.getAns1());
			pstmt.setString(3,dto.getAns2());
			pstmt.setString(4,dto.getAns3());
			pstmt.setString(5,dto.getAns4());
			pstmt.setString(6, dto.getStatus());
			pstmt.setInt(7, dto.getNo());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteSurvey(int no) {
		int result = 0;
		try {
			String sql = "delete from survey where no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public int setInsertAnswer(SurveyAnswerDTO dto) {
		int result = 0;
		try {
			String sql = "insert into survey_answer values(seq_survey_answer.nextval,?,?,current_timestamp) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			pstmt.setInt(2, dto.getAnswer());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int[] getCountAnwer(int no) {
		int[] count =new int[4];
		try {
			for(int i=0; i<count.length; i++ ) {
				String sql = "select count(*) from survey_answer where no = ? and answer = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.setInt(2, i+1);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count[i] = rs.getInt(1);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int getTotalCount(int no) {
		int count = 0;
		try {
			String sql = "select count(*) as count from survey_answer where no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
