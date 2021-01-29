package model.member;

import java.util.ArrayList;

public class MemberExample {

	MemberDAO dao = new MemberDAOImplOracle();
//	MemberDAO dao = new MemberDAOImplMysql();
	
	
	public void getConn() {
		dao.getConn();
	}
	
	public int setInsert(MemberDTO dto) {
		return dao.setInsert(dto);
	}
	
	public ArrayList<MemberDTO> getSelectAll(){
		
		return dao.getSelectAll();
	}
	
	public MemberDTO getSelectOne(String id) {
		return dao.getSelectOne(id);
	}
	
	public int getUpdate(MemberDTO dto) {
		return dao.getUpdate(dto);
	}
	
	public int Delete(String id) {
		return dao.Delete(id);
	}
	
}
