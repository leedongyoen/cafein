package co.yedam.cafein.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.CustomerVO;


@Repository
public class StoreCustomerDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<CustomerVO> getCustomerList(CustomerVO vo) {
		
		return mybatis.selectList("CustomerlistDAO.getCustomerList", vo);
	}
	
	//매장고객조회
	

}
