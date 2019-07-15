package co.yedam.cafein.customer.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StoreVO;

@Service
public class CustomerOrderServiceImpl {

	@Autowired
	CustomerOrderDAO dao;
	
	public List<OrdersVO> getOrderList(OrdersVO vo){
		return dao.getOrderlist(vo);
	}
	
	public StoreVO getSearchStore(StoreVO vo) {
		return dao.getSearchStore(vo);
	}
}
