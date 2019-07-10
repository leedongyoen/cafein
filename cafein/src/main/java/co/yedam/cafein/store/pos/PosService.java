package co.yedam.cafein.store.pos;

import java.util.List;

import co.yedam.cafein.vo.MenuVO;

public interface PosService {
	
	List<MenuVO> getStoreMenuList(MenuVO vo);
	

}
