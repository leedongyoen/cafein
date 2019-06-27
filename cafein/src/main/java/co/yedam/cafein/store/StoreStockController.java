package co.yedam.cafein.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class StoreStockController {

	@RequestMapping("warehousingregi.do")
	public String warehousingregi() {
		return "store/warehousingregi";
	}
	
	@RequestMapping("stocklist.do")
	public String stocklist() {
		return "store/stocklist";
	}
	
	@RequestMapping("stockstatisticslist.do")
	public String stockstatisticslist() {
		return "store/stockstatisticslist";
	}
	
	@RequestMapping("stockadd.do")
	public String stockadd() {
		return "store/stockadd";
	}
}
