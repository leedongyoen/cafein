package co.yedam.cafein.store.warehousing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.vo.WarehousingVO;

@Controller
public class WarehousingController {

	@Autowired
	WarehousingService warehousingService;
	//재고 전체통계 페이지 이동
	@RequestMapping("/stockwarehousing.do")
	public String getStockWarehousingList() {
		return "store/stockwarehousing";
	}
	//재고 입고통계 페이지 이동
	@RequestMapping("/stockentered.do")
	public String getStockEnteredList() {
		return "store/stockentered";
	}
	//재고 출고통계 페이지 이동
	@RequestMapping("/stockreleased.do")
	public String getStockReleasedList() {
		return "store/stockreleased";
	}
	//기간검색 재고 전체 리스트 값
	@ResponseBody
	@RequestMapping(value="/dateSearch", method=RequestMethod.POST)
	public List<WarehousingVO> getDateSearchList(Model model, WarehousingVO vo){
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		return warehousingService.getWarehousingList(vo);
	}
	//기간검색 재고 출고 리스트 값
	@ResponseBody
	@RequestMapping(value="/dateSearchRelease", method=RequestMethod.POST)
	public List<WarehousingVO> getDateSearchReleaseList(Model model, WarehousingVO vo){
		
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		return warehousingService.getReleasedList(vo);
	}
	//기간검색 재고 입고 리스트 값
	@ResponseBody
	@RequestMapping(value="/dateSearchEntered", method=RequestMethod.POST)
	public List<WarehousingVO> getDateSearchEnteredList(Model model, WarehousingVO vo){
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		return warehousingService.getEnteredList(vo);
	}
	//재고테이블에 수량추가 후 입고테이블 데이터 // 프로젝트 중반부터 .do 달음
	@ResponseBody
	@RequestMapping(value = "/insertEnter.do", method = RequestMethod.POST, consumes = "application/json")
	public int insertEnter(@RequestBody List<WarehousingVO> list, Model model) {
		int n=0;
		for(WarehousingVO vo: list) {
		try {
			int result = warehousingService.insertEnter(vo);
			n = n+result;
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return n;
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
