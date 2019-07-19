package co.yedam.cafein.store.close;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.viewvo.ViewWarehousingVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;
import co.yedam.cafein.vo.StoreOpenVO;
import co.yedam.cafein.vo.WarehousingVO;
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
	public StoreOpenVO getStoreOpen(StoreOpenVO vo) {
		return dao.getStoreOpen(vo);
	}
	@Override
	public List<StockVO> getStockTruthList(StockVO vo) {
		return dao.getStockTruthList(vo);
	}

	@Override
	public int warehousingInsertAddStock(List<WarehousingVO> vo) {
		return dao.warehousingInsertAddStock(vo);
	}

	@Override
	public int warehousingInsertLoss(List<WarehousingVO> vo) {
		return dao.warehousingInsertLoss(vo);
	}

	@Override
	public int stockUpdate(List<StockVO> vo) {
		return dao.stockUpdate(vo);
	}

	@Override
	public int storeUpdate(List<StoreOpenVO> vo) {
		return dao.storeUpdate(vo);
	}

}
