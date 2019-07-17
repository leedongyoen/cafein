package co.yedam.cafein.customer.order;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.MenuOrderVO;
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
	
	// 배달서비스 여부
	public int getstoredeliverservice(String sId){
		return dao.selectOne("StoremenuDAO.getstoredeliverservice",sId);
	}
	
	// 주문번호 가져오기
	public String getordernumber(String sId) {
		return dao.selectOne("CustomerOrderDAO.getordernumber",sId);
	}
	
	// orders 테이블에 데이터 넣기
	public int insertorder(OrdersVO vo) {
		return dao.insert("CustomerOrderDAO.insertorder",vo);
	}
	
	// 해당 메뉴의 기본 레시피 번호 가져오기
	public List<RecipeVO> getorderrecipenolist(RecipeVO vo) {
		return dao.selectList("CustomerOrderDAO.getorderrecipenolist",vo);
	}
	
	// order details 테이블에 넣기
	public int insertorderdetails(Map<String, Object> map) {
		return dao.insert("CustomerOrderDAO.insertorderdetails",map);
	}
}
