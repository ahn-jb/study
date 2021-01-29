package guestbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GbDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConn() {	
		try {
		String driver ="oracle.jdbc.driver.OracleDriver";
		String dbUrl ="jdbc:oracle:thin:@localhost:1521/xe";
		String dbId = "sihum";
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
	
	public int setInsert(GbDTO dto) {
		getConn();
		int result = 0;
		try {
			String sql = "insert into guestbook values(seq_guestbook.nextval,?,?,?,?,sysdate) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getName() );
			pstmt.setString(2,dto.getEmail() );
			pstmt.setString(3,dto.getPasswd() );
			pstmt.setString(4,dto.getContent() );
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
	
	public int getCount(String bunryu,String search) {
		getConn();
		int count = 0;
		try {
			String sql="";
			if(bunryu==null) {
				sql = "select count(*) from guestbook ";
			}else {
				sql = "select count(*) from guestbook where "+bunryu+" like '%"+search+"%' ";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return count;
	}
	
	public ArrayList<GbDTO> getSelectAll(String bunryu,String search){
		getConn();
		ArrayList<GbDTO> list = new ArrayList<GbDTO>();
		try {
			String sql ="";
			if(bunryu == null) {
				sql = "select * from guestbook order by no desc";
			}else {
				sql = "select * from guestbook where "+bunryu+" like '%"+search+"%' order by no desc";
			}
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			GbDTO dto = new GbDTO();
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setEmail(rs.getString("email"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setContent(rs.getString("content"));
			dto.setWrite_date(rs.getDate("write_date"));
			list.add(dto);
		}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
