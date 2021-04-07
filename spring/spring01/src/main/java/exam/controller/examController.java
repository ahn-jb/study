package exam.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import exam.model.dao.ExamDAO;
import exam.model.dto.ExamDTO;



@Controller
public class examController {
	@Inject
	ExamDAO examDao;
	
	
	@RequestMapping("/examChuga.do") //url mapping
	public String examChuga() {
		
		return "exam/chuga";
	}
	
	@RequestMapping("/examChugaProc.do")
	public String examChugaProc(
			@ModelAttribute ExamDTO dto,
			Model model
			) {
		String jumin_ = dto.getJumin();
		String imsi ="";
		imsi =  jumin_.substring(0,2);
		int age = 121- Integer.parseInt(imsi)+1;
		dto.setAge(age);
		imsi = jumin_.substring(6,7);
		String gender = "";
		if(imsi.equals("1") || imsi.equals("3") ) {
			gender="남자";
		}else {
			gender="여자";
		}
		dto.setGender(gender);
		examDao.setInsert(dto);
		return "redirect:examList.do";
	}
	
	@RequestMapping("/examList.do") //url mapping
	public String examList(Model model) {
		List<ExamDTO> list = examDao.list();
		model.addAttribute("list",list);
		return "exam/list";
	}
	
	@RequestMapping("/examView.do") //url mapping
	public String examView(Model model,
		@RequestParam(value="no", defaultValue="") int no
			) {
		ExamDTO dto = examDao.view(no);
		model.addAttribute("dto", dto);
		return "exam/view";
	}
	@RequestMapping("/examSujeong.do") //url mapping
	public String examSujeong(Model model,
			@RequestParam(value="no", defaultValue="") int no
			) {
		ExamDTO dto = examDao.view(no);
		model.addAttribute("dto", dto);
		return "exam/sujeong";
	}
	@RequestMapping("/examSujeongProc.do") //url mapping
	public String examSujeongProc(
			@ModelAttribute ExamDTO dto,
			Model model
			) {
		examDao.setUpdate(dto);

		return "redirect:examList.do";
	}
	@RequestMapping("/examSakje.do") //url mapping
	public String examsakje(Model model,@RequestParam(value="no", defaultValue="") int no) {
		examDao.setDelete(no);
		return "redirect:examList.do";
	}
	
	
}
