package co.yedam.cafein.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.cafein.customer.order.CustomerOrderServiceImpl;
import co.yedam.cafein.vo.OrdersVO;

@Controller
public class CustomerOrderController {
	
	@Autowired
	CustomerOrderServiceImpl service;
	
	@RequestMapping("orderregi.do")
	public String orderregi() {
		return "customer/orderregi";
	}
	
	//고객 주문 페이지로 이동.
	@RequestMapping("orderlist.do")
	public String orderlist() {
		return "customer/orderlist";
	}
	
	// 고객 주문 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/orderlist/{cid}", method=RequestMethod.GET)
	public List<OrdersVO> getOrderList(@PathVariable("cid") String cId){
		OrdersVO vo = new OrdersVO();
		vo.setcId(cId);

		return service.getOrderList(vo);
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
