package model.member;

import java.util.ArrayList;

public interface MemberDAO {
	
	public void getConn();
	
	public int setInsert(MemberDTO dto);
	
	public ArrayList<MemberDTO> getSelectAll();
	
	public MemberDTO getSelectOne(String id);
	
	public int getUpdate(MemberDTO dto);
	
	public int Delete(String id);
}
