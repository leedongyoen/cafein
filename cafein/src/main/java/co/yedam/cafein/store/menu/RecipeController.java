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
import org.springframework.web.servlet.ModelAndView;

import co.yedam.cafein.viewvo.ViewStockCheckVO;
import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.StockVO;

@RestController
public class RecipeController {
	@Autowired
	RecipeSerciveImpl service,service2;
	
	//議곌굔�엳�뒗 �쟾泥댁“�쉶
	
	  @RequestMapping(value="/recipes/{sId}/{mNum}",
	  method=RequestMethod.GET) public List<ViewStockCheckVO> getRecipeList(
	  
	  @PathVariable("sId") String sId , @PathVariable("mNum") String mNum
	  ,ViewStockCheckVO vo ,Model model){
	  
	  
	  vo.setsId(sId); vo.setmNum(mNum); 
	  //service.getRecipeDetailList(vo); 
	  
	  return service.getRecipeList(vo);
	  
	  }
	 
	
	@ResponseBody
	@RequestMapping(value="/recipes/{sId}/{recipeno}/{turnNo}", method=RequestMethod.DELETE)
	public Map deleteRecipe(@PathVariable("sId") String sId,
							@PathVariable("recipeno") String recipeno,
							@PathVariable("turnNo") String turnNo,
							RecipeVO vo, Model model) {
		
		vo.setsId(sId);
		vo.setRecipeno(recipeno);
		vo.setTurnNo(Integer.parseInt(turnNo));
		System.out.println("vo: "+vo);
		service.recipeDeleteProc1(vo);
		
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	
	
	
	
	/* 0712 recipe update�쐞�빐 �옞�떆 留됱쓬
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
	@RequestMapping(value="/recipes/{sId}"
					,method=RequestMethod.POST
				//	,produces="application/json"     
				//	,consumes="application/json"
					,headers = {"Content-type=application/json" }
			)public Map<String, Boolean> insertRecipe(@RequestBody RecipeVO vo
														,StockVO vo2
														,@PathVariable("sId") String sId
														//,@PathVariable("stAqty") String stAqty
														//,@PathVariable("stanUnit") String stanUnit
														, Model model){
		
		//procedure 사용
		vo.setsId(sId);
		System.out.println("vo: "+vo);
		service.recipeInsertProc1(vo);
		
		
		/*
		 * vo.setsId(sId); double staaqty = Double.parseDouble(stAqty); int stanuunit =
		 * Integer.parseInt(stanUnit); vo2.setStAqty(staaqty/stanuunit);
		 * vo2.setStNum(vo.getStNum()); vo.setConsum(staaqty/stanuunit);
		 * 
		 * service2.updateStockAqty(vo2); service.insertRecipe(vo);
		 */
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", true);
		return map;
		
		
	}	
	

	
	@ResponseBody
	@RequestMapping(value="/recipes/{sId}"
					, method=RequestMethod.PUT
					,consumes="application/json" 
					)
	public RecipeVO updateRecipe(@RequestBody RecipeVO vo,@PathVariable("sId") String sId , Model model) {
		vo.setsId(sId);
		service.recipeUpdateProc1(vo);
		return vo;
	}
	
	
	//stock caNum List 諛쏆븘�샂
	
	  @RequestMapping(value="/recipes/{sId}", method=RequestMethod.GET) public
	  List<StockVO> getStockCaNumList(
	  
	  @PathVariable("sId") String sId ,StockVO vo ,Model model){ vo.setsId(sId);
	  return service.getRecipeStockList(vo); }
	 
	
		
	//�샃�뀡 
		@ResponseBody
		@RequestMapping(value="/options/{sId}"
						,method=RequestMethod.POST
					//	,produces="application/json"     
					//	,consumes="application/json"
						,headers = {"Content-type=application/json" }
				)public Map<String, Boolean> insertOption(@RequestBody RecipeVO vo, @PathVariable("sId") String sId , Model model){
			
			vo.setsId(sId);
			
			System.out.println("vo: "+vo);
			
			service.optionInsertProc1(vo);
			Map<String, Boolean> map = new HashMap<String, Boolean>();
			map.put("result", true);
			return map;
			
		}	
		
		
		
		@ResponseBody
		@RequestMapping(value="/options/{sId}/{recipeno}", method=RequestMethod.DELETE)
		public Map deleteOption( 
									@PathVariable("sId") String sId,
									@PathVariable("recipeno") String recipeno,
									RecipeVO vo, Model model) {
			
			vo.setsId(sId);
			vo.setRecipeno(recipeno);
			System.out.println("vo:"+vo);
			service.deleteOption(vo);
			Map result = new HashMap<String, Object>();
			result.put("result", Boolean.TRUE);
			return result;
		}
		
		
		
		//ice hot �씠 stnum�씠  null�씠�씪 湲됲븯寃� 媛��졇�샂
	
	  @RequestMapping(value="/options", method=RequestMethod.GET)
	  public List<RecipeVO> getRecipeIceHotList(
			  									//@PathVariable("sId") String sId ,
			  									//@PathVariable("mNum") String mNum ,
			  									ViewStockCheckVO vo ,Model model){
		  
		  System.out.println("vo: "+vo);
		  return service.getRecipeDetailList(vo);
	  
	  }
	  
		@ResponseBody
		@RequestMapping(value="/options/{sId}"
						, method=RequestMethod.PUT
						,consumes="application/json" 
						)
		public RecipeVO updateOption(
										@RequestBody RecipeVO vo,
										@PathVariable("sId") String sId ,
										Model model) {
			vo.setsId(sId);
			System.out.println("vo: "+vo);
			service.optionUpdateProc1(vo);
			return vo;
		} 
	
	
}
