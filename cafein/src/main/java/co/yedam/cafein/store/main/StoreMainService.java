package co.yedam.cafein.store.main;

import java.util.List;

import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;

public interface StoreMainService {

	public List<OrdersVO> getSalesRank(OrdersVO vo);
	
	public List<StockVO> getStockLess(StockVO vo);
	
	public List<OrdersVO> getMileageInfo(OrdersVO vo);
}
