package com.test.spring01;



import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Test06Controller {

	@RequestMapping("/test06.do") //url mapping
	public String test06() {
		
		return "test06/exam01";
	}

	
	@RequestMapping("/test06Proc.do") //url mapping
	public String test06Proc(
			Model model,
			@RequestParam(value="product_bunryu", defaultValue="") String product_bunryu,
			@RequestParam(value="product_name", defaultValue="") String product_name,
			@RequestParam(value="product_price", defaultValue="") int product_price,
			@RequestParam(value="harin", defaultValue="") int harin,
			@RequestParam(value="maid", defaultValue="") String maid
		
			) {
		int harin_price = product_price -(product_price/100*harin);
		model.addAttribute("product_bunryu",product_bunryu);
		model.addAttribute("product_name",product_name);
		model.addAttribute("product_price",product_price);
		model.addAttribute("harin",harin);
		model.addAttribute("maid",maid);
		model.addAttribute("harin_price",harin_price);
		return "test06/exam01Result";
	}
	
}
