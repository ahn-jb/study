package guestbook.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import db.DbExample;
import guestbook.model.dto.GbDTO;
import memo.model.dto.MemoDTO;
import sqlmap.MybatisManager;

public class GbDAO {
	
	Connection conn= DbExample.dbConn();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String table_1 = "guestbook";
	public int setInsert(GbDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("guestbook.setInsert",map);
		session.commit();
		session.close();
//		int result = 0;
//		try {
//			String sql = "insert into guestbook values(seq_guestbook.nextval,?,?,?,?,sysdate) ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1,dto.getName() );
//			pstmt.setString(2,dto.getEmail() );
//			pstmt.setString(3,dto.getPasswd() );
//			pstmt.setString(4,dto.getContent() );
//			result = pstmt.executeUpdate();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return result;
	}
	
	public int getCount(String bunryu,String search) {
		Map<String,Object> map = new HashMap<>();
		map.put("bunryu", bunryu);
		map.put("search", search);
		map.put("table_1", table_1);
		SqlSession session = MybatisManager.getInstance().openSession();
		int count = session.selectOne("guestbook.getCount",map);
		
//		int count = 0;
//		try {
//			String sql="";
//			if(bunryu==null) {
//				sql = "select count(*) from guestbook ";
//			}else {
//				sql = "select count(*) from guestbook where "+bunryu+" like '%"+search+"%' ";
//			}
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				count = rs.getInt(1);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return count;
	}
	
	public List<GbDTO> getSelectAll(int startRecord,int lastRecord,String bunryu,String search){
		Map<String,String> map = new HashMap<>();
		map.put("startRecord", startRecord+"");
		map.put("lastRecord", lastRecord+"");
		map.put("bunryu", bunryu);
		map.put("search", search);
		map.put("table_1", table_1);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		List<GbDTO> list = session.selectList("guestbook.getSelectAll",map);
		session.close();		
		return list;
//		ArrayList<GbDTO> list = new ArrayList<GbDTO>();
//		try {
//			String sql1 = "select*from " 
//					+ " (select ROWNUM rn , bb.* from"
//					+ " (select * from guestbook where no>0 ";
//
//			String sql ="";
//			if(bunryu == null) {
//				sql = sql1 
//						+ " order by no desc) bb)"
//						+ " where rn between ? and ?";
//			}else {
//				sql = sql1 
//						+ " and " + bunryu +" like '%" + search + "%'  order by no desc) bb)"
//						+ " where rn between ? and ?";
//			}
//
//		pstmt = conn.prepareStatement(sql);
//		pstmt.setInt(1, startRecord);
//		pstmt.setInt(2, lastRecord);
//		rs = pstmt.executeQuery();
//		while(rs.next()) {
//			GbDTO dto = new GbDTO();
//			dto.setNo(rs.getInt("no"));
//			dto.setName(rs.getString("name"));
//			dto.setEmail(rs.getString("email"));
//			dto.setPasswd(rs.getString("passwd"));
//			dto.setContent(rs.getString("content"));
//			dto.setRegi_date(rs.getDate("regi_date"));
//			list.add(dto);
//		}	
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return list;
	}
	public GbDTO selectOne(int no) {
		SqlSession session = MybatisManager.getInstance().openSession();
		GbDTO dto = session.selectOne("guestbook.selectOne",no);
		session.close();		
		return dto;
	}
	
	
	public int update(GbDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		map.put("table_1", table_1);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("guestbook.update",map);
		session.commit();
		session.close();
		return result;
	}
	
	public int delete(int no) {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("guestbook.delete",no);
		session.commit();
		session.close();
		return result;
	}
}
