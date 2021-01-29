package test_loop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Savepoint;

public class transactionTBLDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConn() {	
		try {
		String driver ="oracle.jdbc.driver.OracleDriver";
		String dbUrl ="jdbc:oracle:thin:@localhost:1521/xe";
		String dbId = "jspboard";
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
	
	public void insert() {
		getConn();
		try {
			long start_time = System.currentTimeMillis();
			conn.setAutoCommit(false);
			Savepoint savePoint = null;
			for(int i=0; i <100000; i++) {
				if(i>1000) {
					savePoint = conn.setSavepoint();
				}
			String sql ="insert into transactionTBL values (?,?,current_timestamp)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			pstmt.setString(2, "N"+i);
			pstmt.executeUpdate();
			pstmt.close();
//			conn.commit();
			}
			conn.rollback(savePoint);
			conn.commit();
			conn.setAutoCommit(true);
			long end_time = System.currentTimeMillis();
			System.out.println("시작시간 : " +start_time);
			System.out.println("엔드시간 : " +end_time);
			System.out.println("걸린시간: " +((end_time-start_time)/1000.0)+"초 소요됨");
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	public void insert2() {
		getConn();
		try {
			long start_time = System.currentTimeMillis();
			conn.setAutoCommit(false);
			for(int i=0; i <100000; i++) {
			String sql ="insert into transactionTBL values (?,?,current_timestamp)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			pstmt.setString(2, "N"+i);
			pstmt.addBatch();

//			conn.commit();
			}
			pstmt.executeBatch();
			conn.commit();
			conn.setAutoCommit(true);
			long end_time = System.currentTimeMillis();
			System.out.println("시작시간 : " +start_time);
			System.out.println("엔드시간 : " +end_time);
			System.out.println("걸린시간: " +((end_time-start_time)/1000.0)+"초 소요됨");
		}catch(Exception e) {
			e.printStackTrace();

		}
	}
	
}
