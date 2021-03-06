package co.yedam.cafein.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreMenuController {

	

	@RequestMapping("storemenulist.do")
	public String storemenulist() {
		return "store/menulist";
	}
	
	@RequestMapping("menuregi.do")
	public String menuregi() {
		return "store/menuregi";
	}
	@RequestMapping("menuedit.do")
	public String menuedit() {
		return "store/menuedit";
	}
	@RequestMapping("menudetail.do")
	public String menudetail() {
		return "store/menudetail";
	}
	
	
	@RequestMapping("recipelist.do")
	public String recipelist() {
		return "store/recipelist";
	}
	
	@RequestMapping("recipedetail.do")
	public String recipedetail() {
		return "store/recipedetail";
	}
	@RequestMapping("reciperegi.do")
	public String reciperegi() {
		return "store/reciperegi";
	}
	@RequestMapping("recipeedit.do")
	public String recipeedit() {
		return "store/recipeedit";
	}
	

	
}
