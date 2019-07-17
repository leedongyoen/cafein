package co.yedam.cafein.customer.order;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.MenuOrderVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.StoreVO;

@Service
public class CustomerOrderServiceImpl {

	@Autowired
	CustomerOrderDAO dao;
	
	public List<OrdersVO> getOrderList(OrdersVO vo){
		return dao.getOrderlist(vo);
	}
	
	public List<OrdersVO> mainOrderList(OrdersVO vo) {
		return dao.mainOrderList(vo);
	}
	
	public StoreVO getSearchStore(StoreVO vo) {
		return dao.getSearchStore(vo);
	}
	
	public List<RecipeVO> getOptionName(RecipeVO vo){
		return dao.getOptionName(vo);
	}
	
	public List<RecipeVO> getorderrecipeno(MenuOrderVO vo){
		return dao.getorderrecipeno(vo);
	}
	
	// 배달서비스 여부
	public int getstoredeliverservice(String sId){
		return dao.getstoredeliverservice(sId);
	}
	
	// 주문번호 가져오기
	public String getordernumber(String sId) {
		return dao.getordernumber(sId);
	}
	
	// orders 테이블에 데이터 넣기
	public int insertorder(OrdersVO vo) {
		return dao.insertorder(vo);
	}
	
	// 해당 메뉴의 기본 레시피 번호 가져오기
	public List<RecipeVO> getorderrecipenolist(RecipeVO vo) {
		return dao.getorderrecipenolist(vo);
	}
	
	
	// order details 테이블에 넣기
	public int insertorderdetails(Map<String, Object> map) {
		return dao.insertorderdetails(map);
	}
	
	// order details op_dnum 업데이트
	public int getodnum(OrdersVO vo) {
		return dao.getodnum(vo);
	}
}
