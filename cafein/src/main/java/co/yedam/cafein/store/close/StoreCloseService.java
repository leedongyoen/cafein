package co.yedam.cafein.store.close;

import java.util.List;

import co.yedam.cafein.viewvo.ViewWarehousingVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;

public interface StoreCloseService {

	public List<ViewWarehousingVO> getWarehousing(ViewWarehousingVO vo);
	
	public List<OrdersVO> getCashAdvance(OrdersVO vo);
	
	public List<StockVO> getStockTruthList(StockVO vo);
}