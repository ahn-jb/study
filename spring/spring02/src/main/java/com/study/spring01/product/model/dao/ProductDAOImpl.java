package com.study.spring01.product.model.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.study.spring01.member.model.dao.MemberDAOImpl;
import com.study.spring01.product.model.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> getList() {
		return sqlSession.selectList("product.getList");
	}

	@Override
	public ProductDTO getView(int product_no) {
		return sqlSession.selectOne("product.getView", product_no);
	}

	@Override
	public void setInsert(Map<String, String> map) {
		sqlSession.insert("product.setInsert", map);
	}

	@Override
	public void setUpdate(ProductDTO dto) {
		sqlSession.update("product.setUpdate", dto);
	}

	@Override
	public void setDelete(int product_no) {
		sqlSession.delete("product.setDelete", product_no);
	}

}
