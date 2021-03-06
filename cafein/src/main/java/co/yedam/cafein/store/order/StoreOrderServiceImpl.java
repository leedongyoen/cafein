package co.yedam.cafein.store.order;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.customer.order.CustomerOrderDAO;
import co.yedam.cafein.vo.OrderDetailsVO;
import co.yedam.cafein.vo.OrdersVO;

@Service
public class StoreOrderServiceImpl {
	
	@Resource
	StoreOrderDAO dao;
	@Autowired
	CustomerOrderDAO cusdao;
	
	
	// 해당 매장의 주문목록 가져오기
	public List<OrdersVO> getfirstorderlist(OrdersVO vo){
		return dao.getfirstorderlist(vo);
	}
	
	// 해당 주문목록의 내역가져오기
	public List<OrdersVO> getstoreorderlist(OrdersVO vo){
		
		return  dao.getstoreorderlist(vo);
	}
	
	// 전체건수
	public int getstoreorderlisttotal(OrdersVO vo) {
		return dao.getstoreorderlisttotal(vo);
	}
	
	// 주문확인 상태인 건수
	public int getstoreordernotviewcount(OrdersVO vo) {
		return dao.getstoreordernotviewcount(vo);
	}
	
	// 해당 매장의 주문상세 가져오기
	public List<OrderDetailsVO> getstoreorderdetails(OrdersVO vo){
		return dao.getstoreorderdetails(vo);
	}
	
	// 해당 매장의 주문메뉴들의 옵션들만 출력
	public List<OrderDetailsVO> getmenuoptionlist(OrderDetailsVO vo){
		return dao.getmenuoptionlist(vo);
	}
	
//-------------------------------------------------------------------------------------

	
	// 주문 취소 ( 매장 에서 ) 
	public int updateordercancel(OrdersVO vo){
		return dao.updateordercancel(vo);
	}

	// 주문 취소 ( 매장 에서 ) 
	public int updateordermileage(OrdersVO vo){
		return dao.updateordermileage(vo);
	}
	
	// 주문 승인 ( 매장 에서 ) 
	public int updateorderapply(OrdersVO vo){
		return dao.updateorderapply(vo);
	}
	
	// 해당 매장의 배달 서비스 가져오기. ( 배달대기인 것만 )
	public void getdeliverytatuscheck(){
		int n =0;
		List<OrdersVO> deliverylist = dao.getdeliverytatuscheck();
		
		if(deliverylist.size() > 0) {
			n = updatedeliverystatus(deliverylist);
		}
	
	}
	
	// 해당 매장 배달대기에서 배달완료로 바꾸기 ( 소요시간 지나면 ) 
	public int updatedeliverystatus(List<OrdersVO> list){
		int result=0;
		int i;
		for(int n=0; n<list.size();n++) {
			i = dao.updatedeliverystatus(list.get(n));
			result+=i;
		}
		return result;
	}

	// 모든 매장에서 주문이 들어온지 5문이 지난 주문이 있는지 확인하고
	// 있으면 주문 취솔 바뀜.

	public void getordertimecheck(){
		
		dao.schedulerordertimecheck();
		
	}

//-------------------------------------------------------------------------------------

	
	public void stockupdate() {
		dao.stockupdate();
	}

	
	
//-------------------------------------------------------------------------------------
		
		// 사용미정
	// 해당 매장의 주문메뉴의 옵션을 묶기 위해
	public OrderDetailsVO getmenunumber(OrderDetailsVO vo){
		return dao.getmenunumber(vo);
	}

}
