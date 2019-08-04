package co.yedam.cafein.store.order;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.cafein.common.Paging;
import co.yedam.cafein.customer.CustomerOrderController;
import co.yedam.cafein.vo.OrderDetailsVO;
import co.yedam.cafein.vo.OrdersVO;

@RestController
public class StoreOrderController {
	
	@Autowired
	StoreOrderServiceImpl service;
	@Autowired
	CustomerOrderController cus_order_service;
	
	
	// 해당 매장의 주문 목록
		@ResponseBody
		@RequestMapping(value="getfirstorderlist", method=RequestMethod.GET)
		public Map<String, Object> getfirstorderlist(OrdersVO vo){
			
			Paging paging = new Paging();
			
			paging.setPage(vo.getCheckpagenum());
			paging.setPageUnit(5);
			vo.setStart(paging.getFirst());
			vo.setEnd(paging.getLast());
			
			
			// 전체 건수 받아오기
			paging.setTotalRecord(service.getstoreorderlisttotal(vo));
			
			
			System.out.println("================getTotalRecord"+
						paging.getTotalRecord()+
						"=== getCheckpagenum"+
						vo.getCheckpagenum()
						+"=== getStart"+
						vo.getStart()
						+"=== getEnd"+
						vo.getEnd()
						+"=== getStartPage"+
						paging.getStartPage()
						+"=== getEndPage"+
						paging.getEndPage()
						+"=== getLastPage"+
						paging.getLastPage()

					);
			
			
			List<OrdersVO> orderlist = service.getfirstorderlist(vo);
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("list", orderlist);
			result.put("paging", paging);
			
			return result;
		}
	
	// 페이징처리에 따른 주문 목록 내역들
	@ResponseBody
	@RequestMapping(value="getstoreorderlist", method=RequestMethod.GET)
	public List<OrdersVO> getstoreorderlist(OrdersVO vo){
		
		return service.getstoreorderlist(vo);
	}
	
	// 해당 매장의 주문 상세
	@ResponseBody
	@RequestMapping(value="getstoreorderdetails", method=RequestMethod.GET)
	public List<OrderDetailsVO> getstoreorderdetails(String oNum, String mNum, String opDnum){
		OrdersVO vo = new OrdersVO();
		vo.setoNum(oNum);
		vo.setmNum(mNum);
		vo.setOpDnum(opDnum);  
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
	
//-------------------------------------------------------------------------------------
	
	// 해당 주문번호 취소
	@ResponseBody
	@RequestMapping(value="updateordercancel", method=RequestMethod.POST)
	public int updateordercancel(String oNum, String refuseReason,String sId) {
		OrdersVO vo = new OrdersVO();
		
		String mileageservice = cus_order_service.getstoremileageservice(sId);
		
		vo.setoNum(oNum);
		vo.setRefuseReason(refuseReason);
		
		
		int n = service.updateordercancel(vo);
		
		System.out.println("============ mileage service "+mileageservice);
		if(mileageservice.equals("Y") ) {
			n = service.updateordermileage(vo);
		}
		return n;
	}

	// 해당 주문번호 승인
	@ResponseBody
	@RequestMapping(value="updateorderapply", method=RequestMethod.POST)
	public int updateorderapply(String oNum, String takeTime) {
		OrdersVO vo = new OrdersVO();
		vo.setoNum(oNum);
		vo.setTakeTime(takeTime);
		
		return service.updateorderapply(vo);
	}
	

	
//-------------------------------------------------------------------------------------
	
	
	
//-------------------------------------------------------------------------------------
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
