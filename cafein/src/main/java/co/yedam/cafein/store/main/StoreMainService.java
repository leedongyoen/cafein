package co.yedam.cafein.store.main;

import java.util.List;

import co.yedam.cafein.vo.OrdersVO;

public interface StoreMainService {

	public List<OrdersVO> getSalesRank(OrdersVO vo);
}
