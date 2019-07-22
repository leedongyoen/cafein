package co.yedam.cafein.store.close;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.viewvo.ViewWarehousingVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;
import co.yedam.cafein.vo.StoreCloseDataInsertVO;
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
	/*
	 * @Override public int warehousingInsertAddStock(List<WarehousingVO> vo) {
	 * return dao.warehousingInsertAddStock(vo); }
	 * 
	 * @Override public int warehousingInsertLoss(List<WarehousingVO> vo) { return
	 * dao.warehousingInsertLoss(vo); }
	 * 
	 * @Override public int stockUpdate(List<StockVO> vo) { return
	 * dao.stockUpdate(vo); }
	 * 
	 * @Override public int storeUpdate(List<StoreOpenVO> vo) { return
	 * dao.storeUpdate(vo); }
	 */
	
	@Override
	public List<OrdersVO> getCloseReceiptCash(OrdersVO vo) {
		return dao.getCloseReceiptCash(vo);
	}

	@Override
	public List<OrdersVO> getCloseReceiptMileage(OrdersVO vo) {
		return dao.getCloseReceiptMileage(vo);
	}


	@Override
	public List<OrdersVO> getRefundInfo(OrdersVO vo) {
		return dao.getRefundInfo(vo);
	}
	
	@Override
	public int storeCloseDataImsert(StoreCloseDataInsertVO vo) {

		// storeopen 테이블에 data를 update하기 위한 list
		List<StoreOpenVO> storeVO = vo.getStore();
		// 재고수량의 변경이 있을 때 stock 테이블에 재고수량과 재고상태를 update하기 위한 list
		List<StockVO> stockVO = vo.getStock();
		// 재고수량의 변경으로 손실이 발생한 경우 warehousing 테이블에 손실량을 insert하기 위한 list
		List<WarehousingVO> warehousingLossVO = vo.getWarehousingLoss();
		// 추가로 입고한 물품이나 재고가 있을 때 warehousing 테이블에 data를 insert하기 위한 list
		List<WarehousingVO> warehousingAddStockVO = vo.getWarehousingAddStock();
		
		System.out.println("storeopen table update : " + storeVO);
		System.out.println("stock table update : " + stockVO);
		System.out.println("warehousing table insert(손실량) : " + warehousingLossVO);
		System.out.println("warehousing table insert(추가입고) : " + warehousingAddStockVO);

		// 0이 아닌 데이터를 담기위한 빈 list
		List<WarehousingVO> plusList = new ArrayList<WarehousingVO>();
		
		// warehousing insert (손실량)
		if(warehousingLossVO.size() != 0) {
			for(int i=0;i<warehousingLossVO.size();i++) {
				if(warehousingLossVO.get(i).getStLoss() != 0) {
					plusList.add(warehousingLossVO.get(i));
					System.out.println("warehousingLossVO : " + warehousingLossVO.get(i).getStLoss());
				}
			}
			if(plusList.size() != 0) {
				dao.warehousingInsertLoss(plusList);
				System.out.println("warehousing table data insert seccess ! (Loss)");
			}
			
		}
		
		// warehousing insert (추가재고)
		if(warehousingAddStockVO.size() != 0) {
			System.out.println("------ warehousingAddStockVO is Not Null ! ------");
			for(int i=0;i<warehousingAddStockVO.size();i++) {
				if(warehousingAddStockVO.get(i).getStPayMethod().equals("현금")) {
					warehousingAddStockVO.get(i).setStPayMethod("cash");
				} else if(warehousingAddStockVO.get(i).getStPayMethod().equals("카드")) {
					warehousingAddStockVO.get(i).setStPayMethod("card");
				}
			}
			dao.warehousingInsertAddStock(warehousingAddStockVO);
			System.out.println("warehousing table data insert seccess ! (Add Stock)");
		}
		System.out.println("------ warehousingAddStockVO is Null ! ------");
		
		// 재고 수량과 실 수량이 같지 않은 데이터를 담기위한 빈 list
		List<StockVO> plusStockList = new ArrayList<StockVO>();
		
		// stock update (재고수량, 재고상태)
		if(stockVO.size() != 0) {
			for(int i=0;i<stockVO.size();i++) {
				if(stockVO.get(i).getStQty() != stockVO.get(i).getTruthQty()) {
					System.out.println("stockVO에서 재고수량과 실 수량이 같지 않은 재고 : " + stockVO.get(i).getStName());
					
					if(stockVO.get(i).getTruthQty() > stockVO.get(i).getLackQty()) {
						stockVO.get(i).setStStatus("B1");
					} else if (stockVO.get(i).getTruthQty() == 0) {
						stockVO.get(i).setStStatus("B3");
					} else if (stockVO.get(i).getTruthQty() <= stockVO.get(i).getLackQty()) {
						stockVO.get(i).setStStatus("B2");
					} 
					System.out.println("실수량 : " + stockVO.get(i).getTruthQty());
					System.out.println("재고상태 : " + stockVO.get(i).getStStatus());
					
					plusStockList.add(stockVO.get(i));
				}
			}
			if(plusStockList.size() != 0) {
				for(int j=0;j<plusStockList.size();j++) {
					System.out.println("plusStockList : " + plusStockList.get(j).getStName());
				}
				dao.stockUpdate(plusStockList);
				System.out.println("stock table data update seccess !");
			}
		}
		
		// storeopen update (오픈시간, 기본준비금 제외한 모든 데이터)
		if(storeVO.size() != 0) {
			for(int i=0;i<storeVO.size();i++) {
				System.out.println("store cash : " + storeVO.get(i).getCash());
			}
			dao.storeUpdate(storeVO);
			dao.getStoreOpen(storeVO.get(0));
			System.out.println("storeopen table data update seccess !");
		}
   
		return 0;
	}




}
