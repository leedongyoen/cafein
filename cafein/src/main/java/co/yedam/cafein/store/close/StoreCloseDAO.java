package co.yedam.cafein.store.close;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.viewvo.ViewWarehousingVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;
import co.yedam.cafein.vo.StoreOpenVO;
import co.yedam.cafein.vo.WarehousingVO;

@Repository
public class StoreCloseDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 영업 지출금 목록 조회
	public List<ViewWarehousingVO> getWarehousing(ViewWarehousingVO vo) {
		return mybatis.selectList("storeCloseDAO.getWarehousing", vo);
	}
	
	// 마감 시재 정산 목록 조회
	public List<OrdersVO> getCashAdvance(OrdersVO vo) {
		return mybatis.selectList("storeCloseDAO.getChasAdvance", vo);
	}
	
	public StoreOpenVO getStoreOpen(StoreOpenVO vo) {
		return mybatis.selectOne("storeCloseDAO.getStoreOpen", vo);
	}
	
	// 마감 재고 수량 조회
	public List<StockVO> getStockTruthList(StockVO vo) {
		return mybatis.selectList("storeCloseDAO.getStockTruthList", vo);
	}
	
	// 마감 영수증을 위한 결제내역(현금/카드) 조회
	public List<OrdersVO> getCloseReceiptCash(OrdersVO vo) {
		return mybatis.selectList("storeCloseDAO.getCloseReceiptCash", vo);
	}
	
	// 마감 영수증을 위한 결제내역(마일리지/총매출액) 조회
	public List<OrdersVO> getCloseReceiptMileage(OrdersVO vo) {
		return mybatis.selectList("storeCloseDAO.getCloseReceiptMileage", vo);
	}
	
	// 마감 영수증을 위한 환불내역 조회
	public List<OrdersVO> getRefundInfo(OrdersVO vo) {
		return mybatis.selectList("storeCloseDAO.getRefundInfo", vo);
	}
	
	
	//----------마감 정산 시 DB에 데이터 insert 및 update------------
	
	// 영업 지출금(추가된 재고)가 존재할 경우 insert
	public int warehousingInsertAddStock(List<WarehousingVO> vo) {
		return mybatis.insert("storeCloseDAO.warehousingInsertAddStock", vo);
	}
	
	// 손실된 재고량이 존재하며 0보다 크거나 작은 경우 insert
	public int warehousingInsertLoss(List<WarehousingVO> vo) {
		return mybatis.insert("storeCloseDAO.warehousingInsertLoss", vo);
	}
	
	// 재고 수량이 변경되었다면 수량과 재고수량에 따른 재고상태를 update
	public int stockUpdate(List<StockVO> vo) {
		return mybatis.insert("storeCloseDAO.stockUpdate", vo);
	}
	
	// 재고 수량이 변경되었다면 수량과 재고수량에 따른 재고상태를 update
	public int storeUpdate(List<StoreOpenVO> vo) {
		return mybatis.insert("storeCloseDAO.storeUpdate", vo);
	}
	
	//----------------마감 정산 내역 PDF 조회 및 저장-----------------
	public List<Map<String, Object>> storeReceipt(StoreOpenVO vo){
		return mybatis.selectList("storeCloseDAO.storeReceipt",vo);
	}
	
	public List<StoreOpenVO> storeReceiptList(StoreOpenVO vo) {
		return mybatis.selectList("storeCloseDAO.storeReceiptList", vo);
	}
	
	// 페이징 처리를 위함
	public int storeReceiptListPaging(StoreOpenVO vo) {
		return mybatis.selectOne("storeCloseDAO.storeReceiptListPaging", vo);
	}
	
}
