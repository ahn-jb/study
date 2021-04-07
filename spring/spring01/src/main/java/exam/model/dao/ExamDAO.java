package exam.model.dao;

import java.util.List;

import exam.model.dto.ExamDTO;

public interface ExamDAO {
	public List<ExamDTO> list();
	public ExamDTO view(int no);
	public void setInsert(ExamDTO dto);
	public void setUpdate(ExamDTO dto);
	public void setDelete(int no);
	
	public int checkPasswd(int no,String passwd);
	
}
