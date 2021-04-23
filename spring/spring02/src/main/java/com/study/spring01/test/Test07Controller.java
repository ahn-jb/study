package com.study.spring01.test;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Test07Controller {

	@RequestMapping("/test07.do") //RequestMapping이라는 것은  url 매핑이다. http://localhost:8090/spring01/test01.do
    public String test07(Model model) {
        return "_test/test07/exam01"; //  /WEB-INF/views/test01/test01로 넘어감..  ,  servlet-contect.xml에서 확인..
    }
    
    @RequestMapping("/test07Proc.do")
    public ModelAndView test07Proc(
    		@ModelAttribute Test07DTO dto
    		) {
    	String productBunryu = dto.getProductBunryu();
    	String productName = dto.getProductName();
    	int productPrice = dto.getProductPrice();
    	int productSalePercent = dto.getProductSalePercent();
//    	double productSaleMoney = dto.getProductSaleMoney();
    	double productSaleMoney = productPrice - ((productPrice * productSalePercent) / 100);
//    	String productSaleMoney_ = String.format("%.2f", productSaleMoney);
    	
    	String productCompany = dto.getProductCompany();

    	dto.setProductBunryu(productBunryu);
    	dto.setProductName(productName);
    	dto.setProductPrice(productPrice);
    	dto.setProductSalePercent(productSalePercent);
    	dto.setProductSaleMoney(productSaleMoney);
    	dto.setProductCompany(productCompany);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", dto);
    	
		
/*			
		//ModelAndView(url, key, value); //값은 하나만 보낼 수 있기때문에 map 또는 객체 등을 이용한다.
		return new ModelAndView("test/modelandview_result", "map", map); //url, 변수명, 데이타
*/
		
//		데이터와 뷰를 동시에 설정이 가능 
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("_test/test07/exam01Result"); // 뷰의 이름 
		mv.addObject("map", map); // 뷰로 보낼 데이터 값 
		return mv;
    }
    
}
