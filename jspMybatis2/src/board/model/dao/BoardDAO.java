package board.model.dao;





import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board.model.dto.BoardDTO;
import sqlmap.MybatisManager;



public class BoardDAO {

	String tableName01 = "board";
	String tableName02 = "board_comment";

	public int setInsert(BoardDTO dto) {
//		getConn();
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("board.setInsert",map);
		session.commit();
		session.close();
//		int result = 0;
//		try {
//			String sql = "insert into board values(seq_board.nextval," 
//					+ "?,?,?,?,?,?"
//					+ ",?,?,?,?,?,"
//					+ "?,?,?,?,?,"
//					+ "sysdate)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, dto.getNum());
//			pstmt.setString(2, dto.getTbl());
//			pstmt.setString(3, dto.getWriter());
//			pstmt.setString(4, dto.getSubject());
//			pstmt.setString(5, dto.getContent());
//			pstmt.setString(6, dto.getEmail());
//			pstmt.setString(7, dto.getPasswd());
//			pstmt.setInt(8, dto.getRefNo());
//			pstmt.setInt(9, dto.getStepNo());
//			pstmt.setInt(10, dto.getLevelNo());
//			pstmt.setInt(11, dto.getP_no());
//			pstmt.setInt(12, dto.getHit());
//			pstmt.setString(13, dto.getIp());
//			pstmt.setInt(14, dto.getMemberNo());
//			pstmt.setInt(15, dto.getNoticeNo());
//			pstmt.setString(16, dto.getSecretGubun());
//			result = pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			getConnClose();
//		}
		return result;

	}

	public int getMaxNum() {
//		getConn();
		int num = 0;
		SqlSession session = MybatisManager.getInstance().openSession();
		num = session.selectOne("board.getMaxNum");
		session.close();
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
		return num;
	}

	public int getMaxRefNo() {
//		getConn();
		int num = 0;
		SqlSession session = MybatisManager.getInstance().openSession();
		num = session.selectOne("board.getMaxRefNo");
		session.close();
		
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
		return num;
	}

	public void setUpdateHit(int no) {
//		getConn();
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.update("board.setUpdateHit",no);
		session.commit();
		session.close();
//		try {
//			String sql = "update board set hit = (hit+1) where no=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, no);
//			pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
	
	public int getMaxNoticeNo(String tbl) {
//		getConn();
		int result = 0;
		SqlSession session = MybatisManager.getInstance().openSession();
		result = session.selectOne("board.getMaxNoticeNo",tbl);
		session.close();
//		try {
//			String sql = "select nvl(max(noticeNo),0) from board where tbl=? ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, tbl);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				result = rs.getInt(1);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return result;
	}
	
	public void setUpdateReLevel(BoardDTO dto) {
//		getConn();
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.update("board.setUpdateReLevel",map);
		session.commit();
		session.close();
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

	}
	
//	public ArrayList<BoardDTO> getSelectAll() {
//		getConn();
//		ArrayList<BoardDTO> arrayList = new ArrayList<BoardDTO>();
//		try {
//			String sql = "select*from board order by noticeNo desc, refNo desc, levelNo asc ";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				BoardDTO dto = new BoardDTO();
//				dto.setNo(rs.getInt("no"));
//				dto.setNum(rs.getInt("num"));
//				dto.setWriter(rs.getString("writer"));
//				dto.setSubject(rs.getString("subject"));
//				dto.setContent(rs.getString("content"));
//				dto.setEmail(rs.getString("email"));
//				dto.setPasswd(rs.getString("passwd"));
//				dto.setRefNo(rs.getInt("refNo"));
//				dto.setStepNo(rs.getInt("stepNo"));
//				dto.setLevelNo(rs.getInt("levelNo"));
//				dto.setP_no(rs.getInt("p_no"));
//				dto.setHit(rs.getInt("hit"));
//				dto.setRegiDate(rs.getDate("regiDate"));
//				arrayList.add(dto);
//
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			getConnClose();
//		}
//
//		return arrayList;
//	}
	
	public BoardDTO getSelectOne(int no) {
//		getConn();
		SqlSession session = MybatisManager.getInstance().openSession();
		BoardDTO dto = session.selectOne("board.getSelectOne",no);
		session.close();
//		BoardDTO dto = new BoardDTO();
//		try {
//			String sql = "select*from board where no=? ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1,no);
//			rs=pstmt.executeQuery();
//			if(rs.next()) {
//				dto.setNo(rs.getInt("no"));
//				dto.setNum(rs.getInt("num"));
//				dto.setTbl(rs.getString("tbl"));
//				dto.setWriter(rs.getString("writer"));
//				dto.setSubject(rs.getString("subject"));
//				dto.setContent(rs.getString("content"));
//				dto.setEmail(rs.getString("email"));
//				dto.setPasswd(rs.getString("passwd"));
//				dto.setRefNo(rs.getInt("refNo"));
//				dto.setStepNo(rs.getInt("stepNo"));
//				dto.setLevelNo(rs.getInt("levelNo"));
//				dto.setP_no(rs.getInt("p_no"));
//				dto.setHit(rs.getInt("hit"));
//				dto.setIp(rs.getString("ip"));
//				dto.setMemberNo(rs.getInt("memberNo"));
//				dto.setNoticeNo(rs.getInt("noticeNo"));
//				dto.setSecretGubun(rs.getString("secretGubun"));
//				dto.setRegiDate(rs.getDate("regiDate"));
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return dto;
	}
	
	public BoardDTO getView(int no,String tbl, String search_data , String search_option) {//상세보기 출력
//		getConn();
		Map<String,Object> map = new HashMap<>();
		map.put("no", no);
		map.put("tbl", tbl);
		map.put("search_option",search_option);
		map.put("search_data", search_data);
		SqlSession session = MybatisManager.getInstance().openSession();
		BoardDTO dto = session.selectOne("board.getView",map);
		session.close();
//		BoardDTO dto = new BoardDTO();
//		try {
//			String sql1 = " select*from(select b.*,"
//					+ "(select count(*) from board where refNo =b.refNo and stepNo = (b.stepNo+1) and levelNo =(b.levelNo+1))child_counter,"
//					+ " LAG(no) OVER (ORDER BY noticeNo desc, refNo desc, levelNo asc) preNo, "
//					+ " LAG(subject) OVER (ORDER BY noticeNo desc, refNo desc, levelNo asc)preSubject,"
//					+ " LEAD(no) OVER (ORDER BY noticeNo desc, refNo desc, levelNo asc) nextNo,"
//					+ " LEAD(subject) OVER (ORDER BY noticeNo desc, refNo desc, levelNO asc) nextSubject"
//					+ " from board b ";
//			String sql ="";
//			if(search_option == null || search_option =="") {
//				sql = sql1 +" order by refNo desc, levelNo asc ) where no =? ";
//			}else if(search_option.equals("subject") || search_option.equals("content") || search_option.equals("writer")) {
//				sql = sql1 +" where "+search_option+" like '%"+search_data+"%' order by refNo desc, levelNo asc ) where no =? ";
//			}else if(search_option.equals("writer_subject_content")) {
//				sql = sql1 + "where subject like '%"+search_data+"%'"
//						+ " or content like '%"+search_data+"%'  or writer like '%"+ search_data +"%' order by refNo desc, levelNo asc ) where no =? ";
//			}else {
//				sql = sql1 +" order by refNo desc, levelNo asc ) where no =? ";
//			}
//			System.out.println(sql);
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, no);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				dto.setNo(rs.getInt("no"));
//				dto.setNum(rs.getInt("num"));
//				dto.setTbl(rs.getString("tbl"));
//				dto.setWriter(rs.getString("writer"));
//				dto.setSubject(rs.getString("subject"));
//				dto.setContent(rs.getString("content"));
//				dto.setEmail(rs.getString("email"));
//				dto.setPasswd(rs.getString("passwd"));
//				dto.setRefNo(rs.getInt("refNo"));
//				dto.setStepNo(rs.getInt("stepNo"));
//				dto.setLevelNo(rs.getInt("levelNo"));
//				dto.setP_no(rs.getInt("p_no"));
//				dto.setHit(rs.getInt("hit"));
//				dto.setIp(rs.getString("ip"));
//				dto.setMemberNo(rs.getInt("memberNo"));
//				dto.setNoticeNo(rs.getInt("noticeNo"));
//				dto.setSecretGubun(rs.getString("secretGubun"));
//				dto.setRegiDate(rs.getDate("regiDate"));
//				dto.setChild_counter(rs.getInt("child_counter"));
//				dto.setPreNo(rs.getInt("preNo"));
//				dto.setPreSubject(rs.getString("preSubject"));
//				dto.setNextNo(rs.getInt("nextNo"));
//				dto.setNextSubject(rs.getString("nextSubject"));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			getConnClose();
//		}
		return dto;
	}

	public int setUpdate(BoardDTO dto) {//수정하기
//		getConn();
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result= session.update("board.setUpdate",map);
		session.commit();
		session.close();
//		int result = 0;
//		try {
//			String sql = "update board set writer=?, subject=?, content=?, email =?, passwd=?, noticeNo=?, secretGubun=? where no =?";
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setString(1, dto.getWriter());
//			pstmt.setString(2, dto.getSubject());
//			pstmt.setString(3, dto.getContent());
//			pstmt.setString(4, dto.getEmail());
//			pstmt.setString(5, dto.getPasswd());
//			pstmt.setInt(6, dto.getNoticeNo());
//			pstmt.setString(7, dto.getSecretGubun());
//			pstmt.setInt(8, dto.getNo());
//			result = pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			getConnClose();
//		}
		return result;
	}

	public int Delete(int no) {//삭제하기
//		getConn();
		SqlSession session = MybatisManager.getInstance().openSession();
		int result= session.delete("board.Delete",no);
		session.commit();
		session.close();
//		int result = 0;
//		try {
//			String sql = "delete from board where no=? ";
//			pstmt = conn.prepareStatement(sql);
////			pstmt.setInt(1, 0);
//			pstmt.setInt(1, no);
//			result = pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//
//		} finally {
//			getConnClose();
//		}
		return result;
	}

	public List<BoardDTO> search(int startRecord, int lastRecord,String tbl,String search_data, String search_option) {
//		getConn();
		Map<String,String> map = new HashMap<>();
		map.put("startRecord", startRecord+"");
		map.put("lastRecord", lastRecord+"");
		map.put("tbl", tbl);
		map.put("search_option",search_option);
		map.put("search_data", search_data);
		SqlSession session = MybatisManager.getInstance().openSession();
		List<BoardDTO> list = session.selectList("board.search",map);
		session.close();
//		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
//		try {
//			String sql1 = "select*from " 
//					+ " (select ROWNUM rn,bb.* from"
//					+ " (select b.*,(select count(*) from board where p_no=b.no) child_counter from "
//					+ " board b where tbl=? ";
//			String sql= "";
//			if(search_option == null || search_option =="") {
//				sql = sql1 
//						+ " order by noticeNo desc, refNo desc, levelNo asc) bb)"
//						+ " where rn between ? and ?";
//			}else if(search_option.equals("subject") || search_option.equals("content") || search_option.equals("writer")) {
//				sql = sql1 
//						+ " and " + search_option +" like '%" + search_data + "%'  order by noticeNo desc, refNo desc, levelNo asc) bb)"
//						+ " where rn between ? and ?";
//			}else if(search_option.equals("writer_subject_content")) {
//				sql = sql1 
//						+ " and (subject like '%"+ search_data + "%' or content like '%" + search_data + "%' or writer like '%"+ search_data +"%')"
//						+ " order by noticeNo desc, refNo desc, levelNo asc) bb)"
//						+ " where rn between ? and ? ";
//			}else {
//				sql = sql1 
//						+ " order by noticeNo desc, refNo desc, levelNo asc) bb)"
//						+ " where rn between ? and ?";
//			}
////			System.out.println(sql);
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1,tbl);
//			pstmt.setInt(2, startRecord);
//			pstmt.setInt(3, lastRecord);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				BoardDTO dto = new BoardDTO();
//				dto.setNo(rs.getInt("no"));
//				dto.setNum(rs.getInt("num"));
//				dto.setTbl(rs.getString("tbl"));
//				dto.setWriter(rs.getString("writer"));
//				dto.setSubject(rs.getString("subject"));
//				dto.setContent(rs.getString("content"));
//				dto.setEmail(rs.getString("email"));
//				dto.setPasswd(rs.getString("passwd"));
//				dto.setRefNo(rs.getInt("refNo"));
//				dto.setStepNo(rs.getInt("stepNo"));
//				dto.setLevelNo(rs.getInt("levelNo"));
//				dto.setP_no(rs.getInt("p_no"));
//				dto.setHit(rs.getInt("hit"));
//				dto.setIp(rs.getString("ip"));
//				dto.setMemberNo(rs.getInt("memberNo"));
//				dto.setNoticeNo(rs.getInt("noticeNo"));
//				dto.setSecretGubun(rs.getString("secretGubun"));
//				dto.setRegiDate(rs.getDate("regiDate"));
//				dto.setChild_counter(rs.getInt("child_counter"));
//				list.add(dto);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		return list;
	}

	public int getCount(String tbl,String search_option ,String search_data) {
//		getConn();
		Map<String,String> map = new HashMap<>();
		map.put("tbl", tbl);
		map.put("search_option", search_option);
		map.put("search_data", search_data);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.selectOne("board.getCount",map);
		session.close();
		return result;
//		int count = 0;
//		try {
//			String sql1 = "select count(*) from board where tbl =?";
//			String sql="";
//			if(bunryu == null || bunryu =="") {
//				sql = sql1;
//			}else if(bunryu.equals("subject") || bunryu.equals("content") || bunryu.equals("writer")) {
//				sql = sql1 +  " and " + bunryu + " like '%" + search + "%'";
//			}else if(bunryu.equals("writer_subject_content")) {
//				sql = sql1 + " and (subject like '%" + search + "%' or content like '%" + search +"%' or writer like '%"+ search +"%')";
//			}else {
//				sql = sql1;
//			}
////			System.out.println(sql);
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, tbl);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				count = rs.getInt(1);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

//		return count;
	}
	// Comment
	public int CommentInsert(BoardDTO dto) {
//		getConn();
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("board.CommentInsert",map);
		session.commit();
		session.close();
//		int result=0;
//		try {
//			String sql="insert into board_comment values (seq_board_comment.nextval,?,?,?,?,?,?,sysdate)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1,dto.getBoard_no());
//			pstmt.setString(2, dto.getComment_writer());
//			pstmt.setString(3, dto.getComment_content());
//			pstmt.setString(4, dto.getComment_passwd());
//			pstmt.setInt(5, dto.getMemberNo());
//			pstmt.setString(6, dto.getIp());
//			result = pstmt.executeUpdate();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return result;
	}
	
	public int getTotalRecord(int no) {
//		getConn();
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.selectOne("board.getTotalRecord",no);
		session.close();
		return result;
//		int count = 0;
//		try {
//			String sql="select count(*) from board_comment where board_no=?";	
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, no);
//			rs= pstmt.executeQuery();
//			if(rs.next()) {
//				count = rs.getInt(1);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return count;
	}
	
	public List<BoardDTO> getComment(int no,int startRecord,int lastRecord){
//		getConn();
		Map<String,Integer> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("lastRecord", lastRecord);
		map.put("no", no);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		List<BoardDTO> list = session.selectList("board.getComment",map);
		session.close();		
		return list;
//		ArrayList<BoardDTO> list = new ArrayList<>();
//		try{
//			String sql = "select*from "
//					+ "(select rownum rn,a.* from "
//					+ "(select * from board_comment where board_no=? order by comment_no desc) a)"
//					+ " where rn between ? and ? ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, no);
//			pstmt.setInt(2, startRecord);
//			pstmt.setInt(3, lastRecord);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				BoardDTO dto = new BoardDTO();
//				dto.setComment_no(rs.getInt("comment_no"));
//				dto.setBoard_no(rs.getInt("board_no"));
//				dto.setComment_writer(rs.getString("comment_writer"));
//				dto.setComment_content(rs.getString("comment_content"));
//				dto.setComment_passwd(rs.getString("comment_passwd"));
//				dto.setMemberNo(rs.getInt("memberNo"));
//				dto.setIp(rs.getString("ip"));
//				dto.setRegiDate(rs.getDate("regiDate"));
//				list.add(dto);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return list;
	}
	
	public int tblchk(String temp) {
//		getConn();
		int result_tbl=0;
		if(temp == null) {
			temp = "";
		}else {
			temp = temp.trim();
		}

		SqlSession session = MybatisManager.getInstance().openSession();
		result_tbl = session.selectOne("board.tblchk",temp);
		session.close();
//		try {
//			String sql = "select count(*) from boardChk where tbl=? and serviceGubun=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1,temp);
//			pstmt.setString(2,"T");
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				result_tbl = rs.getInt(1);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return result_tbl;
	}
	
	public int comment_sakje(int no) {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.delete("board.comment_sakje",no);
		session.commit();
		session.close();
		return result;
	}
	
	public BoardDTO comment_selectOne(int no) {
		SqlSession session = MybatisManager.getInstance().openSession();
		BoardDTO dto = session.selectOne("board.comment_selectOne",no);
		session.commit();
		session.close();
		return dto;
	}
	
	public int comment_update(BoardDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.update("board.comment_update",map);
		session.commit();
		session.close();
		return result;
	}
	
	public BoardDTO getTblName(String tbl) {
		SqlSession session = MybatisManager.getInstance().openSession();
		BoardDTO dto= session.selectOne("board.getTblName",tbl);
		session.close();
		return dto;
	}
}


