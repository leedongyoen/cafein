package co.yedam.cafein.store.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.viewvo.ViewStockCheckVO;

@Repository
public class RecipeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ViewStockCheckVO> getRecipeList(ViewStockCheckVO vo){
		System.out.println("-> mybatis getRecipeList 을 이용함");
		return mybatis.selectList("RecipeDAO.getRecipeList", vo);
	}
	
}
