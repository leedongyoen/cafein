package co.yedam.cafein.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerOrderController {
	
	
	//고객 주문하기
	@RequestMapping("orderregi.do")
	public String orderregi() {
		return "customer/orderregi";
	}
	
	//고객 주문 조회
	@RequestMapping("orderlist.do")
	public String orderlist() {
		return "customer/orderlist";
	}
	//고객 주문배달 조회
	@RequestMapping("delivery.do")
	public String delivery() {
		return "customer/delivery";
	}
	//고객 주문상세 조회
	@RequestMapping("orderdetails.do")
	public String orderdetails() {
		return "customer/orderdetails";
	}
	//고객장바구니 관리
	@RequestMapping("cartmng.do")
	public String cartmng() {
		return "customer/cartmng";
	}
	
	
	
	
	

}
