package co.yedam.cafein.customer.info;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.CustomerVO;

@Repository
public class CustomerInfoDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	

	// 단건 회원 조회
	public CustomerVO getCustomer(CustomerVO vo) {
		return mybatis.selectOne("CustomerDAO.getCustomer", vo);
	}

	//회원 정보 수정
	public int infoedit(CustomerVO vo) {
		System.out.println("mybatis 회원정보 수정");
		return mybatis.update("CustomerDAO.infoedit", vo);
	}
	
	public int checkpw(CustomerVO vo) {
		System.out.println("mybatis 회원정보 비밀번호 변경");
		return mybatis.update("CustomerDAO.checkpw", vo);
	}
	//회원 정보 삭제
	public int deleteCustomer(CustomerVO vo) {
		System.out.println("mybatis 회원정보 삭제");
		return mybatis.delete("CustomerDAO.deleteCustomer", vo);
	}

	

}
