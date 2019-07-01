package co.yedam.cafein.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreMainController {
	
	//매장 메인화면
	@RequestMapping("storemainform.do")
	public String storemainform() {
		return "store/main";
	}
	//매장 우리매장 고객 조회
	@RequestMapping("customerlist.do")
	public String customerlist() {
		return "store/customerlist";
	}
	
	//매장 주문내역 조회
	@RequestMapping("storeorderlist.do")
	public String storeorderlist() {
		return "store/orderlist";
	}
	
	//매장 주문하기
		@RequestMapping("pos.do")
		public String pos() {
			return "store/pos";
		}
	

}