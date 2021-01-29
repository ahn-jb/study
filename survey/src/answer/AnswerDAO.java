package answer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AnswerDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void getConn() {
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String dbId = "sihum";
			String dbPasswd = "1234";

			Class.forName(driver);
			conn = DriverManager.getConnection(dbUrl, dbId, dbPasswd);
			System.out.println("--오라클 접속 성공--");

		} catch (Exception e) {
			System.out.println("--오라클 접속 실패--");
			e.printStackTrace();
		}
	}

	public void getConnClose() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int setInsert(int survey_no,int survey_answer) {
		getConn();
		int result = 0;
		try {
			String sql = "insert into survey_answer values(seq_survey_answer.nextval,?,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, survey_no);
			pstmt.setInt(2, survey_answer);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int getCount(int survey_no, int survay_answer) {
		getConn();
		int count = 0;
		try {
			String sql = "select count(*) as count from survey_answer where survey_no=? and survey_answer = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, survey_no);
			pstmt.setInt(2, survay_answer);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public int getCount(int survey_no) {
		getConn();
		int count = 0;
		try {
			String sql = "select count(*) as count from survey_answer where survey_no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, survey_no);
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
