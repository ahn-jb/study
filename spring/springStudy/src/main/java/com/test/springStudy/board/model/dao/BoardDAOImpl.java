package com.test.springStudy.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.springStudy.board.model.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	SqlSession sqlSession;
	
	String table_1 ="board";
	
	@Override
	public int setInsert(BoardDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		int result= 0;
		result = sqlSession.insert("board.setInsert",map);

		return result;

	}
	
	@Override
	public int getMaxNum() {
		int num = 0;
		num = sqlSession.selectOne("board.getMaxNum");

		return num;
	}
	
	@Override
	public int getMaxRefNo() {
		int num = 0;
		num = sqlSession.selectOne("board.getMaxRefNo");		

		return num;
	}
	
	@Override
	public void setUpdateHit(int no) {
		int result = sqlSession.update("board.setUpdateHit",no);


	}
	
	@Override
	public int getMaxNoticeNo(String tbl) {
		int result = 0;
		result = sqlSession.selectOne("board.getMaxNoticeNo",tbl);

		return result;
	}
	
	@Override
	public void setUpdateReLevel(BoardDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		int result = sqlSession.update("board.setUpdateReLevel",map);


	}

	@Override
	public BoardDTO getSelectOne(int no) {
		BoardDTO dto = sqlSession.selectOne("board.getSelectOne",no);

		return dto;
	}
	
	@Override
	public BoardDTO getView(int no,String tbl, String search_data , String search_option) {//상세보기 출력
		Map<String,Object> map = new HashMap<>();
		map.put("no", no);
		map.put("tbl", tbl);
		map.put("search_option",search_option);
		map.put("search_data", search_data);
		BoardDTO dto = sqlSession.selectOne("board.getView",map);

		return dto;
	}
	
	@Override
	public int setUpdate(BoardDTO dto) {//수정하기
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		int result= sqlSession.update("board.setUpdate",map);

		return result;
	}
	
	@Override
	public int Delete(int no) {//삭제하기
		int result= sqlSession.delete("board.Delete",no);

		return result;
	}
	
	@Override
	public List<BoardDTO> search(int startRecord, int lastRecord,String tbl,String search_data, String search_option) {

		Map<String,String> map = new HashMap<>();
		map.put("startRecord", startRecord+"");
		map.put("lastRecord", lastRecord+"");
		map.put("tbl", tbl);
		map.put("search_option",search_option);
		map.put("search_data", search_data);
		List<BoardDTO> list = sqlSession.selectList("board.search",map);


		return list;
	}
	
	@Override
	public int getCount(String tbl,String search_option ,String search_data) {
		Map<String,String> map = new HashMap<>();
		map.put("tbl", tbl);
		map.put("search_option", search_option);
		map.put("search_data", search_data);
		int result = sqlSession.selectOne("board.getCount",map);

		return result;

	}
	
	// Comment
	@Override
	public int CommentInsert(BoardDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		int result = sqlSession.insert("board.CommentInsert",map);

		return result;
	}
	
	@Override
	public int getTotalRecord(int no) {
		int result = sqlSession.selectOne("board.getTotalRecord",no);

		return result;

	}
	
	@Override
	public List<BoardDTO> getComment(int no,int startRecord,int lastRecord){
		Map<String,Integer> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("lastRecord", lastRecord);
		map.put("no", no);		
		List<BoardDTO> list = sqlSession.selectList("board.getComment",map);
	
		return list;

	}
	
	@Override
	public int tblchk(String temp) {
	
		int result_tbl=0;
		if(temp != null && temp !="") {
			temp = temp.trim();
		}else {
			temp ="";
		}
		
		result_tbl = sqlSession.selectOne("board.tblchk",temp);

		return result_tbl;
	}
	
	@Override
	public int comment_sakje(int no) {
		int result = sqlSession.delete("board.comment_sakje",no);

		return result;
	}
	
	@Override
	public BoardDTO comment_selectOne(int no) {
		BoardDTO dto = sqlSession.selectOne("board.comment_selectOne",no);

		return dto;
	}
	
	@Override
	public int comment_update(BoardDTO dto) {
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);	
		int result = sqlSession.update("board.comment_update",map);

		return result;
	}
	
	@Override
	public BoardDTO getTblName(String tbl) {
		BoardDTO dto= sqlSession.selectOne("board.getTblName",tbl);

		return dto;
	}
}
