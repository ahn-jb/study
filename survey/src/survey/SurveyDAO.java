package survey;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SurveyDAO {


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
	
	public int setInsert(SurveyDTO dto) {
		getConn();
		int result = 0;
		try {
			String sql = "insert into survey values(seq_survey.nextval,?,?,?,?,?,1)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getQuestion() );
			pstmt.setString(2,dto.getSelect1() );
			pstmt.setString(3,dto.getSelect2() );
			pstmt.setString(4,dto.getSelect3() );
			pstmt.setString(5,dto.getSelect4() );
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<SurveyDTO> getSelectAll(){
		getConn();
		ArrayList<SurveyDTO> list = new ArrayList<SurveyDTO>();
		try {
			String sql ="select * from survey order by no asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SurveyDTO dto = new SurveyDTO();
				dto.setNo(rs.getInt("no"));
				dto.setQuestion(rs.getString("question"));
				dto.setSelect1(rs.getString("select1"));
				dto.setSelect2(rs.getString("select2"));
				dto.setSelect3(rs.getString("select3"));
				dto.setSelect4(rs.getString("select4"));
				dto.setStatus(rs.getInt("status"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public SurveyDTO getSelectOne(int no) {
		getConn();
		SurveyDTO dto = new SurveyDTO();
		try {
			String sql = "select * from survey where no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setQuestion(rs.getString("question"));
				dto.setSelect1(rs.getString("select1"));
				dto.setSelect2(rs.getString("select2"));
				dto.setSelect3(rs.getString("select3"));
				dto.setSelect4(rs.getString("select4"));
				dto.setStatus(rs.getInt("status"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int update(SurveyDTO dto) {
		getConn();
		int result = 0;
		try {
			String sql = "update survey set question=?,select1=?,select2=?,select3=?,select4=?,status=? where no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getQuestion() );
			pstmt.setString(2,dto.getSelect1() );
			pstmt.setString(3,dto.getSelect2() );
			pstmt.setString(4,dto.getSelect3() );
			pstmt.setString(5,dto.getSelect4() );
			pstmt.setInt(6, dto.getStatus());
			pstmt.setInt(7, dto.getNo());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(int no) {
		getConn();
		int result = 0;
		try {
			String sql = "delete from survey where no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
