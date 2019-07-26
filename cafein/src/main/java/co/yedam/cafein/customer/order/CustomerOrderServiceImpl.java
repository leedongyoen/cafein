package co.yedam.cafein.customer.order;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.CustomerVO;
import co.yedam.cafein.vo.MenuOrderVO;
import co.yedam.cafein.vo.OrderDetailsVO;
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
	
	// 고객 페이지 - 주문 클릭시 메뉴 상세 
	public List<OrderDetailsVO> getcustomerordermenudetail(OrdersVO vo){
		return dao.getcustomerordermenudetail(vo);
	}
	
	// 고객 페이지 - 주문 클릭시 주문 상세 
	public OrdersVO getcustomeroderdetail(OrdersVO vo){
		return dao.getcustomeroderdetail(vo);
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
	
	// 자주 이용하는 매장
	public List<StoreVO> gettopstorelist(CustomerVO vo){
		return dao.gettopstorelist(vo);
	}
	
	// 배달서비스 여부
	public int getstoredeliverservice(String sId){
		return dao.getstoredeliverservice(sId);
	}
	
	// 마일리지 서비스 여부
	public String getstoremileageservice(String sId) {
		return dao.getstoremileageservice(sId);
	}
	
	// 주문번호 가져오기
	public String getordernumber(String sId) {
		return dao.getordernumber(sId);
	}
	
	// orders 테이블에 데이터 넣기
	public int insertorder(OrdersVO vo) {
		return dao.insertorder(vo);
	}
	
	// 마일리지 사용한 만큼 빼기
	public int setcanclemileage(OrdersVO vo) {
		return dao.setcanclemileage(vo);
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
	
	// order details 다중일 경우 op_dnum 업데이트
	public int getmutilodnum(OrdersVO vo) {
		return dao.getmutilodnum(vo);
	}
	
	// 주문 끝나고 마일리지 업데이트
	public int updatemileage(OrdersVO vo) {
		return dao.updatemileage(vo);
	}
	
	// 만약 해당 매장의 마일리지가 없을 경우
	public int insertmileage(OrdersVO vo) {
		return dao.insertmileage(vo);
	}
	
	// 주문페이지에서 고객이 입력한 주소와 선택한 매장과의 거리 계산을 위해서
	public StoreVO getorderstoreaddress(StoreVO vo) {
		return dao.getorderstoreaddress(vo);
	}
	
	// 고객이 직접 주문 취소한 경우
	public int updatecusordercancel(OrdersVO vo) {
		return dao.updatecusordercancel(vo);
	}

	public int getodnum2(OrdersVO vo) {
		return dao.getodnum2(vo);
		
	}
}
