package co.yedam.cafein.store.order;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	
	// 해당 매장의 주문메뉴들의 옵션들만 출력
	@ResponseBody
	@RequestMapping(value="getstoreordermenuoptionlist", method=RequestMethod.GET)
	public List<OrderDetailsVO> getmenuoptionlist(String sId,String oNum){
		OrderDetailsVO vo = new OrderDetailsVO();
	
		vo.setoNum(oNum);
		vo.setsId(sId);
		return service.getmenuoptionlist(vo);
	}
	
	
	// 해당 주문번호 취소
	@ResponseBody
	@RequestMapping(value="updateordercancel", method=RequestMethod.POST)
	public int updateordercancel(String oNum, String refuseReason) {
		OrdersVO vo = new OrdersVO();
		vo.setoNum(oNum);
		vo.setRefuseReason(refuseReason);
		
		return service.updateordercancel(vo);
	}
	
	// 미정
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
