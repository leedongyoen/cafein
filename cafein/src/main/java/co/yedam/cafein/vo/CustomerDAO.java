package co.yedam.cafein.vo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class CustomerDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	

	//회원정보 수정
	public int infoedit(CustomerVO vo) {
		System.out.println("mybatis 회원정보 수정");
		return mybatis.update("CustomerDAO.infoedit", vo);
	}



	public CustomerVO getCustomer(CustomerVO vo) {
		
		return mybatis.selectOne("CustomerDAO.getCumster", vo);
	}

}
