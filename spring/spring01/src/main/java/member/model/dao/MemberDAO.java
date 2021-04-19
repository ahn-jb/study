package member.model.dao;

import java.util.List;

import member.model.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO view(String id);

	void setInsert(MemberDTO dto);

	void setUpdate(MemberDTO dto);

	void setDelete(String id);

	int checkPasswd(String id, String passwd);

	List<MemberDTO> list();
	
}
