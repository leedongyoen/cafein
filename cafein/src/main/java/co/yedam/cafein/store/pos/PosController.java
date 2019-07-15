package co.yedam.cafein.store.pos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import co.yedam.cafein.viewvo.ViewPosCusSearchVO;
import co.yedam.cafein.viewvo.ViewPosVO;

import co.yedam.cafein.vo.RecipeVO;

@Controller
public class PosController {
	@Autowired
	PosService posService;
	
	//메뉴조회
	@ResponseBody
	@RequestMapping(value="/pos/{sId}", method=RequestMethod.GET)
	public List<ViewPosVO> getStoreMenuList(ViewPosVO vo, @PathVariable("sId") String sId){
		vo.setsId(sId);
		System.out.println("dd");
		return posService.getStoreMenuList(vo);
	}
	//옵션조회
	@ResponseBody
	@RequestMapping(value="/pos", method=RequestMethod.GET)
	public List<RecipeVO> getOptionList(RecipeVO vo){
		System.out.println("rr");
		return posService.getOptionList(vo);
	}
	// 고객조회
	@ResponseBody
	@RequestMapping(value = "/searchcuslist", method = RequestMethod.GET)
	public List<ViewPosCusSearchVO> getCusList(ViewPosCusSearchVO vo) {
		System.out.println("고객조회");
		return posService.getCusList(vo);
	}
}
