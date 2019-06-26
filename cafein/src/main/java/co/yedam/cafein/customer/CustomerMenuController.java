package co.yedam.cafein.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerMenuController {
		
		//고객메뉴조회
		@RequestMapping("menulist.do")
		public String menulist() {
			return "customer/menulist";
		}
		//고객 나만의 메뉴의 메뉴선택
		@RequestMapping("menuchoice.do")
		public String menuchoice() {
			return "customer/menuchoice";
		}
		//고객 나만의 메뉴
		@RequestMapping("mymenu.do")
		public String mymenu() {
			return "customer/menulist";
		}
		//고객 나만의 메뉴 등록화면
		@RequestMapping("mymenuregi.do")
		public String mymenuregi() {
			return "customer/mymenuregi";
		}
		//고객 나만의 메뉴 상세
		@RequestMapping("mymenudetail.do")
		public String mymenudetail() {
			return "customer/mymenudetail";
		}
		//고객주변매장조회
		@RequestMapping("storelist.do")
		public String storelist() {
			return "customer/storelist";
		}
}
