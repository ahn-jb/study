package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import db.Db;

public class TestDAO {

	Connection conn = Db.getConn();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public void getConnClose() {
		try {
			if(rs!=null) {rs.close();}
			if(pstmt!=null) {pstmt.close();}
			if(conn!=null) {conn.close();}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int setInsert(TestDTO dto) {
		
		int result = 0;
		int tot= dto.getKor()+dto.getEng()+dto.getMat()+dto.getSci();
		double avg = tot/4.0;
		try {
			String sql = "insert into schoolTest values(seq_num.nextval,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getHackyun());
			pstmt.setString(2, dto.getSid());
			pstmt.setString(3, dto.getTest());
			pstmt.setInt(4, dto.getKor());
			pstmt.setInt(5, dto.getEng());
			pstmt.setInt(6, dto.getMat());
			pstmt.setInt(7, dto.getSci());
			pstmt.setInt(8, tot);
			pstmt.setDouble(9, avg);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			getConnClose();
		}
		
		return result;
	}
	
	public TestDTO getSelectone(String sid){
		
		TestDTO dto = new TestDTO();
		
		try {
			String sql = "select t.*,s.sname from  student s,schoolTest t where s.sid =t.sid and s.sid=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,sid);
			rs= pstmt.executeQuery();
			if(rs.next()){
				dto.setSname(rs.getString("sname"));
				dto.setHackyun(rs.getInt("hackyun"));
				dto.setSid(rs.getString("sid"));
				dto.setTest(rs.getString("test"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setSci(rs.getInt("sci"));
				dto.setTot(rs.getInt("tot"));
				dto.setAvg(rs.getDouble("avg"));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
}
