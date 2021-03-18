package guestbook.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DbExample;
import guestbook.model.dto.GbDTO;

public class GbDAO_imsi {
	
	Connection conn= DbExample.dbConn();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int setInsert(GbDTO dto) {
		
		int result = 0;
		try {
			String sql = "insert into guestbook values(seq_guestbook.nextval,?,?,?,?,sysdate) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getName() );
			pstmt.setString(2,dto.getEmail() );
			pstmt.setString(3,dto.getPasswd() );
			pstmt.setString(4,dto.getContent() );
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int getCount(String bunryu,String search) {
		int count = 0;
		try {
			String sql="";
			if(bunryu==null) {
				sql = "select count(*) from guestbook ";
			}else {
				sql = "select count(*) from guestbook where "+bunryu+" like '%"+search+"%' ";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<GbDTO> getSelectAll(int startRecord,int lastRecord,String bunryu,String search){
		ArrayList<GbDTO> list = new ArrayList<GbDTO>();
		try {
			String sql1 = "select*from " 
					+ " (select ROWNUM rn , bb.* from"
					+ " (select * from guestbook where no>0 ";

			String sql ="";
			if(bunryu == null) {
				sql = sql1 
						+ " order by no desc) bb)"
						+ " where rn between ? and ?";
			}else {
				sql = sql1 
						+ " and " + bunryu +" like '%" + search + "%'  order by no desc) bb)"
						+ " where rn between ? and ?";
			}

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startRecord);
		pstmt.setInt(2, lastRecord);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			GbDTO dto = new GbDTO();
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setEmail(rs.getString("email"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setContent(rs.getString("content"));
			dto.setRegi_date(rs.getDate("regi_date"));
			list.add(dto);
		}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
