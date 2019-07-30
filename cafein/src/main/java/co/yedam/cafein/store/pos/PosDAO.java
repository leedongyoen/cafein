package co.yedam.cafein.store.pos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.viewvo.ViewPosOrdetailsVO;
import co.yedam.cafein.viewvo.ViewPosCusSearchVO;
import co.yedam.cafein.viewvo.ViewPosVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.RecipeVO;

@Repository
public class PosDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	//메뉴뿌리기
	public List<ViewPosVO> getStoreMenuList(ViewPosVO vo){
		System.out.println("===> Mybatis getStoreMenuList()");
		return mybatis.selectList("PosDAO.getStoreMenuList", vo);
	}
	//옵션선택
	public List<RecipeVO> getOptionList(RecipeVO vo){
		System.out.println("===> Mybatis getOptionList()");
		return mybatis.selectList("PosDAO.getOptionList", vo);
	}
	//고객조회
	public List<ViewPosCusSearchVO> getCusList(ViewPosCusSearchVO vo) {
		System.out.println("===> Mybatis getCus()");
		return mybatis.selectList("PosDAO.getCusList", vo);
	}
	
	//환불위한 주문이력조회
	public List<OrdersVO> getCusRefund(OrdersVO vo){
		System.out.println("===> Mybatis getCusRefund()");
		return mybatis.selectList("PosDAO.getCusRefund",vo);
	}
	//주문 상세조회
	public List<ViewPosOrdetailsVO> getOrDetails(ViewPosOrdetailsVO vo){
		System.out.println("===> Mybatis getOrDetails()");
		System.out.println(vo.getoNum());
		return mybatis.selectList("PosDAO.getOrDetails",vo);
	}
	//환불
	public void refoundcall(OrdersVO vo) {
		System.out.println("===> Mybatis refoundcall()");
		mybatis.insert("PosDAO.refoundcall",vo);
	}
	//알람 숫자로 띄우기
	public int orderalarmcount(OrdersVO vo) {
		System.out.println("===> Mybatis ordercountalarm()");
		System.out.println(vo.getoNum());
		return mybatis.selectOne("PosDAO.orderalarmcount",vo);
	}
	
}
