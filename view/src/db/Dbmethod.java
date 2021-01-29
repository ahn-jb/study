package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Dbmethod {
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Db db = new DbImplOracle(); 
	
	public HumanDTO getIoT(String aptId) {
		conn =db.getConn();
		HumanDTO dto = new HumanDTO();
		try {
			String sql = "select*from wallpad where aptId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,aptId);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				dto.setAptId(rs.getString("aptId"));
				dto.setSecurity(rs.getString("security"));
				dto.setAircondition(rs.getString("aircondition"));
				dto.setLight(rs.getString("light"));
				dto.setTelevision(rs.getString("tv"));
				dto.setCucu(rs.getString("cucu"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		return dto;
	}
	
}
