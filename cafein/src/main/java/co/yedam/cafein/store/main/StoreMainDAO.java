package co.yedam.cafein.store.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;

@Repository
public class StoreMainDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 판매율 top3 메뉴 	ordersVO mName : 메뉴이름, cnt : 판매잔수, rank : 순위
	public List<OrdersVO> getSalesRank(OrdersVO vo) {
		return mybatis.selectList("storeMainDAO.getSalesRank", vo);
	}
	
	// 재고 소모량 TOP3  	StockVO stName : 메뉴이름, stUnit : 재고단위, stQty : 소모수량, rank : 순위
	public List<StockVO> getStockLess(StockVO vo) {
		return mybatis.selectList("storeMainDAO.getStockLess", vo);
	}
	
	
	// 마일리지 현황	 	ordersVO mileage : 사용된 마일리지, addmileage : 적립된 마일리지
	public List<OrdersVO> getMileageInfo(OrdersVO vo) {
		return mybatis.selectList("storeMainDAO.mileageinfo", vo);
	}
	
}
