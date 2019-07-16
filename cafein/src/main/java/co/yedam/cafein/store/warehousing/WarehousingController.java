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
	
	@RequestMapping("/stockwarehousing.do")
	public String getStockWarehousingList() {
		return "store/stockwarehousing";
	}
	
	@RequestMapping("/stockentered.do")
	public String getStockEnteredList() {
		return "store/stockentered";
	}
	
	@RequestMapping("/stockreleased.do")
	public String getStockReleasedList() {
		return "store/stockreleased";
	}
	
	@ResponseBody
	@RequestMapping(value="/dateSearch", method=RequestMethod.POST)
	public List<WarehousingVO> getDateSearchList(Model model, WarehousingVO vo){
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		return warehousingService.getWarehousingList(vo);
	}
	@ResponseBody
	@RequestMapping(value="/dateSearchRelease", method=RequestMethod.POST)
	public List<WarehousingVO> getDateSearchReleaseList(Model model, WarehousingVO vo){
		
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		return warehousingService.getReleasedList(vo);
	}
	@ResponseBody
	@RequestMapping(value="/dateSearchEntered", method=RequestMethod.POST)
	public List<WarehousingVO> getDateSearchEnteredList(Model model, WarehousingVO vo){
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		return warehousingService.getEnteredList(vo);
	}
//	
//	@ResponseBody
//	@RequestMapping(value="/warehousing")
//	public List<WarehousingVO> getWarehousingList(Model model, WarehousingVO vo){
//		return warehousingService.getWarehousingList(vo);
//		
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="/released")
//	public List<WarehousingVO> getReleasedList(Model model, WarehousingVO vo){
//		return warehousingService.getReleasedList(vo);
//		
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="/entered")
//	public List<WarehousingVO> getEnteredList(Model model, WarehousingVO vo){
//		return warehousingService.getEnteredList(vo);
//	}
	
}
