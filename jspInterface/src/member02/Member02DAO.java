package member02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import db.Db;
import db.DbmysqlImpl;
import member.MemberDTO;




public class Member02DAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConn() {
		Db d1 = new DbmysqlImpl();
		conn=d1.dbConn();
//		try {
//			String driver ="com.mysql.jdbc.Driver";
//			String dbUrl ="jdbc:mysql://localhost:3306/jspInterface";
//			String dbId = "jspInterface";
//			String dbPasswd = "1234";
//			
//			Class.forName(driver);
//			conn = DriverManager.getConnection(dbUrl,dbId,dbPasswd);
//			System.out.println("--Mysql 접속 성공--");
//			
//			}catch(Exception e) {
//				System.out.println("--Mysql 접속 실패--");
//				e.printStackTrace();
//			}
	
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
	
	public int setInsert(Member02DTO dto) {
		getConn();
		int result=0;
		Timestamp wdate = new Timestamp(System.currentTimeMillis());
		dto.setWdate(wdate);

		try {
			String sql ="insert into member values((select nvl(max(no),0)+1 from member n),?,?,?,?,?,?,?,?,?)";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getSid());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getGender());
			pstmt.setInt(8, dto.getAge());
			pstmt.setTimestamp(9,wdate);
			
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
		
	}
	
	public ArrayList<Member02DTO> getSelectAll(){
		getConn();
		ArrayList<Member02DTO> arrayList = new ArrayList<Member02DTO>();
		
		try {
			String sql = "select*from member order by no asc";
			pstmt= conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				
				Member02DTO dto = new Member02DTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setSid(rs.getString("sid"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setAge(rs.getInt("age"));
				dto.setWdate(rs.getTimestamp("wdate"));
				arrayList.add(dto);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return arrayList;
	}
	
	public Member02DTO getSelectOne(String id) {
		Member02DTO dto = new Member02DTO();
		getConn();
		try {
			String sql = "select*from member where id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setSid(rs.getString("sid"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setAge(rs.getInt("age"));
				dto.setWdate(rs.getTimestamp("wdate"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int getUpdate(Member02DTO dto) {
		getConn();
		int result = 0;
		try {
			String sql = "update member set passwd=?, name=?, phone=?, email=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,dto.getPassword());
			pstmt.setString(2,dto.getName());
			pstmt.setString(3,dto.getPhone());
			pstmt.setString(4,dto.getEmail());
			pstmt.setString(5,dto.getId());
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public int getDelete(String id,int no) {
		getConn();
		int result = 0;
		try {
			String sql ="delete from member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			result=pstmt.executeUpdate();
			
			String sql1 = "update member set no=(no-1) where no >?";
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
