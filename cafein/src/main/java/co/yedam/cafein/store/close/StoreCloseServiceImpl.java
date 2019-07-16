package co.yedam.cafein.store.close;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.viewvo.ViewWarehousingVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;
@Service
public class StoreCloseServiceImpl implements StoreCloseService {
	
	@Autowired
	StoreCloseDAO dao;

	@Override
	public List<ViewWarehousingVO> getWarehousing(ViewWarehousingVO vo) {
		return dao.getWarehousing(vo);
	}

	@Override
	public List<OrdersVO> getCashAdvance(OrdersVO vo) {
		return dao.getCashAdvance(vo);
	}

	@Override
	public List<StockVO> getStockTruthList(StockVO vo) {
		return dao.getStockTruthList(vo);
	}

}
