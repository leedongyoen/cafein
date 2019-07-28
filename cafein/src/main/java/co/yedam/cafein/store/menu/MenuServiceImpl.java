package co.yedam.cafein.store.menu;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.MenuVO;
@Service
public class MenuServiceImpl{

	@Resource
	MenuDAO menuDao;

	public List<MenuVO> getMenuList(MenuVO vo) {
		return menuDao.getMenuList(vo);
	}
	
	public int insertUser(MenuVO vo) {		
		return menuDao.insertMenu(vo);
	}
	public int updateUser(MenuVO vo) {
		return menuDao.updateMenu(vo);
	}
	public int deleteUser(MenuVO vo) {
		return menuDao.deleteMenu(vo);
	}

	public int updateFile(MenuVO vo) {
		return menuDao.updateFile(vo);
	}
	
	public int insertMenuProc1(MenuVO vo) {
		return menuDao.insertMenuProc1(vo);
	}
	
}
