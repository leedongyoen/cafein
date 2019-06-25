package co.yedam.cafein.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class StoreSalesController {
	
	
	@RequestMapping("salesDayForm.do")
	public String salesDayForm() {
		return "store/salesday";
	}
	
	@RequestMapping("salesMenuForm.do")
	public String salesMenuForm() {
		return "store/salesmenu";
	}
	
	@RequestMapping("salesTimeForm.do")
	public String salesTimeForm() {
		return "store/salestime";
	}
	
	@RequestMapping("salesYearForm.do")
	public String salesYearForm() {
		return "store/salesyear";
	}
	
	@RequestMapping("salesMonthForm.do")
	public String salesMonthForm() {
		return "store/salesmonth";
	}
}
