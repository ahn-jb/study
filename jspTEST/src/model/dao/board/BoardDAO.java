package model.dao.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.dto.board.BoardDTO;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	String tableName01 = "board";
	String tableName02 = "board_comment";
	
	public void getConn() {
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String dbId = "jspTEST";
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

	public int setInsert(BoardDTO dto) {
		getConn();
		int result = 0;
		try {
			String sql = "insert into board values(seq_board.nextval," 
					+ "?,?,?,?,"
					+ "sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getConnClose();
		}
		return result;

	}

//	public int getMaxNum() {
//		getConn();
//		int num = 0;
//		try {
//			String sql = "select nvl(max(num),0)  from board";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				num = rs.getInt(1);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			getConnClose();
//		}
//		return num;
//	}
//
//	public int getMaxRefNo() {
//		getConn();
//		int num = 0;
//		try {
//			String sql = "select nvl(max(refNo),0)  from board";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				num = rs.getInt(1);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			getConnClose();
//		}
//		return num;
//	}
//
//	public void setUpdateHit(int no) {
//		getConn();
//		try {
//			String sql = "update board set hit = (hit+1) where no=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, no);
//			pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public int getMaxNoticeNo(String tbl) {
//		getConn();
//		int result = 0;
//		try {
//			String sql = "select nvl(max(noticeNo),0) from board  ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, tbl);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				result = rs.getInt(1);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
//	
//	public void setUpdateReLevel(BoardDTO dto) {
//		getConn();
//
//		try {
//			String sql = "update board set levelNo=(levelNo+1) where refNo=? and levelNo >? ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, dto.getRefNo());
//			pstmt.setInt(2, dto.getLevelNo());
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			getConnClose();
//		}
//
//	}
	
	public ArrayList<BoardDTO> getSelectAll() {
		getConn();
		ArrayList<BoardDTO> arrayList = new ArrayList<BoardDTO>();
		try {
			String sql = "select*from board order by no desc ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRegidate(rs.getDate("regidate"));
				arrayList.add(dto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getConnClose();
		}

		return arrayList;
	}
	
	public BoardDTO getSelectOne(int no) {
		getConn();
		BoardDTO dto = new BoardDTO();
		try {
			String sql = "select*from board where no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRegidate(rs.getDate("regidate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}	

	public int setUpdate(BoardDTO dto) {//수정하기
		getConn();
		int result = 0;
		try {
			String sql = "update board set writer=?, subject=?, content=?, passwd=? where no =?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getNo());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getConnClose();
		}
		return result;
	}

	public int Delete(int no) {//삭제하기
		getConn();
		int result = 0;
		try {
			String sql = "delete from board where no=? ";
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, 0);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			getConnClose();
		}
		return result;
	}

	public ArrayList<BoardDTO> search(int startRow, int endRow,String search_data, String search_option) {
		getConn();
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			String sql1 = "select*from " 
					+ " (select ROWNUM rn,bb.* from"
					+ " (select * from board ";
			String sql= "";
			if(search_option == null || search_option =="") {
				sql = sql1 
						+ " order by no desc) bb)"
						+ " where rn between ? and ?";
			}else if(search_option.equals("subject") || search_option.equals("content") || search_option.equals("writer")) {
				sql = sql1 
						+ " where " + search_option +" like '%" + search_data + "%'  order by no desc) bb)"
						+ " where rn between ? and ?";
			}else if(search_option.equals("writer_subject_content")) {
				sql = sql1 
						+ " where (subject like '%"+ search_data + "%' or content like '%" + search_data + "%' or writer like '%"+ search_data +"%')"
						+ " order by no desc) bb)"
						+ " where rn between ? and ? ";
			}else {
				sql = sql1 
						+ " order by no desc) bb)"
						+ " where rn between ? and ?";
			}
//			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRegidate(rs.getDate("regidate"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public int getCount(String bunryu ,String search) {
		getConn();
		int count = 0;
		try {
			String sql1 = "select count(*) from board ";
			String sql="";
			if(bunryu == null || bunryu =="") {
				sql = sql1;
			}else if(bunryu.equals("subject") || bunryu.equals("content") || bunryu.equals("writer")) {
				sql = sql1 +  " where " + bunryu + " like '%" + search + "%'";
			}else if(bunryu.equals("writer_subject_content")) {
				sql = sql1 + " where (subject like '%" + search + "%' or content like '%" + search +"%' or writer like '%"+ search +"%')";
			}else {
				sql = sql1;
			}
//			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}
	// Comment
	
	

	

}
