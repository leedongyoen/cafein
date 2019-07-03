package co.yedam.cafein.store.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.cafein.vo.MenuVO;

@Controller
@SessionAttributes("menu") // Model에 board 속성이 저장될때 세션에도 같이 저장( session에 r/w

public class MenuController {

	@Autowired
	MenuService service;
	
	@RequestMapping("getMenuList.do")
	public String getMenuList(Model model, MenuVO vo) {
		model.addAttribute("menuList",service.getMenuList(vo));
		return "store/menulist";
		

	}
	  
}
