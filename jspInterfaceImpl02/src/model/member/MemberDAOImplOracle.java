package model.member;

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
	public void getConn() {
		try {
			String driver ="oracle.jdbc.driver.OracleDriver";
			String dbUrl ="jdbc:oracle:thin:@localhost:1521/xe";
			String dbId = "jspInterfaceImpl02";
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
	public int setInsert(MemberDTO dto) {
		int result =0;
		getConn();
		try {
			String sql = "insert into member values(seq_member.nextval,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPwd());
			pstmt.setString(3,dto.getName());
			pstmt.setString(4,dto.getPhone());
			pstmt.setString(5,dto.getJob());
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
	
	public ArrayList<MemberDTO> getSelectAll() {
		getConn();
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			String sql = "select *from member ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setJob(rs.getString("job"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public MemberDTO getSelectOne(String id) {
		getConn();
		MemberDTO dto = new MemberDTO();
		try {
			String sql = "select * from member where id =?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setJob(rs.getString("job"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int getUpdate(MemberDTO dto) {
		getConn();
		int result=0;
		try {
			String sql = "update member set pwd=?,name=?,phone=?,job=? where id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getPwd());
			pstmt.setString(2,dto.getName());
			pstmt.setString(3,dto.getPhone());
			pstmt.setString(4,dto.getJob());
			pstmt.setString(5,dto.getId());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int Delete(String id) {
		getConn();
		int result=0;
		try {
			String sql = "delete from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
