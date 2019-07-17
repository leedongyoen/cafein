package co.yedam.cafein.customer.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.CustomerMainVO;

@Repository
public class CustomerMainDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	//고객이 사용한 매장 순위 리스트
	public List<CustomerMainVO> getLikeStoreList(CustomerMainVO vo) {
		return mybatis.selectList("CustomerMainDAO.getLikeStoreList", vo);
	}
	
	//메인에서 고객이사용한 매장 1순위 리스트
	public 	List<CustomerMainVO> mainLikeStoreList(CustomerMainVO vo) {
		return mybatis.selectList("CustomerMainDAO.mainLikeStoreList", vo);
	}

	//고객이 자주 찾은 메뉴 리스트
	public 	List<CustomerMainVO> getLikeMenuList(CustomerMainVO vo) {
		return mybatis.selectList("CustomerMainDAO.getLikeMenuList", vo);
	}

	//메인에서 고객이자주 이용한 메뉴 리스트
	public List<CustomerMainVO> mainLikeMenuList(CustomerMainVO vo) {
		return mybatis.selectList("CustomerMainDAO.mainLikeMenuList", vo);
	}
	
	
	
}
