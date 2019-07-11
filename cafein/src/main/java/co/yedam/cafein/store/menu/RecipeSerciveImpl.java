package co.yedam.cafein.store.menu;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.yedam.cafein.viewvo.ViewStockCheckVO;
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.StockVO;

@Service
public class RecipeSerciveImpl {
	@Resource
	RecipeDAO recipeDao;
	
	public List<ViewStockCheckVO> getRecipeList(ViewStockCheckVO vo){
		return recipeDao.getRecipeList(vo);		
	}
	
	public List<StockVO> getRecipeStockList(StockVO vo){
		System.out.println("=========================="+vo.getsId());
		return recipeDao.getRecipeStockList(vo);
	}
	
	public int insertRecipe(RecipeVO vo) {
		return recipeDao.insertRecipe(vo);
	}

	public int deleteRecipe(RecipeVO vo) {
		return recipeDao.deleteRecipe(vo);
	}
	
	public int insertOption(RecipeVO vo) {
		return recipeDao.insertOption(vo);
	}
	
	public int deleteOption(RecipeVO vo) {
		return recipeDao.deleteOption(vo);
	}
	
}
