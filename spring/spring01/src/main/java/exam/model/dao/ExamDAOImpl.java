package exam.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import exam.model.dto.ExamDTO;

@Repository
public class ExamDAOImpl implements ExamDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ExamDTO> list() {

		return sqlSession.selectList("exam.list");
	}

	@Override
	public ExamDTO view(int no) {

		return sqlSession.selectOne("exam.view",no);
	}

	@Override
	public void setInsert(ExamDTO dto) {
		sqlSession.insert("exam.setInsert",dto);
		
	}

	@Override
	public void setUpdate(ExamDTO dto) {
		sqlSession.update("exam.setUpdate",dto);
		
	}

	@Override
	public void setDelete(int no) {
		sqlSession.delete("exam.setDelete",no);
		
	}

	@Override
	public int checkPasswd(int no, String passwd) {
		int result = 0;
		Map<String,Object> map = new HashMap<>();
		map.put("no", no );
		map.put("passwd", passwd);
		result = sqlSession.selectOne("exam.checkPasswd",map);
		return result;
	}

}
