package co.yedam.cafein.store.menu;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.StockVO;

@RestController
public class MenuController {

	@Autowired
	MenuServiceImpl service;

	@Autowired
	RecipeSerciveImpl service2;

	
	@RequestMapping(value="/storerecipemenu", method=RequestMethod.GET)
	public ModelAndView getMenuList(ModelAndView mv) {
		//StockVO vo2 = new StockVO();
		MenuVO vo = new MenuVO();
		//vo2.setsId("SH001");
		mv.addObject("storemenu",service.getMenuList(vo));
		//mv.addObject("recistock",service2.getRecipeStockList(vo2));
		mv.setViewName("store/menulist");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/menues"
					, method=RequestMethod.PUT
					,consumes="application/json" 
					)
	public MenuVO updateMenu(@RequestBody MenuVO vo, Model model) {
		System.out.println(vo.toString());
		service.updateUser(vo);
		return vo;
	}
	@ResponseBody
	@RequestMapping(value="/menues/{mNum}", method=RequestMethod.DELETE)
	public Map getUserList( @PathVariable("mNum") String mid, MenuVO vo, Model model) {
		vo.setmNum(mid);
		System.out.println("controller: 전"+mid);
		service.deleteUser(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	
	
	
	//메뉴 등록 맞음
	@ResponseBody
	@RequestMapping(value="/menues"
	,method=RequestMethod.POST
//		,produces="application/json"     
//		,consumes="application/json"
   ,headers = {"Content-type=application/json" })
	public Map<String,Boolean> insertUser(@RequestBody MenuVO vo, Model model) throws IllegalStateException, IOException {
		
		
		/*
		System.out.println("t사진 업로드 테스ㅡ 중: "+vo.getUploadFileName());
		
		//첨부파일 업로드 처리
		MultipartFile uploadFile = vo.getUploadFile();
		String fileName = null;
		if(uploadFile !=null && !uploadFile.isEmpty() && uploadFile.getSize()>0) {
		fileName = uploadFile.getOriginalFilename();
		uploadFile.transferTo(new File("C:\\upload/"+fileName));
		}
		//첨부파일명 VO에 지정
		vo.setUploadFileName(fileName);
		*/
		
		
		service.insertUser(vo);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", true);
		return  map;
	}
	
	
	
	
	
	
	@RequestMapping(value = "/imgUpdate.do", method = RequestMethod.POST)
	public ModelAndView boardInsert(MenuVO vo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		// 첨부파일 업로드 처리
			
		MultipartFile uploadFile = vo.getUploadFile();
		String fileName = null;
		if (uploadFile != null && !uploadFile.isEmpty() && uploadFile.getSize() > 0) {
			fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(request.getSession().getServletContext().getRealPath("/") + fileName));
		}
		// 첨부파일명 VO에 지정
		vo.setUploadFileName(fileName);
		service.updateFile(vo);
		ModelAndView mv = new ModelAndView();
		mv = getMenuList(mv);
		return mv;
	}
	
	
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("") public MenuVO updateImg(@RequestBody MenuVO vo, Model
	 * model) throws IllegalStateException, IOException {
	 * 
	 * System.out.println("t사진 업로드 테스ㅡ 중: "+vo.toString());
	 * 
	 * //첨부파일 업로드 처리 MultipartFile uploadFile = vo.getUploadFile(); String fileName
	 * = null; if(uploadFile !=null && !uploadFile.isEmpty() &&
	 * uploadFile.getSize()>0) { fileName = uploadFile.getOriginalFilename();
	 * uploadFile.transferTo(new File("C:\\upload/"+fileName)); } //첨부파일명 VO에 지정
	 * vo.setUploadFileName(fileName);
	 * 
	 * return null; }
	 * 
	 */
	
	/*
	 * @Value("${file.path}") private String up_dir;
	 * 
	 * //ajax 이미지 업로드
	 * 
	 * @RequestMapping(value = "/imgUpload.do")
	 * 
	 * @ResponseBody public Map imgUpload(@RequestParam("upload") MultipartFile
	 * uploadFile, HttpServletRequest request) throws IllegalStateException,
	 * IOException { String contextPath = request.getContextPath(); String filename
	 * = uploadFile.getOriginalFilename(); //업로드 파일명 String url = contextPath+"/"+
	 * up_dir+"/"+filename; //src 경로 만들어줌
	 * 
	 * String path = request.getSession().getServletContext().getRealPath(up_dir);
	 * System.out.println("path: "+path); uploadFile.transferTo(new File(path,
	 * filename));
	 * 
	 * Map<String, String> map = new HashMap<String, String>();
	 * map.put("uploaded","1"); map.put("fileName",filename); map.put("url", url);
	 * return map; }
	 */
	
}
