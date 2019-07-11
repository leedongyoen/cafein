package co.yedam.cafein.store.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.cafein.viewvo.ViewStockCheckVO;
import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.StockVO;

@RestController
public class RecipeController {
	@Autowired
	RecipeSerciveImpl service;
	
	//조건있는 전체조회
	@RequestMapping(value="/recipes/{sId}/{mNum}", method=RequestMethod.GET)
	public List<ViewStockCheckVO> getRecipeList(
								@PathVariable("sId") String sId
								, @PathVariable("mNum") String mNum
								,ViewStockCheckVO vo
								,Model model){
		vo.setsId(sId);
		vo.setmNum(mNum);
		return service.getRecipeList(vo);
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/recipes/{recipeno}", method=RequestMethod.DELETE)
	public Map deleteRecipe( @PathVariable("recipeno") String recipeno, RecipeVO vo, Model model) {
		vo.setRecipeno(recipeno);
		System.out.println("controller: 전"+recipeno);
		service.deleteRecipe(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/recipes"
					,method=RequestMethod.POST
				//	,produces="application/json"     
				//	,consumes="application/json"
					,headers = {"Content-type=application/json" }
			)public Map<String, Boolean> insertRecipe(@RequestBody RecipeVO vo, Model model){
		
		vo.setsId("SH001");
		
		service.insertRecipe(vo);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", true);
		return map;
		
		
	}	
	
	
	
	//stock caNum List 받아옴
		@RequestMapping(value="/recipes/{sId}", method=RequestMethod.GET)
		public List<StockVO> getStockCaNumList(
									@PathVariable("sId") String sId
									
									,StockVO vo
									,Model model){
			vo.setsId(sId);
			return service.getRecipeStockList(vo);
		}
	
	
	
	
}
