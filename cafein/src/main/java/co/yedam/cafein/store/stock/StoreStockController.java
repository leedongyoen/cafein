package co.yedam.cafein.store.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class StoreStockController {
	
	@Autowired
	StoreStockServiceImpl storeStockService;
	
	@RequestMapping(value="/stocklist.do")
	public String getStockList() {
//		model.addAttribute("stock", storeStockService.getStockList(vo));
		return "store/stocklist";
		
	}
	
	@RequestMapping(value="warehousingregi.do")
	public String warehousingregi() {
		return "store/warehousingregi";
		
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
