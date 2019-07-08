package co.yedam.cafein.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreCloseController {
	
	// 매장 마감 정산
	@RequestMapping("daycal.do")
	public String daycal() {
		return "store/daycal";
	}
	
	// 매장 영업 준비금
	@RequestMapping("operatingreserve.do")
	public String operatingreserve() {
		return "store/operatingreserve";
	}
	
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
