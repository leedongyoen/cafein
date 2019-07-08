package co.yedam.cafein.customer.storemenu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.ReserveVO;
import co.yedam.cafein.vo.StoreVO;

@Repository
public class StoreListMenuDAO {

	@Autowired
	private SqlSessionTemplate dao;
	
	public List<StoreVO> getStoreList(StoreVO vo){
		return dao.selectList("StoremenuDAO.getStoreList", vo);
	}
	
	public List<MenuVO> getMenuList(MenuVO vo){
		return dao.selectList("StoremenuDAO.getMenuList",vo);
	}
	
	public List<StoreVO> getSearchStoreList(StoreVO vo){
		return dao.selectList("StoremenuDAO.getStoreList", vo);
	}
	
	public StoreVO getSearchStore(StoreVO vo){
		return dao.selectOne("StoremenuDAO.getSearchStore",vo);
	}
	
	public ReserveVO getReserve(ReserveVO vo) {
		return dao.selectOne("StoremenuDAO.getReserve",vo);
	}
}
