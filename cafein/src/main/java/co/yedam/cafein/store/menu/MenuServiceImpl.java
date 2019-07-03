package co.yedam.cafein.store.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.MenuVO;
@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuDAO menuDao;

	@Override
	public List<MenuVO> getMenuList(MenuVO vo) {
		return menuDao.getMenuList(vo);
	}
	


}
