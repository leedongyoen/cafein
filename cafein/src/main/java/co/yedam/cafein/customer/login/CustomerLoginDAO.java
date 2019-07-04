package co.yedam.cafein.customer.login;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.CustomerVO;

@Repository
public class CustomerLoginDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CustomerVO getCustomer(CustomerVO vo) {
		return mybatis.selectOne("customerLoginDAO.getCustomer",vo);
	}
	
	public CustomerVO getKakaoCustomer(CustomerVO vo) {
		return mybatis.selectOne("customerLoginDAO.getKakaoCustomer",vo);
	}
	
	// 로그인 시 DB에 있는 id, password 와 일치하는지 확인하기위한 select
	public List<CustomerVO> getCustomerList(CustomerVO vo) {
		System.out.println("-- -- -- Customer Login -- -- --");
		return mybatis.selectList("customerLoginDAO.getCustomerList", vo);
	}
	
	// kakao 로그인 시 DB에 정보가 없으면 insert
	public int insertCustomerKakao(CustomerVO vo) {
		System.out.println("-- -- -- Customer Kakao_Info Insert -- -- --");
		return mybatis.insert("customerLoginDAO.insertCustomerKakao", vo);
	}
	/*
	// naver 로그인 시 정보가 없으면 insert
	public int insertCustomerNaver(CustomerVO vo) {
		System.out.println("-- -- -- Customer Naver_Info Insert -- -- --");
		return mybatis.insert("customerLoginDAO.insertCustomerNaver", vo);
	}
	*/
}
