package shop.mall.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import shop.mall.model.dto.CartDTO;
import shop.product.model.dto.ProductDTO;
import sqlmap.MybatisManager;

public class CartDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConn() {
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String dbId = "jspStudy";
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
	
	public int setInsert(CartDTO dto) {
//		getConn();
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("cart.setInsert",map);
		session.commit();
		session.close();
//		int result =0;
//		try {
//			String sql ="insert into cart values(seq_cart.nextval,?,?,?,current_timestamp)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1,dto.getMemberNo());
//			pstmt.setInt(2,dto.getProductNo());
//			pstmt.setInt(3,dto.getAmount());
//			result = pstmt.executeUpdate();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return result;
	}
	public int getCount(int memberNo) {
//		getConn();
		int count = 0;
		SqlSession session = MybatisManager.getInstance().openSession();
		count = session.selectOne("cart.getCount",memberNo);
		session.close();
//		try {
//			String sql = "select count(*) from cart where memberNo=? ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, memberNo);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				count = rs.getInt(1);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return count;
	}
	
	public List<CartDTO> getCartlist(int memberNo, int startRecord, int lastRecord){
//		getConn();
		Map<String,Integer> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("lastRecord", lastRecord);
		map.put("memberNo",memberNo);
		SqlSession session = MybatisManager.getInstance().openSession();
		List<CartDTO> list = session.selectList("cart.getCartlist",map);
		session.close();
//		List<CartDTO> list = new ArrayList<CartDTO>();
//		try {
//			String sql = "select *from "
//						+ "(select ROWNUM rn, a.*, bb.name , bb.price, bb.product_img, bb.description from cart a join product bb on a.productNo = bb.no"
//						+ " where memberNo=? order by a.regi_date desc) where rn BETWEEN ? and ?";
////			System.out.println(sql);
//			pstmt =conn.prepareStatement(sql);
//			pstmt.setInt(1, memberNo);
//			pstmt.setInt(2, startRecord);
//			pstmt.setInt(3, lastRecord);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				CartDTO dto = new CartDTO();
//				dto.setNo(rs.getInt("no"));
//				dto.setProduct_name(rs.getString("name"));
//				dto.setProduct_price(rs.getInt("price"));
//				dto.setProduct_description(rs.getString("description"));
//				dto.setProduct_img(rs.getString("product_img"));
//				dto.setMemberNo(rs.getInt("memberNo"));
//				dto.setProductNo(rs.getInt("productNo"));
//				dto.setAmount(rs.getInt("amount"));
//				dto.setRegi_date(rs.getTimestamp("regi_date"));
//				list.add(dto);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return list;
	}
	public int CartDelete(int memberNo,int cartNo) {
//		getConn();
		int result = 0;
		Map<String,Integer> map = new HashMap<>();
		map.put("memberNo", memberNo );
		map.put("cartNo", cartNo);
		SqlSession session = MybatisManager.getInstance().openSession();
		result = session.delete("cart.CartDelete",map);
		session.commit();
		session.close();
//		try {
//			String sql="delete from cart where memberNo=? and no=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, memberNo);
//			pstmt.setInt(2, cartNo);
//			result = pstmt.executeUpdate();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return result;
	}
	
	public List<CartDTO> getListCartProductGroup(){
//		getConn();
//		List<CartDTO> list = new ArrayList<>();
		SqlSession session = MybatisManager.getInstance().openSession();
		List<CartDTO> list = session.selectList("cart.getListCartProductGroup");
		session.close();
//		try {
//			String sql = "";
//			sql += "select p.name product_name, sum(c.amount * p.price)buy_money ";
//			sql += " from cart c inner join product p on c.productNo = p.no ";
//			sql += "group by p.name ";
//			sql += "order by name asc ";
////			System.out.println("chart_sql: "+sql);
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				CartDTO dto = new CartDTO();
//				dto.setProduct_name(rs.getString("product_name"));
//				dto.setBuy_money(rs.getInt("buy_money"));
//				list.add(dto);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return list;
	}
}
