package com.study.spring01.product.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.study.spring01.product.model.dao.ProductDAO;
import com.study.spring01.product.model.dto.ProductDTO;
import com.study.spring01.product.service.ProductService;

@Controller
public class ProductController {

	@Inject //객체 관리를 우리가 직접 코딩해서 만들지 않고, 스프링에서 해주도록 한다는 의미..
	ProductDAO productDao; //dao가 인터페이스이다.
	@Inject
	ProductService productService;
	
//    @Resource(name = "uploadPath")
//    String uploadPath;  //String uploadPath = "C:/hj/attach"; 처럼 해도 된다..
//  String uploadPath = "C:/hj/attach/product_img";
	String uploadPath = "L:/hj/attach";
	
	int imsi = 0; //0-dao, 1-service
	
	@RequestMapping("productList")
	public String productList(Model model) {
		
		List<ProductDTO> list;
		if (imsi == 0) {
			list = productDao.getList();
//			System.out.println("imsi : 111");
		} else {
			list = productService.getList();
//			System.out.println("imsi : 222");
		}

		model.addAttribute("list", list);
		return "product/list";
	}

	@RequestMapping("productView/{product_no}") //중괄호만 감싸면 된다. # 또는 $ 붙이지 마라..
	public String productView(
			@PathVariable("product_no") int product_no,
			Model model
			) {
		
		ProductDTO dto;
		if (imsi == 0) {
			dto = productDao.getView(product_no);
		} else {
			dto = productService.getView(product_no);
		}

		model.addAttribute("dto", dto); //회원정보를 모델에 저장
		return "product/view"; //views/member/view.jsp로 포워딩
	}
	
	@RequestMapping("productChuga")
	public String productChuga() {
		return "product/chuga";
	}
	
	@RequestMapping("productChugaProc")
	public String productChugaProc(
			@RequestParam("product_name") String product_name,
			@RequestParam("product_price") String product_price,
			@RequestParam("product_description") String product_description,
			@RequestParam("file") MultipartFile file, 
			Model model) throws Exception {
		
		System.out.println("파일이름:" + file.getOriginalFilename());
		System.out.println("파일크기:" + file.getSize());
		System.out.println("컨텐트 타입:" + file.getContentType());
        String originalFileName = file.getOriginalFilename();
        String newFileName = uploadFile(originalFileName, file.getBytes());
        
        Map<String, String> map = new HashMap<>();
        map.put("product_name", product_name);
        map.put("product_price", product_price);
        map.put("product_description", product_description);
        map.put("product_img", newFileName);
        
        map.put("originalFileName", originalFileName);
        map.put("newFileName", newFileName);
        map.put("newFileSize", file.getSize() + "");
        map.put("newFileType", file.getContentType());
         
		if (imsi == 0) {
			productDao.setInsert(map);
		} else {
			productService.setInsert(map);
		}
		
		String moveUrl = "redirect:productList";
		return moveUrl;
	}
	//파일 이름이 중복되지 않도록 처리
    private String uploadFile(String originalFileName, byte[] fileData) throws Exception {
    	String ext = originalFileName.substring(originalFileName.lastIndexOf('.')).toLowerCase(); // 확장자 
    	
        //UUID 생성 (Universal Unique IDentifier, 범용 고유 식별자)
       UUID uid = UUID.randomUUID();
//        String newFileName = uid.toString() + "_" + originalFileName;
        String newFileName = uid.toString() + ext;
        java.io.File f1 = new java.io.File(uploadPath + "/test_img", newFileName);
        //임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
        //FileCopyUtils.copy( 바이트배열, 파일객체 );
        FileCopyUtils.copy(fileData, f1);
        return newFileName;
    }
    


    @RequestMapping("productDownload")
    public void productDownload( HttpServletResponse response, HttpServletRequest request, @RequestParam Map<String, String> paramMap) {
     
//        String path = paramMap.get("filePath"); //full경로
        String fileName = paramMap.get("fileName"); //파일명
    	String path = uploadPath + "/test_img/" + fileName;
        
        File file = new File(path);
     
        FileInputStream fileInputStream = null;
        ServletOutputStream servletOutputStream = null;
     
//        fileName = "딸기.jpg";
        
        try{
            String downName = null;
            String browser = request.getHeader("User-Agent");
            //파일 인코딩
            if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode  
                downName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
            }else{
                downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            
            response.setHeader("Content-Disposition","attachment;filename=\"" + downName+"\"");             
            response.setContentType("application/octer-stream");
            response.setHeader("Content-Transfer-Encoding", "binary;");
     
            fileInputStream = new FileInputStream(file);
            servletOutputStream = response.getOutputStream();
     
//            byte b [] = new byte[1024];
            byte[] b = new byte[1024];
            int data = 0;
     
            while((data=(fileInputStream.read(b, 0, b.length))) != -1){
                servletOutputStream.write(b, 0, data);
            }
     
            servletOutputStream.flush();//출력
            
        }catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(servletOutputStream!=null){
                try{
                    servletOutputStream.close();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
            if(fileInputStream!=null){
                try{
                    fileInputStream.close();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
        }
    }

    
//    @GetMapping("/download")
    @RequestMapping("productDownload___")
    public void productDownload___(HttpServletResponse response, @RequestParam Map<String, String> paramMap) throws IOException{
            String fileName = paramMap.get("fileName"); //파일명
        	String saveFileName = uploadPath + "/test_img/" + fileName;
            
            File file = new File(saveFileName);
            int fileLength = (int) file.length();
            

            String contentType = "image/jpeg";
            
//            fileName = "딸기.jpg";
            
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
            response.setHeader("Content-Transfer-Encoding", "binary");
            response.setHeader("Content-Type", contentType);
            response.setHeader("Content-Length", "" + fileLength);
            response.setHeader("Pragma", "no-cache;");
            response.setHeader("Expires", "-1;");

            try {
	            FileInputStream fis = new FileInputStream(file); //fileName
	            OutputStream out = response.getOutputStream();
	            
	            int readCount = 0;
	            byte[] buffer = new byte[1024];
	            
	            while((readCount = fis.read(buffer))!=-1){
	              out.write(buffer,0,readCount);
	            }
            
            }catch(Exception ex){
//            	throw new RuntimeException("file Save Error");
            }           
    }
    
    
    
    
    
    
    
    
    
    
    
    
	@RequestMapping("productUpdate")
	public String productUpdate(@ModelAttribute ProductDTO dto, Model model) {
		if (imsi == 0) {
			productDao.setUpdate(dto);
		} else {
			productService.setUpdate(dto);
		}
		
		return "redirect:productList";
	}
	
	@RequestMapping("productDelete")
	public String memberDelete(
		@RequestParam(value="product_no", defaultValue="0") int product_no, 
		Model model) {
		if (imsi == 0) {
			productDao.setDelete(product_no);
		} else {
			productService.setDelete(product_no);
		}
		
		return "redirect:productList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*
	@RequestMapping("productDownloadNo/{product_no}") //중괄호만 감싸면 된다. # 또는 $ 붙이지 마라..
	public void productDownloadNo( HttpServletResponse response, HttpServletRequest request, @PathVariable("product_no") int product_no) {
		ProductDTO dto;
		if (imsi == 0) {
			dto = productDao.getView(product_no);
		} else {
			dto = productService.getView(product_no);
		}
		
        String fileName = dto.getProduct_img(); //파일명
        String oldName = dto.getProduct_img_oldName(); //원래파일명
    	String path = uploadPath + "/test_img/" + fileName; //full경로
        
        File file = new File(path);
     
        FileInputStream fileInputStream = null;
        ServletOutputStream servletOutputStream = null;
            
        try{
            String downName = null;
            String browser = request.getHeader("User-Agent");
            //파일 인코딩
            if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode  
                downName = URLEncoder.encode(oldName,"UTF-8").replaceAll("\\+", "%20");
            }else{
                downName = new String(oldName.getBytes("UTF-8"), "ISO-8859-1");
            }
            
            response.setHeader("Content-Disposition","attachment;filename=\"" + downName + "\"");             
            response.setContentType("application/octer-stream");
            response.setHeader("Content-Transfer-Encoding", "binary;");
     
            fileInputStream = new FileInputStream(file);
            servletOutputStream = response.getOutputStream();
     
//	            byte b [] = new byte[1024];
            byte[] b = new byte[1024];
            int data = 0;
     
            while((data=(fileInputStream.read(b, 0, b.length))) != -1){
                servletOutputStream.write(b, 0, data);
            }
     
            servletOutputStream.flush();//출력
            
        }catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(servletOutputStream!=null){
                try{
                    servletOutputStream.close();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
            if(fileInputStream!=null){
                try{
                    fileInputStream.close();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
        }
	}
*/
	
	@RequestMapping("productDownloadNo/{product_no}") //중괄호만 감싸면 된다. # 또는 $ 붙이지 마라..
	public void productDownloadNo( HttpServletResponse response, HttpServletRequest request, @PathVariable("product_no") int product_no) {
		ProductDTO dto;
		if (imsi == 0) {
			dto = productDao.getView(product_no);
		} else {
			dto = productService.getView(product_no);
		}
		
        String fileName = dto.getProduct_img(); //파일명
        String fileType = dto.getProduct_img_type(); //파일타입
        String oldName = dto.getProduct_img_oldName(); //원래파일명
    	String path = uploadPath + "/test_img/" + fileName; //full경로
		        
        File file = new File(path);
        int fileLength = (int) file.length();
                
        
        FileInputStream fileInputStream = null;
        ServletOutputStream servletOutputStream = null;
            
        try{
	        String downName = null;
	        String browser = request.getHeader("User-Agent");
	        //파일 인코딩
	        if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode  
	            downName = URLEncoder.encode(oldName,"UTF-8").replaceAll("\\+", "%20");
	        }else{
	            downName = new String(oldName.getBytes("UTF-8"), "ISO-8859-1");
	        }
	        
	        response.setHeader("Content-Disposition", "attachment; filename=\"" + downName + "\";");
	        response.setHeader("Content-Transfer-Encoding", "binary");
	        response.setHeader("Content-Type", fileType);
	        response.setHeader("Content-Length", "" + fileLength);
	        response.setHeader("Pragma", "no-cache;");
	        response.setHeader("Expires", "-1;");
	
	        try {
	            FileInputStream fis = new FileInputStream(file); //fileName
	            OutputStream out = response.getOutputStream();
	            
	            int readCount = 0;
	            byte[] buffer = new byte[1024];
	            
	            while((readCount = fis.read(buffer))!=-1){
	              out.write(buffer,0,readCount);
	            }
	            
	            out.flush();//출력
	        }catch(Exception e){
//	        	throw new RuntimeException("파일 오류");
	        	e.printStackTrace();
	        } 
        } catch(Exception e) {
        	e.printStackTrace();
        }
	}
}
