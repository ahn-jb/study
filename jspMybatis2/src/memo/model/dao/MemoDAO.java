package memo.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import memo.model.dto.MemoDTO;
import sqlmap.MybatisManager;

public class MemoDAO {
	
	String table_1 ="memo";
	
	public int setInsert(MemoDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("memo.setInsert",map);
		session.commit();
		session.close();
//		int result = 0;
//		try {
//			String sql = "insert into memo values(seq_memo.nextval,?,?,sysdate)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, dto.getWriter());
//			pstmt.setString(2, dto.getContent());
//			result = pstmt.executeUpdate();
//		}catch(Exception e) {
//			 e.printStackTrace();
//		}
		return result;
	}
	
//	public ArrayList<MemoDTO> getSelectAll(){
//		ArrayList<MemoDTO> list = new ArrayList<>();
//		try {
//			String sql = "select * from memo order by no asc";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				MemoDTO dto =new MemoDTO();
//				dto.setNo(rs.getInt("no"));
//				dto.setWriter(rs.getString("writer"));
//				dto.setContent(rs.getString("content"));
//				dto.setRegi_date(rs.getDate("regi_date"));
//				list.add(dto);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//		
//	}
	
	
	public int getTotalRecord() {
		
		SqlSession session = MybatisManager.getInstance().openSession();
		int count = session.selectOne("memo.getTotalRecord");
//		session.close();
//		int count = 0;
//		try {
//			String sql="select count(*) from memo";
//			
//			pstmt = conn.prepareStatement(sql);
//			rs= pstmt.executeQuery();
//			if(rs.next()) {
//				count = rs.getInt(1);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return count;
	}
	
	public List<MemoDTO> getSelectMemo(int startRecord,int lastRecord){
		Map<String,String> map = new HashMap<>();
		map.put("startRecord", startRecord+"");
		map.put("lastRecord", lastRecord+"");
		map.put("table_1", table_1);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MemoDTO> list = session.selectList("memo.getSelectMemo",map);
		session.close();		
		return list;
//		try {
//			String basicSql ="";
//			basicSql += "select * from memo where no > 0 order by no desc";
//			String sql = "";
//			sql += "select * from (select A.*, Rownum Rnum from ("+basicSql+") A) where Rnum >=? and Rnum<=? ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, startRecord);
//			pstmt.setInt(2, lastRecord);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				MemoDTO dto =new MemoDTO();
//				dto.setNo(rs.getInt("no"));
//				dto.setWriter(rs.getString("writer"));
//				dto.setContent(rs.getString("content"));
//				dto.setRegi_date(rs.getDate("regi_date"));
//				list.add(dto);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return list;
		
	}
	
	public int sakje(int no) {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("memo.sakje",no);
		session.commit();
		session.close();
		return result;
	}
	
	public int sujeong(MemoDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("memo.sujeong",map);
		session.commit();
		session.close();
		return result;
	}
}
