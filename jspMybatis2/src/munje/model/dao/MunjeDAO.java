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
	
	public List<MunjeDTO> getSihumName(){
		
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MunjeDTO> list = session.selectList("munje.getSihumName");

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
	
	public int getTotalRecord_sihum(String search_option,String search_data) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("search_data", search_data);
		SqlSession session = MybatisManager.getInstance().openSession();
		int count = session.selectOne("munje.getTotalRecord_sihum",map);
		session.close();
		return count;
	}
	
	public List<MunjeDTO> getList_sihum(int startRecord,int lastRecord,String search_option,String search_data){
		Map<String,Object> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("lastRecord", lastRecord);
		map.put("search_option", search_option);
		map.put("search_data", search_data);
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MunjeDTO> list= session.selectList("munje.getList_sihum",map);
		session.close();
		return list;
	}
	
	public MunjeDTO getView_sihum(int no) {
		SqlSession session = MybatisManager.getInstance().openSession();
		MunjeDTO dto = session.selectOne("munje.getView_sihum",no);
		session.close();
		return dto;
	}
	public List<MunjeDTO> getView_Munje(int no){
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MunjeDTO> list= session.selectList("munje.getView_Munje",no);
		session.close();
		return list;
	}
}
