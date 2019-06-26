package co.yedam.cafein.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreCloseController {
	
	//매장 마감 정산
	@RequestMapping("daycal.do")
	public String daycal() {
		return "store/daycal";
	}
	//매장 실수량 조회
		@RequestMapping("stocktruthlist.do")
		public String stocktruthlist() {
			return "store/stocktruthlist";
		}

}
