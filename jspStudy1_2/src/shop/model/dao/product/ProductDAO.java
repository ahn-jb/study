package shop.model.dao.product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.dto.board.BoardDTO;
import shop.model.dto.product.ProductDTO;

public class ProductDAO {
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
	
	public int getCount(String bunryu ,String search) {
		getConn();
		int count = 0;
		try {
			String sql1 = "select count(*) from product ";
			String sql="";
			if(bunryu == null || bunryu =="") {
				sql = sql1;
			}else if(bunryu.equals("name") || bunryu.equals("discription")) {
				sql = sql1  + bunryu + " like '%" + search + "%'";
			}else if(bunryu.equals("total")) {
				sql = sql1 + " (name like '%" + search + "%' or discription like '%" + search +"%' )";
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
	
	public ArrayList<ProductDTO> search(int startRow, int endRow,String search_data, String search_option) {
		getConn();
		ArrayList<ProductDTO> list = new ArrayList<>();
		try {
			String sql1 = "select*from " 
					+ " (select ROWNUM rn,bb.* from"
					+ " (select b.*,(select count(*) from product where no>0) from product b ";
			String sql= "";
			if(search_option == null || search_option =="") {
				sql = sql1 
						+ " order by no desc) bb)"
						+ " where rn between ? and ?";
			}else if(search_option.equals("name") || search_option.equals("discription")) {
				sql = sql1 
						+ " where " + search_option +" like '%" + search_data + "%'  order by no desc) bb)"
						+ " where rn between ? and ?";
			}else if(search_option.equals("total")) {
				sql = sql1 
						+ " where (name like '%"+ search_data + "%' or discription like '%" + search_data + "%' )"
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
				ProductDTO dto = new ProductDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setDescription(rs.getString("description"));
				dto.setProduct_img(rs.getString("product_img"));
				dto.setRegi_date(rs.getTimestamp("regi_date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public int setInsert(ProductDTO dto) {
		getConn();
		int result =0;
		try {
			String sql ="insert into product values(seq_product.nextval,?,?,?,?,current_timestamp)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getName());
			pstmt.setInt(2,dto.getPrice());
			pstmt.setString(3,dto.getDescription());
			pstmt.setString(4,dto.getProduct_img());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ProductDTO getView(int no) {
		getConn();
		ProductDTO dto = new ProductDTO();
		try {
			String sql = "select * from product where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setDescription(rs.getString("description"));
				dto.setProduct_img(rs.getString("product_img"));
				dto.setRegi_date(rs.getTimestamp("regi_date"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int Update(ProductDTO dto) {
		getConn();
		int result =0;
		try {
			String sql ="update product set name=?,price=?,description=?,product_img=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setString(3, dto.getDescription());
			pstmt.setString(4, dto.getProduct_img());
			pstmt.setInt(5, dto.getNo());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int Delete(int no) {
		getConn();
		int result = 0;
		try {
			String sql = "delete from product where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
