package co.yedam.cafein.store.close;

import java.util.List;
import java.util.Map;

import co.yedam.cafein.viewvo.ViewWarehousingVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;
import co.yedam.cafein.vo.StoreCloseDataInsertVO;
import co.yedam.cafein.vo.StoreOpenVO;

public interface StoreCloseService {

	public List<ViewWarehousingVO> getWarehousing(ViewWarehousingVO vo);
	
	public List<OrdersVO> getCashAdvance(OrdersVO vo);
	
	public StoreOpenVO getStoreOpen(StoreOpenVO vo);
	
	public List<StockVO> getStockTruthList(StockVO vo);
	
	/*
	 * public int warehousingInsertAddStock(List<WarehousingVO> vo);
	 * 
	 * public int warehousingInsertLoss(List<WarehousingVO> vo);
	 * 
	 * public int stockUpdate(List<StockVO> vo);
	 * 
	 * public int storeUpdate(List<StoreOpenVO> vo);
	 */
	
	public List<OrdersVO> getCloseReceiptCash(OrdersVO vo);
	
	public List<OrdersVO> getCloseReceiptMileage(OrdersVO vo);
	
	public List<OrdersVO> getRefundInfo(OrdersVO vo);
	
	public int storeCloseDataImsert(StoreCloseDataInsertVO vo);
	
	public List<Map<String, Object>> storeReceipt(StoreOpenVO vo);
	
	public List<StoreOpenVO> storeReceiptList(StoreOpenVO vo);
}
