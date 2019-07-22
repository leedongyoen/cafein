package co.yedam.cafein.customer.order;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.CustomerVO;
import co.yedam.cafein.vo.MenuOrderVO;
import co.yedam.cafein.vo.OrderDetailsVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.StoreVO;

@Repository
public class CustomerOrderDAO {
	@Autowired
	private SqlSessionTemplate dao;
	
	public List<OrdersVO> getOrderlist(OrdersVO vo){
		return dao.selectList("CustomerOrderDAO.getOrderlist",vo);
	}
	
	// 고객 페이지 - 주문 클릭시 메뉴 상세
	public List<OrderDetailsVO> getcustomerordermenudetail(OrdersVO vo){
		return dao.selectList("CustomerOrderDAO.getcustomerordermenudetail",vo);
	}
	
	// 고객 페이지 - 주문 클릭시 주문 상세 
	public OrdersVO getcustomeroderdetail(OrdersVO vo){
		return dao.selectOne("CustomerOrderDAO.getcustomeroderdetail",vo);
	}
	
	//메인에서 가져올 총주문금액 리스트
	public List<OrdersVO> mainOrderList(OrdersVO vo) {
		return dao.selectList("CustomerOrderDAO.mainOrderList", vo);
	}
	
	
	public StoreVO getSearchStore(StoreVO vo){
		return dao.selectOne("StoremenuDAO.getSearchStore",vo);
	}
	
	
	public List<RecipeVO> getOptionName(RecipeVO vo){
		return dao.selectList("RecipeDAO.getOptionName",vo);
	}
	
	public List<RecipeVO> getorderrecipeno(MenuOrderVO vo){
		return dao.selectList("RecipeDAO.getorderrecipeno",vo);
	}
	
	// 자주 이용하는 매장
	public List<StoreVO> gettopstorelist(CustomerVO vo){
		return dao.selectList("StoremenuDAO.gettopstorelist",vo);
	}
	
	// 배달서비스 여부
	public int getstoredeliverservice(String sId){
		return dao.selectOne("StoremenuDAO.getstoredeliverservice",sId);
	}
	
	// 마일리지 서비스 여부
	public String getstoremileageservice(String sId) {
		return dao.selectOne("StoremenuDAO.getstoremileageservice",sId);
	}
	
	
	// 주문번호 가져오기
	public String getordernumber(String sId) {
		return dao.selectOne("CustomerOrderDAO.getordernumber",sId);
	}
	
	// orders 테이블에 데이터 넣기
	public int insertorder(OrdersVO vo) {
		return dao.insert("CustomerOrderDAO.insertorder",vo);
	}
	
	// 마일리지 사용한 만큼 빼기
	public int setcanclemileage(OrdersVO vo) {
		return dao.update("CustomerOrderDAO.setcanclemileage",vo);
	}
	
	// 해당 메뉴의 기본 레시피 번호 가져오기
	public List<RecipeVO> getorderrecipenolist(RecipeVO vo) {
		return dao.selectList("CustomerOrderDAO.getorderrecipenolist",vo);
	}
	
	// order details 테이블에 넣기
	public int insertorderdetails(Map<String, Object> map) {
		return dao.insert("CustomerOrderDAO.insertorderdetails",map);
	}
	
	// order details op_dnum 업데이트
	public int getodnum(OrdersVO vo) {
		return dao.update("CustomerOrderDAO.getodnum",vo);
	}
	
	// 주문 끝나고 마일리지 업데이트
	public int updatemileage(OrdersVO vo) {
		return dao.update("CustomerOrderDAO.updatemileage",vo);
	}
	
	// 만약 해당 매장의 마일리지가 없을 경우
	public int insertmileage(OrdersVO vo) {
		return dao.insert("CustomerOrderDAO.insertmileage",vo);
	}

	// 다건주문인데 안겹치려고 잠깐 만들었습니다. order details op_dnum 업데이트
	public int getodnum2(OrdersVO vo) {
		return dao.update("CustomerOrderDAO.getodnum2",vo);
	}
}
