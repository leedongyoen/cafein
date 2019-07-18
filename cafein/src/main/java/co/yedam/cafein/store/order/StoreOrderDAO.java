package co.yedam.cafein.store.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.OrderDetailsVO;
import co.yedam.cafein.vo.OrdersVO;

@Repository
public class StoreOrderDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	// 해당 매장의 주문목록 가져오기
	public List<OrdersVO> getstoreorderlist(OrdersVO vo){
		return template.selectList("getStoreOrderListDAO.getstoreorderlist",vo);
	}
	
	// 해당 매장의 주문상세 가져오기
	public List<OrderDetailsVO> getstoreorderdetails(OrdersVO vo){
		return template.selectList("getStoreOrderListDAO.getstoreorderdetails",vo);
	}
	

	// 해당 매장의 주문메뉴들의 옵션들만 출력
	public List<OrderDetailsVO> getmenuoptionlist(OrderDetailsVO vo){
		return template.selectList("getStoreOrderListDAO.getmenuoptionlist",vo);
	}

	// 주문 취소 ( 매장 에서 ) 
	public int updateordercancel(OrdersVO vo){
		return template.update("getStoreOrderListDAO.updateordercancel",vo);
	}
	
	// 사용 미정
	// 해당 매장의 주문메뉴의 옵션을 묶기 위해
	public OrderDetailsVO getmenunumber(OrderDetailsVO vo){
		return template.selectOne("getStoreOrderListDAO.getmenunumber",vo);
	}
	
}
