package co.yedam.cafein.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.yedam.cafein.customer.mymenu.CusMyService;
import co.yedam.cafein.vo.MyMenuVO;

@Controller
public class CustomerMenuController {
	
		
		//고객메뉴조회
		@RequestMapping("customermenulist.do")
		public String customermenulist() {
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
			return "customer/mymenu";
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
		@RequestMapping("customerstorelist.do")
		public String customerstorelist() {
			return "customer/storelist";
		}
		
}
