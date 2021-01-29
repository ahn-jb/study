package resume;

import java.util.ArrayList;

public class ResumeImpl {
	ResumeDAO dao = new ResumeImplOracle();
//	ResumeDAO dao = new ResumeImplMysql();
	
	public void getConn() {
		dao.getConn();
	}
	public int setInsert(ResumeDTO dto) {
		return dao.setInsert(dto);
	}
	
	public ArrayList<ResumeDTO> getSelectAll(){
		return dao.getSelectAll();
	}
	
	public ResumeDTO getSelectOne(int no) {
		return dao.getSelectOne(no);
	}
	
	public int setUpdate(ResumeDTO dto) {
		return dao.setUpdate(dto);
	}
	
	public int setDelete(int no) {
		return dao.setDelete(no);
	}
}
