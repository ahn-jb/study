package com.study.spring01.product.model.dao;

import java.util.List;
import java.util.Map;

import com.study.spring01.product.model.dto.ProductDTO;

public interface ProductDAO {
	public List<ProductDTO> getList();
	public ProductDTO getView(int product_no);
	public void setInsert(Map<String, String> map);
	public void setUpdate(ProductDTO dto);
	public void setDelete(int product_no);
}
