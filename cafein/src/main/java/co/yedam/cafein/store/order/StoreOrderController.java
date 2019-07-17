package co.yedam.cafein.store.order;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.cafein.vo.OrderDetailsVO;
import co.yedam.cafein.vo.OrdersVO;

@RestController
public class StoreOrderController {
	
	@Autowired
	StoreOrderServiceImpl service;
	
	
	// 해당 매장의 주문 목록
	@ResponseBody
	@RequestMapping(value="getstoreorderlist", method=RequestMethod.GET)
	public List<OrdersVO> getstoreorderlist(String sId){
		OrdersVO vo = new OrdersVO();
		vo.setsId(sId);
		
		return service.getstoreorderlist(vo);
	}
	
	// 해당 매장의 주문 상세
	@ResponseBody
	@RequestMapping(value="getstoreorderdetails", method=RequestMethod.GET)
	public List<OrderDetailsVO> getstoreorderdetails(String oNum, String mNum){
		OrdersVO vo = new OrdersVO();
		vo.setoNum(oNum);
		vo.setmNum(mNum);
		
		return service.getstoreorderdetails(vo);
	}
	
	//
	// 옵션 묶기
	@ResponseBody
	@RequestMapping(value="getmenunumber", method=RequestMethod.GET)
	public OrderDetailsVO getmenunumber(String oNum,String mNum){
		OrderDetailsVO vo = new OrderDetailsVO();
		vo.setoNum(oNum);
		vo.setmNum(mNum);
		
		return service.getmenunumber(vo);
	}

}
