package etc.member;

import java.util.ArrayList;

public interface MemberDAO {
	
	public void getConn();
	
	public int setInsert(MemberDTO dto);
	
	public ArrayList<MemberDTO> getSelectAll();
	
	public int Login(MemberDTO dto);
	
	public MemberDTO getSelectOne(String id);
	
	public void loginCounterfail(MemberDTO dto);
	
	public void loginCounterSucsess(MemberDTO dto);
	
	public int update(MemberDTO dto);
	
	public int delete(String id);
}
