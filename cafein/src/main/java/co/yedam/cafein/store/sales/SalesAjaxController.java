package co.yedam.cafein.store.sales;

import java.util.List;

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
		return salesService.getDaySales(vo);
	}
	
	@RequestMapping("/getsalesmenu.do")
	@ResponseBody
	public List<SalesSumVO> salesMenuForm(SalesSumVO vo) {
		return salesService.getMenuSales(vo);
	}
	
	@RequestMapping("/getsalestime.do")
	@ResponseBody
	public List<SalesSumVO> salesTimeForm(SalesSumVO vo) {
		return salesService.getTimeSales(vo);
	}
	
	@RequestMapping("/getsalesyear.do")
	@ResponseBody
	public List<SalesSumVO> salesYearForm(SalesSumVO vo) {
		return salesService.getYearSales(vo);
	}
	
	@RequestMapping("/getsalesmonth.do")
	@ResponseBody
	public List<SalesSumVO> salesMonthForm(SalesSumVO vo) {
		return salesService.getMonthSales(vo);
	}
}
