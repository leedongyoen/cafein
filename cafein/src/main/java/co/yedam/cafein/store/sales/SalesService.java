package co.yedam.cafein.store.sales;

import java.util.List;

import co.yedam.cafein.vo.SalesSumVO;



public interface SalesService {
	
	//월
	List<SalesSumVO> getDaySales(SalesSumVO vo);
	
	List<SalesSumVO> getTimeSales(SalesSumVO vo);
	
	List<SalesSumVO> getYearSales(SalesSumVO vo);
	
	List<SalesSumVO> getMenuSales(SalesSumVO vo);
	
	List<SalesSumVO> getMonthSales(SalesSumVO vo);

}
