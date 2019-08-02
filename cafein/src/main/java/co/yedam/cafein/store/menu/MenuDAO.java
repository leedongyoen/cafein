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
	
	public int insertMenu(MenuVO vo) {
		System.out.println("-> mybatis insertMenu()");
		return mybatis.insert("MenuDAO.insertMenu",vo);
	}
	
	public int updateMenu(MenuVO vo) {
		System.out.println("-> mybatis updateMenu()");
		return mybatis.update("MenuDAO.updateMenu",vo);
	}
	public int deleteMenu(MenuVO vo) {
		System.out.println("-> mybatis deleteMenu()");
		return mybatis.delete("MenuDAO.deleteMenu",vo);
	}
	
	public int updateFile(MenuVO vo) {
		System.out.println("-> update file");
		return mybatis.update("MenuDAO.updateFile",vo);
	}
	
	public List<MenuVO> getMenuList(MenuVO vo) {
		System.out.println("-> mybatis insertBoard procedure 을 이용함");
		return mybatis.selectList("MenuDAO.getMenuList", vo);
	}
	
	public List<MenuVO> getMenuListAll(MenuVO vo){
		System.out.println("-> mybatis getMenuListAll procedure 을 이용함");
		return mybatis.selectList("MenuDAO.getMenuListAll", vo);
	}
	
	public int insertMenuProc1(MenuVO vo) {
		System.out.println("-> mybatis insertMenuProc1()");
		return mybatis.insert("MenuDAO.insertMenuProc1",vo);
	}
	
}
