package co.yedam.cafein.store.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;

@Service
public class StoreMainServiceImpl implements StoreMainService {
	
	@Autowired
	StoreMainDAO dao;

	@Override
	public List<OrdersVO> getSalesRank(OrdersVO vo) {
		return dao.getSalesRank(vo);
	}

	@Override
	public List<StockVO> getStockLess(StockVO vo) {
		return dao.getStockLess(vo);
	}

	
	@Override
	public List<OrdersVO> getMileageInfo(OrdersVO vo) {
		return dao.getMileageInfo(vo);
	}


}
