package co.yedam.cafein.store.close;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.viewvo.ViewWarehousingVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;

@Repository
public class StoreCloseDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 영업 준비금 목록 조회
	public List<ViewWarehousingVO> getWarehousing(ViewWarehousingVO vo) {
		return mybatis.selectList("storeCloseDAO.getWarehousing", vo);
	}
	
	// 마감 시재 정산 목록 조회
	public List<OrdersVO> getCashAdvance(OrdersVO vo) {
		return mybatis.selectList("storeCloseDAO.getChasAdvance", vo);
	}
	
	// 마감 재고 수량 조회
	public List<StockVO> getStockTruthList(StockVO vo) {
		return mybatis.selectList("storeCloseDAO.getStockTruthList", vo);
	}
	
	
}
