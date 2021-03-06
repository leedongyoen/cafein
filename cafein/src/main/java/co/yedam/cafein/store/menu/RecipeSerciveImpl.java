package co.yedam.cafein.store.menu;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.yedam.cafein.store.stock.StoreStockDAO;
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
	
	public List<RecipeVO> getRecipeDetailList(ViewStockCheckVO vo){
		System.out.println("=========================="+vo.getsId());
		return recipeDao.getRecipeDetailList(vo);
	}
	
	public int insertRecipe(RecipeVO vo) {
		return recipeDao.insertRecipe(vo);
	}
	
	public int recipeInsertProc1(RecipeVO vo) {
		return recipeDao.recipeInsertProc1(vo);
	}
	
	public int recipeDeleteProc1(RecipeVO vo) {
		return recipeDao.recipeDeleteProc1(vo);
	}
	public int recipeUpdateProc1(RecipeVO vo) {
		return recipeDao.recipeUpdateProc1(vo);
	}
	
	public int optionUpdateProc1(RecipeVO vo) {
		return recipeDao.optionUpdateProc1(vo);
	}

	public int deleteRecipe(RecipeVO vo) {
		return recipeDao.deleteRecipe(vo);
	}
	
	public int insertOption(RecipeVO vo) {
		return recipeDao.insertOption(vo);
	}
	
	public int optionInsertProc1(RecipeVO vo) {
		return recipeDao.optionInsertProc1(vo);
	}
	
	public int deleteOption(RecipeVO vo) {
		return recipeDao.deleteOption(vo);
	}

	public int updateStockAqty(StockVO vo) {
		return recipeDao.updateAqty(vo);
		
	}
}
