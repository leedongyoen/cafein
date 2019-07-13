package co.yedam.cafein.customer.storemenu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.ReserveVO;
import co.yedam.cafein.vo.StoreVO;

@Repository
public class StoreListMenuDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public List<StoreVO> getStoreList(StoreVO vo){
		return template.selectList("StoremenuDAO.getStoreList", vo);
	}
	
	public List<MenuVO> getMenuList(MenuVO vo){
		return template.selectList("StoremenuDAO.getMenuList",vo);
	}
	
	public List<StoreVO> getSearchStoreList(StoreVO vo){
		return template.selectList("StoremenuDAO.getStoreList", vo);
	}

	
	public ReserveVO getReserve(ReserveVO vo) {
		return template.selectOne("StoremenuDAO.getReserve",vo);
	}
	
	public List<RecipeVO> getmenuoptionlist(RecipeVO vo) {
		return template.selectList("StoremenuDAO.getmenuoptionlist",vo);
	}
	
	public MenuVO getmenudetail(MenuVO vo){
		return template.selectOne("StoremenuDAO.getmenudetail",vo);
	}
}
