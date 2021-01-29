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
}
