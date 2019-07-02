package co.yedam.cafein.customer.storemenu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.MenuVO;
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
}
