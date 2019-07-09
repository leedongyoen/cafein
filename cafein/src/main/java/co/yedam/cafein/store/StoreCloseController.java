package co.yedam.cafein.store;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.cafein.store.close.StoreCloseService;
import co.yedam.cafein.viewvo.ViewWarehousingVO;
import co.yedam.cafein.vo.WarehousingVO;

@Controller
public class StoreCloseController {
	
	@Autowired
	StoreCloseService service;
	
	// 매장 마감 정산
	@RequestMapping("daycal.do")
	public String daycal() {
		return "store/daycal";
	}
	
	// 매장 영업 준비금 (json 형식으로 data만 넘겨준다)
	@ResponseBody
	@RequestMapping(value="/operatingreserve", method=RequestMethod.GET)
	public List<ViewWarehousingVO> getlist(ViewWarehousingVO vo){
		return service.getWarehousing(vo);
	}
	
	// 매장 영업 준비금  (단순 페이지 이동)
	@RequestMapping("operatingreserve.do")
	public String operatingreserve() {
		return "store/operatingreserve";
	}
	 

	/*
	 * // 매장 영업 준비금
	 * 
	 * @RequestMapping("operatingreserve.do") public List<ViewWarehousingVO>
	 * operatingreserve(ViewWarehousingVO vo) { List<ViewWarehousingVO> list =
	 * service.getWarehousing(vo); System.out.println("list : " + list); return
	 * list; }
	 */
	
	// 마감 시재 정산
	@RequestMapping("cashadvance.do")
	public String cashadvance() {
		return "store/cashadvance";
	}
	
	// 재고 실수량 입력
	@RequestMapping("stocktruthlist.do")
	public String stocktruthlist() {
		return "store/stocktruthlist";
	}

}
