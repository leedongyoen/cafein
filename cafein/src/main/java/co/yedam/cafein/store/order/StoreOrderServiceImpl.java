package co.yedam.cafein.store.order;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.OrderDetailsVO;
import co.yedam.cafein.vo.OrdersVO;

@Service
public class StoreOrderServiceImpl {
	
	@Resource
	StoreOrderDAO dao;
	
	// 해당 매장의 주문목록 가져오기
	public List<OrdersVO> getstoreorderlist(OrdersVO vo){
		return dao.getstoreorderlist(vo);
	}
	
	// 해당 매장의 주문상세 가져오기
	public List<OrderDetailsVO> getstoreorderdetails(OrdersVO vo){
		return dao.getstoreorderdetails(vo);
	}
	
	// 해당 매장의 주문메뉴의 옵션을 묶기 위해
	public OrderDetailsVO getmenunumber(OrderDetailsVO vo){
		return dao.getmenunumber(vo);
	}

}
