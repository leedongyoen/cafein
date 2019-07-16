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
	

	//전체조회
	public List<CustomerVO> getCustomerList(CustomerVO vo) {
		
		return mybatis.selectList("CustomerlistDAO.getCustomerList", vo);
	}
	
	//단건조회
	public CustomerVO getCustomer(CustomerVO vo) {
	
		return mybatis.selectOne("CustomerlistDAO.getCustomer",vo);
	}
	
	//구매이력
	public CustomerVO getCustomerhistory(CustomerVO vo) {
		return mybatis.selectOne("CustomerlistDAO.getCustomerhistory",vo);
	}
	
	

}
