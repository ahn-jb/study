package member;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;





public class MemberDAO {
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConn() {//DB접속
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
	public int setInsert(MemberDTO dto) {//회원 정보 입력
		getConn();
		int result =0;
		try {
			String sql = "insert into member values(?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPasswd());
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
	
	public ArrayList<MemberDTO> getSelectAll(){//가입된 모든 회원정보 
		getConn();
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			String sql = "select *from member order by no asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("pw"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return list;
	}
	
	public MemberDTO getSelectOne(String id) {//no으로 찾는  회원 정보
		getConn();
		MemberDTO dto = new MemberDTO();
		try {
			String sql = "select * from member where id = ?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setChangeDate(rs.getDate("changeDate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return dto;
	}
	
	public int Login(MemberDTO dto) {//로그인 
		getConn();
		
		int result = 0;
		try {
			String sql = "select*from member where id=? and passwd = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPasswd());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
	
	public int update(MemberDTO dto) {//회원정보 수정
		getConn();
		int result=0;
		try {
			String sql = "update member set passwd=?, changedate=sysdate where id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getId());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		
		return result;
	}
}
