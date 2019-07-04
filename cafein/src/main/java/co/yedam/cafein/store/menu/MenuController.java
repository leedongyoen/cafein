package co.yedam.cafein.store.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


import co.yedam.cafein.vo.MenuVO;

@RestController
public class MenuController {

	@Autowired
	MenuServiceImpl service;

	@RequestMapping(value="/storerecipemenu", method=RequestMethod.GET)
	public ModelAndView getMenuList(ModelAndView mv) {
		MenuVO vo = new MenuVO();
		mv.addObject("storemenu",service.getMenuList(vo));
		mv.setViewName("store/menulist");
		return mv;
	}
	
	@RequestMapping(value="/menues"
					, method=RequestMethod.PUT
					,consumes="application/json" 
					)
	public MenuVO updateMenu(@RequestBody MenuVO vo, Model model) {
		service.updateUser(vo);
		return vo;
	}
	
	
}
