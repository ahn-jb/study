package com.test.springStudy.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.test.springStudy.board.model.dto.BoardDTO;

public interface BoardDAO {
	
	
	public int setInsert(BoardDTO dto);
	public int getMaxNum();
	public int getMaxRefNo();
	public void setUpdateHit(int no);
	public int getMaxNoticeNo(String tbl);
	public void setUpdateReLevel(BoardDTO dto);
	public BoardDTO getSelectOne(int no);
	public BoardDTO getView(int no,String tbl, String search_data , String search_option);
	public int setUpdate(BoardDTO dto);
	public int Delete(int no);
	public List<BoardDTO> search(int startRecord, int lastRecord,String tbl,String search_data, String search_option);
	public int getCount(String tbl,String search_option ,String search_data);
	public int CommentInsert(BoardDTO dto);
	public int getTotalRecord(int no);
	public List<BoardDTO> getComment(int no,int startRecord,int lastRecord);
	public int tblchk(String temp);
	public int comment_sakje(int no);
	public BoardDTO comment_selectOne(int no);
	public int comment_update(BoardDTO dto);
	public BoardDTO getTblName(String tbl);
	
	
}
