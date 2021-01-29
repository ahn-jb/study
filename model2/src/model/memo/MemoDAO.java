package model.memo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemoDAO {

	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConn() {	
		try {
		String driver ="oracle.jdbc.driver.OracleDriver";
		String dbUrl ="jdbc:oracle:thin:@localhost:1521/xe";
		String dbId = "model2";
		String dbPasswd = "1234";
		
		Class.forName(driver);
		conn = DriverManager.getConnection(dbUrl,dbId,dbPasswd);
		System.out.println("--오라클 접속 성공--");
		
		}catch(Exception e) {
			System.out.println("--오라클 접속 실패--");
			e.printStackTrace();
		}
	}
	
	
	public void getConnClose() {
		try {
			if(rs!=null) {rs.close();}
			if(pstmt!=null) {pstmt.close();}
			if(conn!=null) {conn.close();}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int setInsert(MemoDTO dto) {
		getConn();
		int result = 0;
		try {
			String sql = "insert into memo values(seq_memo.nextval,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			 e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<MemoDTO> getSelectAll(){
		getConn();
		ArrayList<MemoDTO> list = new ArrayList<>();
		try {
			String sql = "select * from memo order by no asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemoDTO dto =new MemoDTO();
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setRegi_date(rs.getDate("regi_date"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
}
