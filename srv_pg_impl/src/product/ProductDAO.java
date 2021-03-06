package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.Db;
import member.MemberDTO;

public class ProductDAO {

	Connection conn = Db.getConn();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
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
		
		int result=0;
		try {
			String sql = "insert into product values(seq_num.nextval,?,?,?)";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCate());
			pstmt.setString(2, dto.getPname());
			pstmt.setInt(3, dto.getPrice());
		
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
	
}
