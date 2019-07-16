package co.yedam.cafein.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import co.yedam.cafein.store.close.StoreCloseService;
import co.yedam.cafein.viewvo.ViewWarehousingVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;
import co.yedam.cafein.vo.StoreCloseVO;
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
	public List<ViewWarehousingVO> getOperatingreserve(ViewWarehousingVO vo){
		return service.getWarehousing(vo);
	}
	
	// 매장 영업 준비금  (단순 페이지 이동)
	@RequestMapping("operatingreserve.do")
	public String operatingreserve() {
		return "store/operatingreserve";
	}
	
	//----------------------------------------------------------------------------
	// 마감 시재 정산
	@ResponseBody
	@RequestMapping(value="/cashadvance", method=RequestMethod.GET)
	public List<OrdersVO> getCashadvance(OrdersVO vo) {
		return service.getCashAdvance(vo);
	}

	// 마감 시재 정산
	@RequestMapping("cashadvance.do")
	public String cashadvance() {
		return "store/cashadvance";
	}
	
	//----------------------------------------------------------------------------
	// 마감 재고 업데이트
	@ResponseBody
	@RequestMapping(value="/stocktruthlist", method=RequestMethod.GET)
	public List<StockVO> getStockTruthList(StockVO vo) {
		return service.getStockTruthList(vo);
	}
	
	// 재고 실수량 입력
	@RequestMapping("stocktruthlist.do")
	public String stocktruthlist() {
		return "store/stocktruthlist";
	}
	
	//----------------------------------------------------------------------------
	// 마감 정산 버튼 클릭 시 모든 데이터 insert 및 update
	@RequestMapping("dateInsertUpdate.do")
	public String dateInsertUpdate(WarehousingVO wvo, StockVO svo, StoreCloseVO cvo) {
		
		return "store/main";
	}

}
