package com.study.spring01.test;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Test06Controller {

	@RequestMapping("/test06.do") //RequestMapping이라는 것은  url 매핑이다. http://localhost:8090/spring01/test01.do
    public String test06(Model model) {
        return "_test/test06/exam01"; //  /WEB-INF/views/test01/test01로 넘어감..  ,  servlet-contect.xml에서 확인..
    }
    
    @RequestMapping("/test06Proc.do")
    public String test05Proc(
    		@ModelAttribute Test06DTO dto,
    		Model model
    		) {
    	String productBunryu = dto.getProductBunryu();
    	String productName = dto.getProductName();
    	int productPrice = dto.getProductPrice();
    	int productSalePercent = dto.getProductSalePercent();
//    	double productSaleMoney = dto.getProductSaleMoney();
    	double productSaleMoney = productPrice - ((productPrice * productSalePercent) / 100);
//    	String productSaleMoney_ = String.format("%.2f", productSaleMoney);
    	
    	String productCompany = dto.getProductCompany();

/*
    	model.addAttribute("productBunryu", productBunryu);
    	model.addAttribute("productName", productName);
    	model.addAttribute("productPrice", productPrice);
    	model.addAttribute("productSalePercent", productSalePercent);
    	model.addAttribute("productSaleMoney", productSaleMoney);
    	model.addAttribute("productCompany", productCompany);
*/
    	dto.setProductBunryu(productBunryu);
    	dto.setProductName(productName);
    	dto.setProductPrice(productPrice);
    	dto.setProductSalePercent(productSalePercent);
    	dto.setProductSaleMoney(productSaleMoney);
    	dto.setProductCompany(productCompany);
    	
    	model.addAttribute("dto", dto);
    	
        return "_test/test06/exam01Result";
    }
    
}
