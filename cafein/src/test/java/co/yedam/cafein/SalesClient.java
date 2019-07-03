package co.yedam.cafein;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import co.yedam.cafein.store.sales.SalesSumDAO;
import co.yedam.cafein.vo.SalesSumVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/applicationContext.xml")
public class SalesClient {
	
	@Autowired
	SalesSumDAO dao;
	
	@Test
	public void getDaySales() {
		SalesSumVO vo = new SalesSumVO();
		vo.setoDnum("1");
		List<SalesSumVO> list = dao.getDaySales(vo);
		for (SalesSumVO sales : list) {
			System.out.println(sales);
		}
	}
}
