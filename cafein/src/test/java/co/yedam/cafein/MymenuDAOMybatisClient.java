package co.yedam.cafein;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import co.yedam.cafein.customer.mymenu.CusMyDAO;
import co.yedam.cafein.vo.MyMenuVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/config/applicationContext.xml")
public class MymenuDAOMybatisClient {
	@Autowired
	CusMyDAO dao;
	
	@Test
	public void getMymenu() {
		MyMenuVO vo = new MyMenuVO();
		vo.setcId("ju123");
		System.out.println(vo);
	}

}
