package co.yedam.cafein.store.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import co.yedam.cafein.vo.MenuVO;

@Repository
public class MenuDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MenuVO> getMenuList(MenuVO vo) {
		System.out.println("-> mybatis insertBoard procedure 을 이용함");
		return mybatis.selectList("MenuDAO.getMenuList", vo);
	}
	
}
