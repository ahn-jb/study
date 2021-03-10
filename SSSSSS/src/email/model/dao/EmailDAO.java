package email.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import email.model.dto.EmailDTO;

public class EmailDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	String tableName01 = "board";
	String tableName02 = "board_comment";
	
	public void getConn() {
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String dbId = "jspStudy";
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
	
	public int setInsert(EmailDTO dto) {
		getConn();
		int result = 0;
		try {
			String sql = "insert into member_email values(seq_member_email.nextval,?,?,?,current_timestamp)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemberName());
			pstmt.setString(2, dto.getMemberEmail());
			pstmt.setString(3, dto.getMemberbirthday());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int getCount() {
		getConn();
		int count =0;
		try {
			String sql = "select count(*) from member_email";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public List<EmailDTO> getEmail(String birth_chk){
		getConn();
		List<EmailDTO> list = new ArrayList<>();
		Date today_ = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String today = date.format(today_).substring(4);
		try {
			String sql ="";
			if(birth_chk == null || birth_chk=="") {
				sql = "select * from member_email";
			}else {
				sql = "select * from member_email where birthday like '%"+today+"%'";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				EmailDTO dto = new EmailDTO();
				dto.setMemberEmail(rs.getString("memberEmail"));
				dto.setMemberName(rs.getString("memberName"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
