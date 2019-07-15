package co.yedam.cafein.store.warehousing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.vo.WarehousingVO;

@Controller
public class WarehousingController {

	@Autowired
	WarehousingServiceImpl warehousingService;
	
	@RequestMapping("/warehousing.do")
	public String getWareList() {
		return "store/stockstatisticslist";
	}
	
	@ResponseBody
	@RequestMapping(value="/dateSearch", method=RequestMethod.POST)
	public List<WarehousingVO> getDateSearchList(Model model, WarehousingVO vo){
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		return warehousingService.getWarehousingList(vo);
		//return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/warehousing", method=RequestMethod.GET)
	public List<WarehousingVO> getWarehousingList(Model model, WarehousingVO vo){
		return warehousingService.getWarehousingList(vo);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/released", method=RequestMethod.GET)
	public List<WarehousingVO> getReleasedList(Model model, WarehousingVO vo){
		return warehousingService.getReleasedList(vo);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/entered")
	public List<WarehousingVO> getEnteredList(Model model, WarehousingVO vo){
		return warehousingService.getEnteredList(vo);
	}
	
}
