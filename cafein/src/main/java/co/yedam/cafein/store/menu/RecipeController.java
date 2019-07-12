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
	RecipeSerciveImpl service,service2;
	
	
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
	
	
	
	
	/* 0712 recipe update위해 잠시 막음
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/recipes" ,method=RequestMethod.POST //
	 * ,produces="application/json" // ,consumes="application/json" ,headers =
	 * {"Content-type=application/json" } )public Map<String, Boolean>
	 * insertRecipe(@RequestBody RecipeVO vo, Model model){
	 * 
	 * vo.setsId("SH001");
	 * 
	 * service.insertRecipe(vo); Map<String, Boolean> map = new HashMap<String,
	 * Boolean>(); map.put("result", true); return map;
	 * 
	 * 
	 * }
	 */
	
	
	
	@ResponseBody
	@RequestMapping(value="/recipes/{stAqty}"
					,method=RequestMethod.POST
				//	,produces="application/json"     
				//	,consumes="application/json"
					,headers = {"Content-type=application/json" }
			)public Map<String, Boolean> insertRecipe(@RequestBody RecipeVO vo
														,StockVO vo2
														,@PathVariable("stAqty") String stAqty
														, Model model){
		
		vo.setsId("SH001");
		System.out.println("-====================================="+stAqty);
		vo2.setStAqty(Double.parseDouble(stAqty));
		service2.updateStockAqty();
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
	
	
		
	//옵션 
		@ResponseBody
		@RequestMapping(value="/options"
						,method=RequestMethod.POST
					//	,produces="application/json"     
					//	,consumes="application/json"
						,headers = {"Content-type=application/json" }
				)public Map<String, Boolean> insertOption(@RequestBody RecipeVO vo, Model model){
			
			vo.setsId("SH001");
			//여기도 출력 안되는거보면 jsp쪽에서 수정
			System.out.println(vo.getConsum());
			
			service.insertOption(vo);
			Map<String, Boolean> map = new HashMap<String, Boolean>();
			map.put("result", true);
			return map;
			
		}	
		
		
		
		@ResponseBody
		@RequestMapping(value="/options/{recipeno}", method=RequestMethod.DELETE)
		public Map deleteOption( @PathVariable("recipeno") String recipeno, RecipeVO vo, Model model) {
			vo.setRecipeno(recipeno);
			System.out.println("controller: 전"+recipeno);
			service.deleteOption(vo);
			Map result = new HashMap<String, Object>();
			result.put("result", Boolean.TRUE);
			return result;
		}
		
		
		
	
	
}
