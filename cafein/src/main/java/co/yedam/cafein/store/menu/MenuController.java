package co.yedam.cafein.store.menu;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.StockVO;

@RestController
public class MenuController {

	@Autowired
	MenuServiceImpl service;
	@Autowired
	RecipeSerciveImpl service2;
	
	

	@RequestMapping(value="/storerecipemenu", method=RequestMethod.GET)
	public ModelAndView getMenuList(ModelAndView mv, HttpSession session) {
		//StockVO vo2 = new StockVO();
		MenuVO vo = new MenuVO();
		//vo2.setsId("SH001");
		vo.setsId((String)session.getAttribute("sId"));
		System.out.println("vo: "+vo);
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
		System.out.println("controller: �쟾"+mid);
		service.deleteUser(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	
	
	
	//메뉴 등록+coffee는 반드시 hot/ice 출력
	@ResponseBody
	@RequestMapping(value="/menues/{sId}"
	,method=RequestMethod.POST
//		,produces="application/json"     
//		,consumes="application/json"
   ,headers = {"Content-type=application/json" })
	public Map<String,Boolean> insertUser(
								@PathVariable("sId") String sId,
								@RequestBody MenuVO vo,
								Model model) throws IllegalStateException, IOException {

		
	
		//insert 후에 mnum받아와야함......
		vo.setsId(sId);
		service.insertMenuProc1(vo);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", true);
		return  map;
	}
	
	
	
	
	
	
	@RequestMapping(value = "/imgUpdate.do", method = RequestMethod.POST)
	public ModelAndView boardInsert(MenuVO vo, HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		
		System.out.println(request.getSession().getServletContext().getRealPath("/"));
		
		MultipartFile uploadFile = vo.getUploadFile();
		String fileName = null;
		if (uploadFile != null && !uploadFile.isEmpty() && uploadFile.getSize() > 0) {
			fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(request.getSession().getServletContext().getRealPath("/")+"image/" + fileName));
		}
		vo.setUploadFileName(fileName);
		service.updateFile(vo);
		ModelAndView mv = new ModelAndView();
		mv = getMenuList(mv,session);
		return mv;
	}
	
}
