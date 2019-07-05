package co.yedam.cafein.store.menu;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.yedam.cafein.viewvo.ViewStockCheckVO;

@Service
public class RecipeSerciveImpl {
	@Resource
	RecipeDAO recipeDao;
	
	public List<ViewStockCheckVO> getRecipeList(ViewStockCheckVO vo){
		return recipeDao.getRecipeList(vo);		
	}
	
}
