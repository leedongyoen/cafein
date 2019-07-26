package co.yedam.cafein.store.order;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import co.yedam.cafein.common.Paging;
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
	
	// 전체건수
	public int getstoreorderlistCount(OrdersVO vo) {
		return template.selectOne("getStoreOrderListDAO.getstoreorderlistCount",vo);
	}
	
	// 해당 매장의 주문상세 가져오기
	public List<OrderDetailsVO> getstoreorderdetails(OrdersVO vo){
		return template.selectList("getStoreOrderListDAO.getstoreorderdetails",vo);
	}
	

	// 해당 매장의 주문메뉴들의 옵션들만 출력
	public List<OrderDetailsVO> getmenuoptionlist(OrderDetailsVO vo){
		return template.selectList("getStoreOrderListDAO.getmenuoptionlist",vo);
	}
//-------------------------------------------------------------------------------------
	
	// 주문 취소 ( 매장 에서 ) 
	public int updateordercancel(OrdersVO vo){
		return template.update("getStoreOrderListDAO.updateordercancel",vo);
	}
	
	// 주문 취소 ( 매장 에서 ) 
	public int updateordermileage(OrdersVO vo){
		return template.update("getStoreOrderListDAO.updateordermileage",vo);
	}
	
	// 주문 승인 ( 매장 에서 ) 
	public int updateorderapply(OrdersVO vo){
		return template.update("getStoreOrderListDAO.updateorderapply",vo);
	}
	
	// 매장의 배달 소요시간이 지난 주문 목록 가져오기. ( 배달대기인 것만 )
	public List<OrdersVO> getdeliverytatuscheck(){
		return template.selectList("getStoreOrderListDAO.getdeliverytatuscheck");
	}
	
	// 매장 배달대기에서 배달완료로 바꾸기 ( 소요시간 지나면 ) 
	public int updatedeliverystatus(OrdersVO vo){
		return template.update("getStoreOrderListDAO.updatedeliverystatus",vo);
	}
	
	// 모든 매장에 주문이 들어온지 5분이 지났는지 프로시절 호출
	public void schedulerordertimecheck() {
		template.selectOne("getStoreOrderListDAO.schedulerordertimecheck");
	}
	
//-------------------------------------------------------------------------------------


	public void stockupdate() {
		template.selectOne("getStoreOrderListDAO.stockupdate");
	}
	
//-------------------------------------------------------------------------------------
	
	// 사용 미정
	// 해당 매장의 주문메뉴의 옵션을 묶기 위해
	public OrderDetailsVO getmenunumber(OrderDetailsVO vo){
		return template.selectOne("getStoreOrderListDAO.getmenunumber",vo);
	}
	
}
