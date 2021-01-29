package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConn() {	
		try {
		String driver ="oracle.jdbc.driver.OracleDriver";
		String dbUrl ="jdbc:oracle:thin:@localhost:1521/xe";
		String dbId = "jspMvc1";
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
	
	
	
	public int setInsert(BoardDTO dto) {
		getConn();
		int result=0;
		try {
			String sql ="insert into board values(seq_board1.nextval,?,?,?,?,?,?,?,?,?,?,to_char(sysdate,'yyyy-mm-dd'),?)";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1,dto.getNum());
			pstmt.setString(2,dto.getWriter());
			pstmt.setString(3,dto.getSubject());
			pstmt.setString(4,dto.getContent());
			pstmt.setString(5,dto.getEmail());
			pstmt.setString(6,dto.getPasswd());
			pstmt.setInt(7,dto.getRefNo());
			pstmt.setInt(8,dto.getStepNo());
			pstmt.setInt(9,dto.getLevelNo());
			pstmt.setInt(10,dto.getHit());
			pstmt.setInt(11,dto.getService());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
		
	}
	
	public int getMaxNum() {
		int num=0;
		getConn();
		try {
			String sql = "select nvl(max(num),0)  from board";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return num;
	}
	public int getMaxRefNo() {
		int num=0;
		getConn();
		try {
			String sql = "select nvl(max(refNo),0)  from board";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return num;
	}
	
	
	public ArrayList<BoardDTO> getSelectAll(){
		ArrayList<BoardDTO> arrayList = new ArrayList<BoardDTO>();
		getConn();
		try {
			String sql = "select*from board order by refNo desc, levelNo asc ";
			pstmt= conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setService(rs.getInt("service"));
				arrayList.add(dto);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return arrayList;
	}
	
	public BoardDTO getSelectOne(int no) {
		BoardDTO dto = new BoardDTO();
		getConn();
		try {
			String sql = "select*from board where no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setService(rs.getInt("service"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void setUpdateHit(int no) {
		getConn();
		try {
			String sql = "update board set hit = (hit+1) where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}
	
	public int setUpdate(BoardDTO dto) {
		int result=0;
		getConn();
		try {
			String sql = "update board set subject=?,content =?,email =? where no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getEmail());
			pstmt.setInt(4, dto.getNo());
			result = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int Delete(int no) {
		int result=0;
		getConn();
		
		try {
			String sql = "update board set service=? where no=? ";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, no);
			result=pstmt.executeUpdate();
		}catch(Exception e ){
			e.printStackTrace();
			
		}
		return result;
	}
	
	public void setUpdateReLevel(BoardDTO dto) {
		getConn();
		
		try {
			String sql= "update board set levelNo=(levelNo+1) where refNo=? and levelNo >? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getRefNo());
			pstmt.setInt(2, dto.getLevelNo());
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		 
	}
	
	public ArrayList<BoardDTO> search(String search,String bunryu) {
		getConn();
		System.out.println(bunryu);
		ArrayList<BoardDTO> arrayList = new ArrayList<BoardDTO>();
		
		try {
			String sql="select*from board where service > 0 and "+bunryu+" like '%"+search+"%' order by refNo desc, levelNo asc ";
			System.out.println(sql);
			pstmt= conn.prepareStatement(sql);
//			pstmt.setString(1, bunryu);
//			pstmt.setString(1, '%' + search+'%');
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setRegiDate(rs.getDate("regiDate"));
				arrayList.add(dto);
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return arrayList;
	}
	public ArrayList<BoardDTO> search(String search) {
		getConn();
//		System.out.println(bunryu);
		ArrayList<BoardDTO> arrayList = new ArrayList<BoardDTO>();
		
		try {
			String sql="select*from board where service > 0 and subject like '%"+search+"%' or service > 0 and content like '%"+search+"%'  order by refNo desc, levelNo asc ";
			System.out.println(sql);
			pstmt= conn.prepareStatement(sql);
//			pstmt.setString(1, bunryu);
//			pstmt.setString(1, '%' + search+'%');
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setRegiDate(rs.getDate("regiDate"));
				arrayList.add(dto);
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return arrayList;
	}
	
	
	
	
	
}
