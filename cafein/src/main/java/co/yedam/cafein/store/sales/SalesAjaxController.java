package co.yedam.cafein.store.sales;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.vo.SalesSumVO;

@Controller
public class SalesAjaxController {
	@Autowired
	SalesService salesService;
	
	@RequestMapping("/getsalesday.do")
	@ResponseBody
	public List<SalesSumVO> salesDayForm(SalesSumVO vo) {
		return salesService.getDaySales(vo) ;
		
	}
	
	@RequestMapping("/getsalesmenu.do")
	@ResponseBody
	public String salesMenuForm() {
		return "store/salesmenu";
	}
	
	@RequestMapping("/getsalestime.do")
	@ResponseBody
	public String salesTimeForm() {
		return "store/salestime";
	}
	
	@RequestMapping("/getsalesyear.do")
	@ResponseBody
	public String salesYearForm() {
		return "store/salesyear";
	}
	
	@RequestMapping("/getsalesmonth.do")
	@ResponseBody
	public String salesMonthForm() {
		return "store/salesmonth";
	}
}
