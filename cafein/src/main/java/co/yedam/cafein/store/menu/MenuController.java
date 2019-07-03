package co.yedam.cafein.store.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("menu") // Model에 board 속성이 저장될때 세션에도 같이 저장( session에 r/w

public class MenuController {

	@Autowired
	MenuService service;
	
	  
}
