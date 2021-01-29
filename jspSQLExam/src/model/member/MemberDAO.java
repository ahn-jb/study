package model.member;


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
			String dbId = "jspSQLExam";
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
			String sql = "insert into member values(seq_member.nextval,?,?,?,?,?,4,0,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPw());
			pstmt.setString(3,dto.getName());
			pstmt.setString(4,dto.getGender());
			pstmt.setInt(5, dto.getBornYear());
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
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setBornYear(rs.getInt("bornYear"));
				dto.setGrade(rs.getInt("grade"));
				dto.setLoginCounter(rs.getInt("loginCounter"));
				dto.setRegidate(rs.getTimestamp("regidate"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return list;
	}
	
	
	public MemberDTO getSelectOne(int no) {//선택한 회원 정보
		getConn();
		MemberDTO dto = new MemberDTO();
		try {
			String sql = "select * from member where no =?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setBornYear(rs.getInt("bornYear"));
				dto.setGrade(rs.getInt("grade"));
				dto.setLoginCounter(rs.getInt("loginCounter"));
				dto.setRegidate(rs.getTimestamp("regidate"));
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
			String sql = "select*from member where id=? and pw=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPw());
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
	
	public void loginCounterfail(MemberDTO dto) {//로그인 실패 카운트
		getConn();
		try {
			String sql = "update member set loginCounter=(loginCounter+1) where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void loginCounterSucsess(MemberDTO dto) {//로그인 성공시 카운트 리셋
		getConn();
		
		try {
			String sql = "update member set loginCounter=0 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
	}
	
	public int update(MemberDTO dto) {//회원정보 수정
		getConn();
		int result=0;
		try {
			String sql = "update member set  pw=?, grade=?,  name=?  where id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setInt(2, dto.getGrade());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getId());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		
		return result;
	}
	
	public int delete(int no) {//회원정보 삭제
		getConn();
		int result = 0;
		try {
			String sql = "delete from member where no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		
		return result;
	}
	
}
