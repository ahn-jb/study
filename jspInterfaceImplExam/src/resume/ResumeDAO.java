package resume;

import java.util.ArrayList;

public interface ResumeDAO {
	
	
	public void getConn();
	public int setInsert(ResumeDTO dto);
	public ArrayList<ResumeDTO> getSelectAll();
	public ResumeDTO getSelectOne(int no);
	public int setUpdate(ResumeDTO dto);
	public int setDelete(int no);
}
