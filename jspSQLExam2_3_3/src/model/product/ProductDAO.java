package model.product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class ProductDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConn() {	
		try {
		String driver ="oracle.jdbc.driver.OracleDriver";
		String dbUrl ="jdbc:oracle:thin:@localhost:1521/xe";
		String dbId = "jspSQLExam2";
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
	
	public int setInsert(ProductDTO dto) {
		getConn();
		int result=0;
		try {
			String sql ="insert into product values(seq_product.nextval,?,?,?,?,sysdate)";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, dto.getP_code());
			pstmt.setString(2, dto.getP_name());
			pstmt.setInt(3, dto.getP_price());
			pstmt.setInt(4, dto.getP_count());
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
		
	}
	
	public ArrayList<ProductDTO> getSelectAll(){
		getConn();
		ArrayList<ProductDTO> list = new ArrayList<>();
		try {
			String sql = "select*from product order by no asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setNo(rs.getInt("no"));
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_count(rs.getInt("p_count"));
				dto.setRegidate(rs.getTimestamp("regidate"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return list;
	}
	
	public ProductDTO getSelectOne(int no) {
		getConn();
		ProductDTO dto = new ProductDTO();
		
		try {
			
			String sql = "select * from product where no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_count(rs.getInt("p_count"));
				dto.setRegidate(rs.getTimestamp("regidate"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return dto;
	}
	
	public int Gumae(ProductDTO dto) {
		getConn();
		int result =0;
		System.out.println(dto.getP_NOP());
		try {
			String sql = "update product set p_count= (p_count - ?) where no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getP_NOP());
			pstmt.setInt(2, dto.getNo());
			pstmt.executeUpdate();
		}catch(Exception e2) {
			e2.printStackTrace();
		}
		
		try {
			String sql = "insert into delivery values(seq_delivery.nextval,?,?,?,?,?,?,'입금 대기',current_timestamp)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMember_id() );
			pstmt.setString(2, dto.getP_code());
			pstmt.setString(3, dto.getP_name());
			pstmt.setInt(4, dto.getP_NOP());
			pstmt.setInt(5, dto.getP_NOP()*dto.getP_price());
			pstmt.setString(6,dto.getMember_addr());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
	
	public ArrayList<ProductDTO> getSelectDelivery(String id){
		getConn();
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			String sql = "select * from delivery where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setNo(rs.getInt("no"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_NOP(rs.getInt("p_NOP"));
				dto.setP_total(rs.getInt("p_total"));
				dto.setMember_addr(rs.getString("member_addr"));
				dto.setCurrent_status(rs.getString("current_status"));
				dto.setRegidate(rs.getTimestamp("regidate"));
				list.add(dto);
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<ProductDTO> getSelectAllDelivery(){
		getConn();
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			String sql = "select * from delivery order by no asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setNo(rs.getInt("no"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_NOP(rs.getInt("p_NOP"));
				dto.setP_total(rs.getInt("p_total"));
				dto.setMember_addr(rs.getString("member_addr"));
				dto.setCurrent_status(rs.getString("current_status"));
				dto.setRegidate(rs.getTimestamp("regidate"));
				list.add(dto);
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
