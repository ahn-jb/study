package etc.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAOImplOracle implements MemberDAO {
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	@Override
	public void getConn() {//Oracle 접속
		try {
			String driver ="oracle.jdbc.driver.OracleDriver";
			String dbUrl ="jdbc:oracle:thin:@localhost:1521/xe";
			String dbId = "jspModel1";
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

	@Override
	public int setInsert(MemberDTO dto) {//회원 정보 입력
		int result =0;
		getConn();
		try {
			String sql = "insert into member values(seq_member.nextval,?,?,?,?,?,?,?,?,?,?,?,0,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPw());
			pstmt.setString(3,dto.getName());
			pstmt.setString(4,dto.getNickname());
			pstmt.setString(5,dto.getEmail());
			pstmt.setString(6,dto.getPhone());
			pstmt.setString(7,dto.getAddress());
			pstmt.setString(8,dto.getGender());
			pstmt.setString(9,dto.getJob());
			pstmt.setString(10,dto.getGrade());
			pstmt.setString(11, dto.getIp());
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
	
	public ArrayList<MemberDTO> getSelectAll() {//가입된 회원 정보 출력
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
				dto.setNickname(rs.getString("nickname"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setGender(rs.getString("gender"));
				dto.setJob(rs.getString("job"));
				dto.setGrade(rs.getString("grade"));
				dto.setIp(rs.getString("ip"));
				dto.setLoginCounter(rs.getInt("loginCounter"));
				dto.setRegi_date(rs.getDate("regi_date"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int Login(MemberDTO dto) {
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
		}
		return result;
	}
	
	public void loginCounterfail(MemberDTO dto) {
		getConn();
		try {
			String sql = "update member set loginCounter=(loginCounter+1) where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
//			pstmt.setString(2,dto.getIp());	
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void loginCounterSucsess(MemberDTO dto) {
		getConn();
		
		try {
			String sql = "update member set loginCounter=0 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
//			pstmt.setString(2,dto.getIp());	
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberDTO getSelectOne(String id) {//선택한 회원 정보
		getConn();
		MemberDTO dto = new MemberDTO();
		try {
			String sql = "select * from member where id =?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setNickname(rs.getString("nickname"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setGender(rs.getString("gender"));
				dto.setJob(rs.getString("job"));
				dto.setGrade(rs.getString("grade"));
				dto.setIp(rs.getString("ip"));
				dto.setLoginCounter(rs.getInt("loginCounter"));
				dto.setRegi_date(rs.getDate("regi_date"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
//	
//	public int getUpdate(MemberDTO dto) {//선택한 회원 정보 수정
//		getConn();
//		int result=0;
//		try {
//			String sql = "update member set pwd=?,name=?,phone=?,job=? where id=? ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1,dto.getPwd());
//			pstmt.setString(2,dto.getName());
//			pstmt.setString(3,dto.getPhone());
//			pstmt.setString(4,dto.getJob());
//			pstmt.setString(5,dto.getId());
//			result = pstmt.executeUpdate();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
//	
//	public int Delete(String id) {//선택한 회원 정보 삭제
//		getConn();
//		int result=0;
//		try {
//			String sql = "delete from member where id=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//			result = pstmt.executeUpdate();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}

}

