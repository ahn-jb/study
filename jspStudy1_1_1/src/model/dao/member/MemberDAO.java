package model.dao.member;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DbExample;
import model.dto.member.MemberDTO;


public class MemberDAO {
	Connection conn= DbExample.dbConn();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
//	public void getConn() {//DB접속
//		try {
//			String driver ="oracle.jdbc.driver.OracleDriver";
//			String dbUrl ="jdbc:oracle:thin:@localhost:1521/xe";
//			String dbId = "jspStudy";
//			String dbPasswd = "1234";
//			
//			Class.forName(driver);
//			conn = DriverManager.getConnection(dbUrl,dbId,dbPasswd);
//			System.out.println("--오라클 접속 성공--");
//			
//			}catch(Exception e) {
//				System.out.println("--오라클 접속 실패--");
//				e.printStackTrace();
//			}
//	}
//
//	public void getConnClose() {
//		
//		try {
//			if(rs!=null) {rs.close();}
//			if(pstmt!=null) {pstmt.close();}
//			if(conn!=null) {conn.close();}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
	public int setInsert(MemberDTO dto) {//회원 정보 입력
		int result =0;
		try {
			String sql = "insert into member values(seq_member.nextval,?,?,?,?,?,4,0,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPw());
			pstmt.setString(3,dto.getName());
			pstmt.setString(4,dto.getGender());
			pstmt.setInt(5, dto.getBornYear());
			pstmt.setString(6,dto.getPostNum() );
			pstmt.setString(7,dto.getStreet_addr() );
			pstmt.setString(8,dto.getParcel_addr() );
			pstmt.setString(9,dto.getDetail_addr() );
			pstmt.setString(10,dto.getReference() );
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public ArrayList<MemberDTO> getSelectAll(){//가입된 모든 회원정보 
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
				dto.setPostNum(rs.getString("postNum"));
				dto.setStreet_addr(rs.getString("street_addr"));
				dto.setParcel_addr(rs.getString("parcel_addr"));
				dto.setDetail_addr(rs.getString("detail_addr"));
				dto.setReference(rs.getString("reference"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public MemberDTO getSelectOneNo(int no) {//no으로 찾는  회원 정보
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
				dto.setPostNum(rs.getString("postNum"));
				dto.setStreet_addr(rs.getString("street_addr"));
				dto.setParcel_addr(rs.getString("parcel_addr"));
				dto.setDetail_addr(rs.getString("detail_addr"));
				dto.setReference(rs.getString("reference"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int getSelectId(String id) {
		int result =0;
		try {
			String sql="select count(*) from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public MemberDTO getSelectOneId(String id) {//id로 찾는 회원 정보
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
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setBornYear(rs.getInt("bornYear"));
				dto.setGrade(rs.getInt("grade"));
				dto.setLoginCounter(rs.getInt("loginCounter"));
				dto.setRegidate(rs.getTimestamp("regidate"));
				dto.setPostNum(rs.getString("postNum"));
				dto.setStreet_addr(rs.getString("street_addr"));
				dto.setParcel_addr(rs.getString("parcel_addr"));
				dto.setDetail_addr(rs.getString("detail_addr"));
				dto.setReference(rs.getString("reference"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public MemberDTO Login(MemberDTO dto) {//로그인 		
		MemberDTO resultDTO = new MemberDTO();
		try {
			String sql = "select*from member where id=? and pw=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultDTO.setNo(rs.getInt("no"));
				resultDTO.setId(rs.getString("id"));
				resultDTO.setName(rs.getString("name"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultDTO;
	}
	
	public void loginCounterfail(MemberDTO dto) {//로그인 실패 카운트
		try {
			String sql = "update member set loginCounter=(loginCounter+1) where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DbExample.dbConnClose(rs, pstmt, conn);
		}
	}
	
	public void loginCounterSucsess(MemberDTO dto) {//로그인 성공시 카운트 리셋
		
		try {
			String sql = "update member set loginCounter=0 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DbExample.dbConnClose(rs, pstmt, conn);
		}
	}
	
	public int update(MemberDTO dto) {//회원정보 수정
		int result=0;
		try {
			String sql = "update member set pw=?, grade=?, name=?,"
					+ "postNum=?, street_addr=?, parcel_addr=?, detail_addr=?, reference=? where id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setInt(2, dto.getGrade());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4,dto.getPostNum());
			pstmt.setString(5,dto.getStreet_addr());
			pstmt.setString(6,dto.getParcel_addr());
			pstmt.setString(7,dto.getDetail_addr());
			pstmt.setString(8,dto.getReference());
			pstmt.setString(9, dto.getId());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int delete(int no) {//회원정보 삭제
		int result = 0;
		try {
			String sql = "delete from member where no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		
		return result;
	}
	
	///////  ask & answer
	
	public int setInsertAsk(MemberDTO dto) {//상담 내용 입력
//		getConn();
		int result = 0;
		try {
			String sql = "insert into ask values(seq_ask.nextval,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId() );
			pstmt.setString(2,dto.getBunryu() );
			pstmt.setString(3,dto.getSubject() );
			pstmt.setString(4,dto.getContent() );
			pstmt.setString(5,"X" );
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
//			getConnClose();
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public ArrayList<MemberDTO> getSelectAsk(String id) {//id를 통한 상담 내용 불러오기
//		getConn();
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			String sql = "select*from ask where id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setBunryu(rs.getString("bunryu"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegidate(rs.getTimestamp("regidate"));
				dto.setAnswer(rs.getString("answer"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
//			getConnClose();
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public MemberDTO getSelectAsk(int no) {//no를 통한 상담 내용 불러오기
//		getConn();
		MemberDTO dto = new MemberDTO();
		try {
			String sql = "select*from ask where no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setBunryu(rs.getString("bunryu"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegidate(rs.getTimestamp("regidate"));
				dto.setAnswer(rs.getString("answer"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
//			getConnClose();
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public ArrayList<MemberDTO> getSelectAllAsk(){//모든 상담 내용 불러오기
//		getConn();
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			String sql ="select*from ask order by no asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setBunryu(rs.getString("bunryu"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegidate(rs.getTimestamp("regidate"));
				dto.setAnswer(rs.getString("answer"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
//			getConnClose();
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public int setDeleteAsk(int no) {
//		getConn();
		int result =0;
		try {
			String sql ="Delete from ask where no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
//			getConnClose();
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int setInsertAnswer(MemberDTO dto) {//답변 입력
//		getConn();
		int result=0;
		
		try {
			String sql2 = "update ask set answer= 'O' where no =?";
			pstmt = conn.prepareCall(sql2);
			pstmt.setInt(1, dto.getNo());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		try {
			String sql = "insert into answer values(?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			pstmt.setString(2,dto.getId());
			pstmt.setString(3,dto.getRank());
			pstmt.setString(4,dto.getSubject() );
			pstmt.setString(5,dto.getContent() );
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
//			getConnClose();
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public MemberDTO getSelectAnswer(int no) {
//		getConn();
		MemberDTO dto = new MemberDTO();
		try {
			String sql = "select *from answer where no=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setRank(rs.getString("rank"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegidate(rs.getTimestamp("regidate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
//			getConnClose();
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setUpdateAnswer(MemberDTO dto) {
//		getConn();
		int result = 0;
		try {
			String sql = "update answer set subject= ?, content=? where no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setInt(3, dto.getNo());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
//			getConnClose();
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDeleteAnswer(int no) {
//		getConn();
		int result=0;
		
		try {
			String sql2="update ask set answer= 'X' where no=? ";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		try {
			String sql = "delete from answer where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result= pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
//			getConnClose();
			DbExample.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
