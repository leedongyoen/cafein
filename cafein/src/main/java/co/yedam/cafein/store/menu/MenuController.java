package co.yedam.cafein.store.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
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
		StockVO vo2 = new StockVO();
		MenuVO vo = new MenuVO();
		vo2.setsId("SH001");
		mv.addObject("storemenu",service.getMenuList(vo));
		mv.addObject("recistock",service2.getRecipeStockList(vo2));
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
	
	
	@ResponseBody
	@RequestMapping(value="/menues"
	,method=RequestMethod.POST
//		,produces="application/json"     
//		,consumes="application/json"
   ,headers = {"Content-type=application/json" }
			)public Map<String,Boolean> insertUser(@RequestBody MenuVO vo, Model model) {
		service.insertUser(vo);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", true);
		return  map;
	}
	
	
	
	
}
