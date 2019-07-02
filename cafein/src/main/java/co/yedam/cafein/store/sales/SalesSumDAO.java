package co.yedam.cafein.store.sales;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.SalesSumVO;

@Repository
public class SalesSumDAO {
	
		@Autowired
		private SqlSessionTemplate mybatis;
		
		//요일별  매출
		public List<SalesSumVO> getDaySales(SalesSumVO vo) {
			return mybatis.selectList("SumSalesDAO.getDaySales", vo);
		}
		
		//시간별 매출 
		public List<SalesSumVO> getTimeSales(SalesSumVO vo) {
			return mybatis.selectList("SumSalesDAO.getTimeSales", vo);
		}
		
		//월별 매출
		public List<SalesSumVO> getMonthSales(SalesSumVO vo) {
			return mybatis.selectList("SumSalesDAO.getMonthSales", vo);
		}
		
		//연별 매출
		public List<SalesSumVO> getYearSales(SalesSumVO vo) {
			return mybatis.selectList("SumSalesDAO.getYearSales", vo);
		}
		
		//메뉴별 매출
		public List<SalesSumVO> getMenuSales(SalesSumVO vo) {
			return mybatis.selectList("SumSalesDAO.getMenuSales", vo);
		}
		
}	
