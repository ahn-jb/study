package member;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class MemberDAO {
	Connection conn= null;
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
	
	
	public int setInsert(MemberDTO dto) {
		getConn();
		int result = 0;
		try {
			String sql="insert into join values(seq_join.nextval,?,?,?,?,?,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId() );
			pstmt.setString(2,dto.getPw() );
			pstmt.setString(3, dto.getName());
			pstmt.setString(4,dto.getAddr1() );
			pstmt.setString(5,dto.getAddr2() );
			pstmt.setString(6,dto.getAddr3() );
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int login(MemberDTO dto) {
		getConn();
		int result = 0; 
		try {
			String sql = "select * from join where id =? and pw =?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPw());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
