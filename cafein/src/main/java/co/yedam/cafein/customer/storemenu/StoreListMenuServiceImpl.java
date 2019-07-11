package co.yedam.cafein.customer.storemenu;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.ReserveVO;
import co.yedam.cafein.vo.StoreVO;

@Service
public class StoreListMenuServiceImpl {
	
	@Resource
	StoreListMenuDAO dao;

	public List<StoreVO> getStoreList(StoreVO vo){
		return dao.getStoreList(vo);
	}
	
	public List<MenuVO> getMenuList(MenuVO vo){
		return dao.getMenuList(vo);
	}
	
	public List<StoreVO> getSearchStoreList(StoreVO vo){
		return dao.getSearchStoreList(vo);
	}
	
	public StoreVO getgetSearchStore(StoreVO vo) {
		return dao.getSearchStore(vo);
	}
	
	public ReserveVO getReserve(ReserveVO vo) {
		return dao.getReserve(vo);
	}
	
	public List<RecipeVO> getmenuoptionlist(RecipeVO vo) {
		return dao.getmenuoptionlist(vo);
	}
	
	public MenuVO getmenudetail(MenuVO vo){
		return dao.getmenudetail(vo);
	}
}
