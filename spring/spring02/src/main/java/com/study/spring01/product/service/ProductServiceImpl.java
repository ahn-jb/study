package com.study.spring01.product.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.spring01.product.model.dao.ProductDAO;
import com.study.spring01.product.model.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject	//스프링 컨테이너가 만든 dao 객체가 연결됨(의존관계 주입)
	ProductDAO productDao; 
	
	@Override
	public List<ProductDTO> getList() {
		return productDao.getList();
	}

	@Override
	public ProductDTO getView(int product_no) {
		return productDao.getView(product_no);
	}

	@Override
	public void setInsert(Map<String, String> map) {
		productDao.setInsert(map);
	}

	@Override
	public void setUpdate(ProductDTO dto) {
		productDao.setUpdate(dto);
	}

	@Override
	public void setDelete(int product_no) {
		productDao.setDelete(product_no);
	}

}
