package co.yedam.cafein.store.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.SalesSumVO;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	SalesSumDAO salessumDAO;
	
	@Override
	public List<SalesSumVO> getDaySales(SalesSumVO vo) {
		return salessumDAO.getDaySales(vo);
	}

	@Override
	public List<SalesSumVO> getTimeSales(SalesSumVO vo) {
		return salessumDAO.getTimeSales(vo);
	}

	@Override
	public List<SalesSumVO> getYearSales(SalesSumVO vo) {
		return salessumDAO.getYearSales(vo);
	}

	@Override
	public List<SalesSumVO> getMenuSales(SalesSumVO vo) {
		return salessumDAO.getMenuSales(vo);
	}

	@Override
	public List<SalesSumVO> getMonthSales(SalesSumVO vo) {
		return salessumDAO.getMonthSales(vo);
	}

}
