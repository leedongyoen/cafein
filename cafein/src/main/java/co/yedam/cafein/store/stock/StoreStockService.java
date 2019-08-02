package co.yedam.cafein.store.stock;

import java.util.List;

import co.yedam.cafein.vo.StockVO;

public interface StoreStockService {
	
	public List<StockVO> getStockList(StockVO vo);
	public StockVO getStock(StockVO vo);
	
	public int insertStock(StockVO vo);
	public int updateStock(StockVO vo);
	public int deleteStock(StockVO vo);
	public int updateEnterQty(StockVO vo);
	public int updateEnterQtyProc(StockVO vo);
	public int checkStock(StockVO vo);
	
	
}
