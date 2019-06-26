package co.yedam.cafein.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerMainController {

	// 메인화면으로
	@RequestMapping("customerMainForm.do")
	public String customerMainForm() {
		return "customer/main";
	}
	
	// 자주 이용한 매장 조회
	@RequestMapping("likestorelist.do")
	public String likestorelist() {
		return "customer/likestorelist";
	}
	
	// 선호 메뉴 조회
	@RequestMapping("likemenulist.do")
	public String likemenulist() {
		return "customer/likemenulist";
	}
	
	// 고객 마일리지 조회
	@RequestMapping("reservelist.do")
	public String reservelist() {
		return "customer/reservelist";
	}
	
	// 고객 총 사용금액 조회
	@RequestMapping("orderlist.do")
	public String orderlist() {
		return "customer/orderlist";
	}
	
}
