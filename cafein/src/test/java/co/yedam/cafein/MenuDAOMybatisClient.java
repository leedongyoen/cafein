package co.yedam.cafein;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import co.yedam.cafein.store.menu.MenuDAO;
import co.yedam.cafein.vo.MenuVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/applicationContext.xml")

public class MenuDAOMybatisClient {

	@Autowired
	MenuDAO dao;
	MenuVO vo;
	@Test
	private void menuList() {

		vo = new MenuVO();
		List<MenuVO> list = dao.getMenuList(vo);
		for(MenuVO menu : list) {
		System.out.println(menu.toString());
		}
	}
}
