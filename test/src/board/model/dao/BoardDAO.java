package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import db.DbExample;
import board.model.dto.BoardCommentDTO;
import board.model.dto.BoardDTO;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//Util util = new Util();

	String tableName01 = "board";
	String tableName02 = "board_comment";
	
	public Connection getConn() {
		conn = DbExample.dbConn();
		return conn;
	}
	
	public void getConnClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		DbExample.dbConnClose(rs, pstmt, conn);
	}
	
	public int getMaxNum() {
		int result = 0;
		conn = getConn();
		try {
			String sql = "select nvl(max(num), 0) from " + tableName01;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int getMaxRefNo() {
		int result = 0;
		conn = getConn();
		try {
			String sql = "select nvl(max(refNo), 0) from " + tableName01;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int getMaxNoticeNo(String tbl) {
		int result = 0;
		conn = getConn();
		try {
			String sql = "select nvl(max(noticeNo), 0) from " + tableName01 + " where tbl = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tbl);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int getTotalRecord(String tbl, String search_option, String search_data) {
		int result = 0;
		conn = getConn();
		try {
			String sql = "select count(*) from " + tableName01 + " where tbl = ? ";
			
			if (search_option.length() > 0 && search_data.length() > 0) {
				if (search_option.equals("writer") || search_option.equals("subject") || search_option.equals("content")) {
					sql += " and " + search_option + " like ? ";
				} else if (search_option.equals("writer_subject_content")) {
					sql += " and (writer like ? or subject like ? or content like ?) ";
				}
			}
						
			int k = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++k, tbl);
			
			if (search_option.length() > 0 && search_data.length() > 0) {
				if (search_option.equals("writer") || search_option.equals("subject") || search_option.equals("content")) {
					pstmt.setString(++k, '%' + search_data + '%');
				} else if (search_option.equals("writer_subject_content")) {
					pstmt.setString(++k, '%' + search_data + '%');
					pstmt.setString(++k, '%' + search_data + '%');
					pstmt.setString(++k, '%' + search_data + '%');
				}
			}
				
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}

		return result;
	}
	
	public ArrayList<BoardDTO> getList(int startRecord, int lastRecord, String tbl, String search_option, String search_data) {
		ArrayList<BoardDTO> list = new ArrayList<>();
		conn = getConn();
		try {
			String basicSql = "";
			basicSql += "select t1.*, ";
			basicSql += "(select count(*) from " + tableName01 + " t2 where t2.parentNo = t1.no) child_counter ";
			basicSql += "from " + tableName01 + " t1 where tbl = ? ";
			
			if (search_option.length() > 0 && search_data.length() > 0) {
				if (search_option.equals("writer") || search_option.equals("subject") || search_option.equals("content")) {
					basicSql += " and " + search_option + " like ? ";
				} else if (search_option.equals("writer_subject_content")) {
					basicSql += " and (writer like ? or subject like ? or content like ?) ";
				}
			}
			
			basicSql += "order by noticeNo desc, refNo desc, levelNo asc";

			String sql = "";
			sql += "select * from (select A.*, Rownum Rnum from (" + basicSql + ") A) ";
			sql += "where Rnum >= ? and Rnum <= ?";

			int k = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++k, tbl);
			
			if (search_option.length() > 0 && search_data.length() > 0) {
				if (search_option.equals("writer") || search_option.equals("subject") || search_option.equals("content")) {
					pstmt.setString(++k, '%' + search_data + '%');
				} else if (search_option.equals("writer_subject_content")) {
					pstmt.setString(++k, '%' + search_data + '%');
					pstmt.setString(++k, '%' + search_data + '%');
					pstmt.setString(++k, '%' + search_data + '%');
				}
			}
			
			pstmt.setInt(++k, startRecord);
			pstmt.setInt(++k, lastRecord);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setTbl(rs.getString("tbl"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setParentNo(rs.getInt("parentNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setIp(rs.getString("ip"));
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setSecretGubun(rs.getString("secretGubun"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setChild_counter(rs.getInt("child_counter"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public BoardDTO getView(int no, String search_option, String search_data) {
		BoardDTO dto = new BoardDTO();
		conn = getConn();

		try {
			String sql = "";
			sql += "select * from ";
			sql += "(";
			sql += "select b.*, ";
			sql += "(select count(*) from " + tableName01 + " where refNo = b.refNo and stepNo = (b.stepNo + 1) and levelNo = (b.levelNo + 1)) child_counter, ";
			sql += "LAG(no) OVER (ORDER BY noticeNo desc, refNo desc, levelNo asc) preNo, ";
			sql += "LAG(subject) OVER (ORDER BY noticeNo desc, refNo desc, levelNo asc) preSubject, ";
			sql += "LEAD(no) OVER (ORDER BY noticeNo desc, refNo desc, levelNo asc) nxtNo, ";
			sql += "LEAD(subject) OVER (ORDER BY noticeNo desc, refNo desc, levelNo asc) nxtSubject ";
			sql += "from " + tableName01 + " b ";
			
			sql += "where 1=1 ";
			if (search_option.length() > 0 && search_data.length() > 0) {
				if (search_option.equals("writer") || search_option.equals("subject") || search_option.equals("content")) {
					sql += " and " + search_option + " like ? ";
				} else if (search_option.equals("writer_subject_content")) {
					sql += " and (writer like ? or subject like ? or content like ?) ";
				}
			}
			
			sql += "order by noticeNo desc, refNo desc, levelNo asc";
			sql += ") where no = ? ";
			
			
			int k = 0;
			pstmt = conn.prepareStatement(sql);
			
			if (search_option.length() > 0 && search_data.length() > 0) {
				if (search_option.equals("writer") || search_option.equals("subject") || search_option.equals("content")) {
					pstmt.setString(++k, '%' + search_data + '%');
				} else if (search_option.equals("writer_subject_content")) {
					pstmt.setString(++k, '%' + search_data + '%');
					pstmt.setString(++k, '%' + search_data + '%');
					pstmt.setString(++k, '%' + search_data + '%');
				}
			}
			pstmt.setInt(++k, no);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setTbl(rs.getString("tbl"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setParentNo(rs.getInt("parentNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setIp(rs.getString("ip"));
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setSecretGubun(rs.getString("secretGubun"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				dto.setChild_counter(rs.getInt("child_counter"));
				
				dto.setPreNo(rs.getInt("preNo"));
				dto.setPreSubject(rs.getString("preSubject"));
				dto.setNxtNo(rs.getInt("nxtNo"));
				dto.setNxtSubject(rs.getString("nxtSubject"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(BoardDTO dto) {
		int result = 0;
		conn = getConn();
		try {
			String sql = "insert into " + tableName01 + " values (seq_board.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getTbl());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getPasswd());
			pstmt.setInt(8, dto.getRefNo());
			pstmt.setInt(9, dto.getStepNo());
			pstmt.setInt(10, dto.getLevelNo());
			pstmt.setInt(11, dto.getParentNo());
			pstmt.setInt(12, dto.getHit());
			pstmt.setString(13, dto.getIp());
			pstmt.setInt(14, dto.getMemberNo());
			pstmt.setInt(15, dto.getNoticeNo());
			pstmt.setString(16, dto.getSecretGubun());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(BoardDTO dto) {
		int result = 0;
		conn = getConn();
		try {
			String sql = "";
			sql += "update " + tableName01 + " set subject = ?, content = ?, email = ? ";
			sql += " where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getEmail());
			pstmt.setInt(4, dto.getNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(BoardDTO dto) {
		int result = 0;
		conn = getConn();
		try {
			String sql = "delete from " + tableName01 + " where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public void setUpdateReLevel(BoardDTO dto) {
		conn = getConn();
		try {
			String sql = "update " + tableName01 + " set levelNo = (levelNo + 1) where refNo = ? and levelNo > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getRefNo());
			pstmt.setInt(2, dto.getLevelNo());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
	}
	
	public void setUpdatHit(int no) {
		conn = getConn();
		try {
		     String sql = "update " + tableName01 + " set hit = (hit + 1) where no = ?";
		     pstmt = conn.prepareStatement(sql);
		     pstmt.setInt(1, no);
		     pstmt.executeUpdate();
		} catch(Exception e) {
		     e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
	}
	
	public int getTotalRecordComment(int no) {
		int result = 0;
		conn = getConn();
		try {
			String sql = "select count(*) from " + tableName02 + " where board_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}

		return result;
	}
	
	public ArrayList<BoardCommentDTO> getListComment(int startRecord, int lastRecord, int no) {
		ArrayList<BoardCommentDTO> list = new ArrayList<>();
		conn = getConn();
		try {
			String basicSql = "";
			basicSql += "select * ";
			basicSql += "from " + tableName02 + " where board_no = ? ";
			basicSql += "order by comment_no desc";

			String sql = "";
			sql += "select * from (select A.*, Rownum Rnum from (" + basicSql + ") A) ";
			sql += "where Rnum >= ? and Rnum <= ?";

			int k = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(++k, no);
			pstmt.setInt(++k, startRecord);
			pstmt.setInt(++k, lastRecord);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardCommentDTO commentDto = new BoardCommentDTO();
				commentDto.setComment_no(rs.getInt("comment_no"));
				commentDto.setBoard_no(rs.getInt("board_no"));
				commentDto.setWriter(rs.getString("writer"));
				commentDto.setContent(rs.getString("content"));
				commentDto.setPasswd(rs.getString("passwd"));
				commentDto.setMemberNo(rs.getInt("memberNo"));
				commentDto.setIp(rs.getString("ip"));
				commentDto.setRegiDate(rs.getDate("regiDate"));
				list.add(commentDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public int setInsertComment(BoardCommentDTO dto) {
		int result = 0;
		conn = getConn();
		try {
			String sql = "insert into " + tableName02 + " values (seq_board_comment.nextval,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoard_no());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getMemberNo());
			pstmt.setString(6, dto.getIp());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
