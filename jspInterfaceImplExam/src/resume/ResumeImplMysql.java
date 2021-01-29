package resume;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ResumeImplMysql implements ResumeDAO {
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	@Override
	public void getConn() {
		try {
			String driver ="com.mysql.jdbc.Driver";
			String dbUrl ="jdbc:mysql://localhost:3306/jspInterfaceImplExam";
			String dbId = "jspInterfaceImplExam";
			String dbPasswd = "1234";
			
			Class.forName(driver);
			conn = DriverManager.getConnection(dbUrl,dbId,dbPasswd);
			System.out.println("--Mysql 접속 성공--");
			
			}catch(Exception e) {
				System.out.println("--Mysql 접속 실패--");
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

	public int setInsert(ResumeDTO dto) {
		getConn();
		int result=0;
		try {
			String sql = "insert into resume values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setNull(1, java.sql.Types.NULL);
			pstmt.setString(2, dto.getPic());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getAdress());
			pstmt.setInt(7, dto.getToeic());
			pstmt.setInt(8, dto.getToefl());
			pstmt.setString(9, dto.getJapan());
			pstmt.setString(10, dto.getChina());
			pstmt.setString(11, dto.getGigan1());
			pstmt.setString(12, dto.getSchool1());
			pstmt.setString(13, dto.getJeongong1());
			pstmt.setString(14, dto.getGigan2());
			pstmt.setString(15, dto.getSchool2());
			pstmt.setString(16, dto.getJeongong2());
			pstmt.setString(17, dto.getGigan3());
			pstmt.setString(18, dto.getSchool3());
			pstmt.setString(19, dto.getJeongong3());
			pstmt.setString(20, dto.getGigan4());
			pstmt.setString(21, dto.getSchool4());
			pstmt.setString(22, dto.getJeongong4());
			result = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<ResumeDTO> getSelectAll() {
		getConn();
		ArrayList<ResumeDTO> list = new ArrayList<>();
		try {
			String sql = "select*from resume";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ResumeDTO dto = new ResumeDTO();
				dto.setNo(rs.getInt("no"));
				dto.setPic(rs.getString("pic"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAdress(rs.getString("adress"));
				dto.setToeic(rs.getInt("toeic"));
				dto.setToefl(rs.getInt("toefl"));
				dto.setJapan(rs.getString("japan"));
				dto.setChina(rs.getString("china"));
				dto.setGigan1(rs.getString("gigan1"));
				dto.setSchool1(rs.getString("school1"));
				dto.setJeongong1(rs.getString("jeongong1"));
				dto.setGigan2(rs.getString("gigan2"));
				dto.setSchool2(rs.getString("school2"));
				dto.setJeongong2(rs.getString("jeongong2"));
				dto.setGigan3(rs.getString("gigan3"));
				dto.setSchool3(rs.getString("school3"));
				dto.setJeongong3(rs.getString("jeongong3"));
				dto.setGigan4(rs.getString("gigan4"));
				dto.setSchool4(rs.getString("school4"));
				dto.setJeongong4(rs.getString("jeongong4"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		return list;
	}
	
	public ResumeDTO getSelectOne(int no) {
		getConn();
		ResumeDTO dto = new ResumeDTO();
		try {
			String sql="select*from resume where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setPic(rs.getString("pic"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAdress(rs.getString("adress"));
				dto.setToeic(rs.getInt("toeic"));
				dto.setToefl(rs.getInt("toefl"));
				dto.setJapan(rs.getString("japan"));
				dto.setChina(rs.getString("china"));
				dto.setGigan1(rs.getString("gigan1"));
				dto.setSchool1(rs.getString("school1"));
				dto.setJeongong1(rs.getString("jeongong1"));
				dto.setGigan2(rs.getString("gigan2"));
				dto.setSchool2(rs.getString("school2"));
				dto.setJeongong2(rs.getString("jeongong2"));
				dto.setGigan3(rs.getString("gigan3"));
				dto.setSchool3(rs.getString("school3"));
				dto.setJeongong3(rs.getString("jeongong3"));
				dto.setGigan4(rs.getString("gigan4"));
				dto.setSchool4(rs.getString("school4"));
				dto.setJeongong4(rs.getString("jeongong4"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int setUpdate(ResumeDTO dto) {
		getConn();
		int result =0;
		try {
			String sql = "update resume set pic=?,email=?,phone=?,adress=?,toeic=?,toefl=?,japan=?,china=?,"
					+ "gigan1=?,school1=?,jeongong1=?,"
					+ "gigan2=?,school2=?,jeongong2=?,"
					+ "gigan3=?,school3=?,jeongong3=?,"
					+ "gigan4=?,school4=?,jeongong4=?"
					+ "where no=?";
			
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPic());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getAdress());
			pstmt.setInt(5, dto.getToeic());
			pstmt.setInt(6, dto.getToefl());
			pstmt.setString(7, dto.getJapan());
			pstmt.setString(8, dto.getChina());
			pstmt.setString(9, dto.getGigan1());
			pstmt.setString(10, dto.getSchool1());
			pstmt.setString(11, dto.getJeongong1());
			pstmt.setString(12, dto.getGigan2());
			pstmt.setString(13, dto.getSchool2());
			pstmt.setString(14, dto.getJeongong2());
			pstmt.setString(15, dto.getGigan3());
			pstmt.setString(16, dto.getSchool3());
			pstmt.setString(17, dto.getJeongong3());
			pstmt.setString(18, dto.getGigan4());
			pstmt.setString(19, dto.getSchool4());
			pstmt.setString(20, dto.getJeongong4());
			pstmt.setInt(21, dto.getNo());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int setDelete(int no) {
		getConn();
		int result=0;
		try {
			String sql = "delete from resume where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			result= pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
}
