package co.yedam.cafein.store.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.StockVO;

@Service
public class StoreStockServiceImpl implements StoreStockService {

	@Autowired
	StoreStockDAO stockDao;

	@Override
	public List<StockVO> getStockList(StockVO vo) {

		return stockDao.getStockList(vo);

	}

	@Override
	public int insertStock(StockVO vo) {
		
		return stockDao.insertStock(vo);
	}

	@Override
	public int updateStock(StockVO vo) {
		
		return stockDao.updateStock(vo);
	}

	@Override
	public int deleteStock(StockVO vo) {
		
		return stockDao.deleteStock(vo);
	}

	@Override
	public StockVO getStock(StockVO vo) {
		return stockDao.getStock(vo);
	}

	@Override
	public int updateEnterQty(StockVO vo) {
		
		return stockDao.updateEnterQty(vo);
	}

}
