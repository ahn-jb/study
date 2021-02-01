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
			String sql = "insert into member2 values(seq_member.nextval,?,?,?,?,?,4,0,?,?,?,?,?,sysdate)";
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
			getClass();
		}
		return result;
	}
	
	public int getSelectId(String id) {
		getConn();
		int result =0;
		try {
			String sql="select count(*) from member2 where id=?";
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
	public MemberDTO getSelectOneNo(int no) {//no으로 찾는  회원 정보
		getConn();
		MemberDTO dto = new MemberDTO();
		try {
			String sql = "select * from member2 where no =?";
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
	
	public int getTotalRecord() {
		getConn();
		int count = 0;
		try {
			String sql="select count(*) from member2";
			
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<MemberDTO> getSelectMember(int startRecord,int lastRecord){//가입된 모든 회원정보 
		getConn();
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			String basicSql ="";
			basicSql += "select * from member2 where no > 0 order by no asc";
			String sql = "";
			sql += "select * from (select A.*, Rownum Rnum from ("+basicSql+") A) where Rnum >=? and Rnum<=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRecord);
			pstmt.setInt(2, lastRecord);
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
	
	public int update(MemberDTO dto) {//회원정보 수정
		getConn();
		int result=0;
		try {
			String sql = "update member2 set pw=?, grade=?, name=?,"
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
		}
		
		return result;
	}
}
