package co.yedam.cafein.store.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.OrdersVO;

@Repository
public class StoreMainDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 판매율 top3 메뉴 	ordersVO mName : 메뉴이름, cnt : 판매잔수, rank : 순위
	public List<OrdersVO> getSalesRank(OrdersVO vo) {
		return mybatis.selectList("storeMainDAO.getSalesRank", vo);
	}
	
}
