package munje.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import munje.model.dto.MunjeDTO;
import sqlmap.MybatisManager;

public class MunjeDAO {
	
	
	public int setInsert_sihum(MunjeDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("munje.setInsert_sihum",map);
		session.commit();
		session.close();
		return result;
	}
	
	public List<MunjeDTO> getList(){
		
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MunjeDTO> list = session.selectList("munje.getList");

		session.close();
		return list;
	}
	
	public int setInsert_munje(MunjeDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("munje.setInsert_munje",map);
		session.commit();
		session.close();
		return result;
	}
}
