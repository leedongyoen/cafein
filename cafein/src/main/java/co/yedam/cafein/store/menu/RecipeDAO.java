package co.yedam.cafein.store.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.viewvo.ViewStockCheckVO;
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.StockVO;

@Repository
public class RecipeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ViewStockCheckVO> getRecipeList(ViewStockCheckVO vo){
		System.out.println("-> mybatis getRecipeList �쓣 �씠�슜�븿stock �젙蹂�");
		return mybatis.selectList("RecipeDAO.getRecipeList", vo);
	}
	
	public List<StockVO> getRecipeStockList(StockVO vo){
		return mybatis.selectList("RecipeDAO.getRecipeStockList",vo);
	}
	
	public List<RecipeVO> getRecipeDetailList(ViewStockCheckVO vo){
		System.out.println("");
		return mybatis.selectList("RecipeDAO.getReciDetailList",vo);
	}
	
	
	public int insertRecipe(RecipeVO vo) {
		System.out.println("mybatis insertRecipe");
		return mybatis.insert("RecipeDAO.insertRecipe",vo);
	}
	
	public int deleteRecipe(RecipeVO vo) {
		System.out.println("mybatis insertRecipe");
		return mybatis.delete("RecipeDAO.deleteRecipe",vo);
	}
	
	public int recipeDeleteProc1(RecipeVO vo) {
		System.out.println("mybatis recipeDeleteProc1");
		return mybatis.delete("RecipeDAO.recipeDeleteProc1",vo);
	}
	
	public int recipeInsertProc1(RecipeVO vo) {
		System.out.println("mybatis insertRecipe");
		return mybatis.insert("RecipeDAO.recipeInsertProc1",vo);
	}
	
	public int recipeUpdateProc1(RecipeVO vo) {
		System.out.println("mybatis recipeUpdateProc1");
		return mybatis.update("RecipeDAO.recipeUpdateProc1",vo);
	}
	
	
	public int updateAqty(StockVO vo) {
		System.out.println("mybatis updateAqty");
		return mybatis.update("RecipeDAO.stockAqtyUpdate",vo);
	}	
	
	
	public int insertOption(RecipeVO vo) {
		System.out.println("mybatis insertOption");
		return mybatis.insert("RecipeDAO.insertOption",vo);
	}
	
	public int optionInsertProc1(RecipeVO vo) {
		System.out.println("mybatis optionInsertProc1");
		return mybatis.insert("RecipeDAO.optionInsertProc1",vo);
	}
	
	public int deleteOption(RecipeVO vo) {
		System.out.println("mybatis delete Option");
		return mybatis.delete("RecipeDAO.deleteOption",vo);
	}
	
}
