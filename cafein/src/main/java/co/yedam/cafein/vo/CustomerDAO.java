package co.yedam.cafein.vo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CustomerDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	

	//회원정보 수정
	public int infoedit(CustomerVO dto) {
		System.out.println("mybatis 회원정보 수정");
		return mybatis.update("CustomerDAO.infoedit", dto);
	}

}
