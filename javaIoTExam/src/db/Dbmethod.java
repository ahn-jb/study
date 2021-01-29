package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Dbmethod {
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Db db = new DbImplOracle(); 
	
	public void setInsert(HumanDTO dto) {
		conn =db.getConn();
		try {
			String sql = "insert into wallpad values(?,?,?,?,?,?,current_timestamp)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getAptId());
			pstmt.setString(2,dto.getSecurity());
			pstmt.setString(3,dto.getLight());
			pstmt.setString(4,dto.getAircondition());
			pstmt.setString(5,dto.getTelecision());
			pstmt.setString(6,dto.getCucu());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	
				
	}
	
}
