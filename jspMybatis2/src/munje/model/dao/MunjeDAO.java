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
	
	public int sihum_update(MunjeDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.update("munje.sihum_update",map);
		session.commit();
		session.close();
		return result;
	}
	public int sihum_delete(int no) {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.delete("munje.sihum_delete",no);
		session.commit();
		session.close();
		return result;
	}
	public int munje_delete(int testNo) {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.delete("munje.munje_delete",testNo);
		session.commit();
		session.close();
		return result;
	}
	public int munje_delete2(int no) {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.delete("munje.munje_delete2",no);
		session.commit();
		session.close();
		return result;
	}
	
	public MunjeDTO getView_munje(int no) {
		SqlSession session = MybatisManager.getInstance().openSession();
		MunjeDTO dto = session.selectOne("munje.getView_munje",no);
		session.close();
		return dto;
	}
	
	public int munje_update(MunjeDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.update("munje.munje_update",map);
		session.commit();
		session.close();
		return result;
	}
	public int getTotalRecord_munje(int testNo) {
		SqlSession session = MybatisManager.getInstance().openSession();
		int count = session.selectOne("munje.getTotalRecord_munje",testNo);
		session.close();
		return count;
	}
	public int setInsert_test_answer(int testNo,String answer_total) {
		Map<String,Object> map = new HashMap<>();
		map.put("testNo", testNo);
		map.put("answer_total", answer_total);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("munje.setInsert_test_answer",map);
		session.commit();
		session.close();
		return result;
	}
	public int check_test_answer(int testNo) {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.selectOne("munje.check_test_answer",testNo);
		session.commit();
		session.close();
		return result;
	}
	
	public int check_sihum(String testName,String testType) {
		Map<String,Object> map = new HashMap<>();
		map.put("testName", testName);
		map.put("testType", testType);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.selectOne("munje.check_sihum",map);
		session.commit();
		session.close();
		return result;
	}
	
	public int check_munje(int testNo,int testNumber) {
		Map<String,Object> map = new HashMap<>();
		map.put("testNo", testNo);
		map.put("testNumber", testNumber);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.selectOne("munje.check_munje",map);
		session.commit();
		session.close();
		return result;
	}
	
	public int sujeong_test_answer(int testNo,String answer_total) {
		Map<String,Object> map = new HashMap<>();
		map.put("testNo", testNo);
		map.put("answer_total", answer_total);
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.update("munje.sujeong_test_answer",map);
		session.commit();
		session.close();
		return result;
	}
	
	public int sakje_test_answer(int testNo) {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.delete("munje.sakje_test_answer",testNo);
		session.commit();
		session.close();
		return result;
	}
	
	public MunjeDTO get_test_answer(int testNo) {
		SqlSession session = MybatisManager.getInstance().openSession();
		MunjeDTO dto = session.selectOne("munje.get_test_answer",testNo);
		session.commit();
		session.close();
		return dto;
	}
}
