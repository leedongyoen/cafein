package co.yedam.cafein.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerOrderController {
	
	@RequestMapping("orderregiForm.do")
	public String orderregiForm() {
		return "customer/orderregi";
	}
	
	
	@RequestMapping("orderlistForm.do")
	public String orderlistForm() {
		return "customer/orderlist";
	}
	
	@RequestMapping("deliveryForm.do")
	public String deliveryForm() {
		return "customer/delivery";
	}
	
	@RequestMapping("orderdetailsForm.do")
	public String orderdetailsForm() {
		return "customer/orderdetails";
	}
	
	@RequestMapping("cartmngForm.do")
	public String cartmngForm() {
		return "customer/cartmng";
	}
	
	
	
	
	

}
