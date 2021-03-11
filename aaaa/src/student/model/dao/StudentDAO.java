package student.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import student.model.dto.StudentDTO;

public class StudentDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConn() {
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String dbId = "jspTest";
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
	
	public int setInsert(StudentDTO dto) {
		getConn();
		int result = 0;
		try {
			String sql = "insert into student values(seq_student.nextval,?,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,dto.getYear());
			pstmt.setString(2,dto.getS_class());
			pstmt.setString(3,dto.getNum());
			pstmt.setString(4,dto.getName());
			pstmt.setString(5,dto.getBorn());
			pstmt.setString(6,dto.getS_phone());
			pstmt.setString(7,dto.getP_phone());
			pstmt.setString(8,dto.getAdr());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int getCount(String search_option,String search_data) {
		getConn();
		int count = 0;
		try {
			String sql = "";
			String sql1 = "select count(*) from student ";
			if(search_option == null || search_option =="") {
				sql = sql1;
			}else {
				sql = sql1 + " where "+ search_option+" like '%"+ search_data +"%'";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			
		}
		return count;
	}
	
	public ArrayList<StudentDTO> search(int startRow, int endRow,String search_data, String search_option) {
		getConn();
		ArrayList<StudentDTO> list = new ArrayList<>();
		try {
			String sql="";
			String sql1="select *from "
					+ "(select ROWNUM rn,bb.* from "
					+ "(select *from student ";
			if(search_option == null || search_option =="") {
				sql = sql1 + " order by year desc, class desc) bb ) where rn between ? and ? ";
			}else {
				sql = sql1 +" where "+ search_option+" like '%"+search_data+"%' order by year desc, class desc) bb ) where rn between ? and ? ";
			}
//			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setNo(rs.getInt("no"));
				dto.setYear(rs.getInt("year"));
				dto.setS_class(rs.getString("class"));
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setBorn(rs.getString("born"));
				dto.setS_phone(rs.getString("s_phone"));
				dto.setP_phone(rs.getString("p_phone"));
				dto.setAdr(rs.getString("adr"));
				dto.setRegidate(rs.getDate("regidate"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int testCount() {
		getConn();
		int count = 0;
		try {
			String sql1 = "select count(*) from test";
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<StudentDTO> testSearch() {
		getConn();
		ArrayList<StudentDTO> list = new ArrayList<>();
		try {
			String sql ="select * from test order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setTest_no(rs.getInt("no"));
				dto.setTest_name(rs.getString("test_name"));
				dto.setTest_regidate(rs.getDate("regidate"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int testInsert(StudentDTO dto) {
		getConn();
		int result = 0;
		try {
			String sql = "insert into test values(seq_test.nextval,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getTest_name());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
