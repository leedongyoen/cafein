package co.yedam.cafein.store.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.cafein.vo.StockVO;



@Controller
public class StoreStockController {
	
	@Autowired
	StoreStockServiceImpl storeStockService;
	
	@RequestMapping(value="/stocklist.do")
	public String getStockList() {
//		model.addAttribute("stock", storeStockService.getStockList(vo));
		return "store/stocklist";
		
	}
	@RequestMapping(value="/deleteStock.do")
	public String deleteStock(StockVO vo) {
		storeStockService.deleteStock(vo);
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
