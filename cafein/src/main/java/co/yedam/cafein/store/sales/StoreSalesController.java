package co.yedam.cafein.store.sales;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreSalesController {
	
	
	@RequestMapping("salesday.do")
	public String salesDayForm() {
		return "store/salesday";
	}
	
	@RequestMapping("salesmenu.do")
	public String salesMenuForm() {
		return "store/salesmenu";
	}
	
	@RequestMapping("salestime.do")
	public String salesTimeForm() {
		return "store/salestime";
	}
	
	@RequestMapping("salesyear.do")
	public String salesYearForm() {
		return "store/salesyear";
	}
	
	@RequestMapping("salesmonth.do")
	public String salesMonthForm() {
		return "store/salesmonth";
	}
}
