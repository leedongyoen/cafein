package co.yedam.cafein.store.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.cafein.viewvo.ViewStockCheckVO;

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
	
	
}
