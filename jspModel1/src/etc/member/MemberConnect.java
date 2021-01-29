package etc.member;
import java.util.ArrayList;

import etc.member.MemberDAO;
import etc.member.MemberDAOImplOracle;
import etc.member.MemberDTO;

public class MemberConnect {

	MemberDAO dao = new MemberDAOImplOracle();	// Oracle 연결 
//	MemberDAO dao = new MemberDAOImplMysql();	// Mysql 연결 
	
	
	public void getConn() {
		dao.getConn();
	}
	
	public int setInsert(MemberDTO dto) {
		return dao.setInsert(dto);
	}
	
	public ArrayList<MemberDTO> getSelectAll(){
		
		return dao.getSelectAll();
	}
	public int Login(MemberDTO dto) {
		return dao.Login(dto);
	}
	
	public MemberDTO getSelectOne(String id) {
		return dao.getSelectOne(id);
	}
	public void loginCounterfail(MemberDTO dto) {
		dao.loginCounterfail(dto);
	}
	
	public void loginCounterSucsess(MemberDTO dto) {
		dao.loginCounterSucsess(dto);
	}
	
//	public int getUpdate(MemberDTO dto) {
//		return dao.getUpdate(dto);
//	}
//	
//	public int Delete(String id) {
//		return dao.Delete(id);
//	}

}