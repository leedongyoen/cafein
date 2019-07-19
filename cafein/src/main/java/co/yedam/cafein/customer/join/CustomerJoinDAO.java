package co.yedam.cafein.customer.join;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.CustomerVO;

@Repository
public class CustomerJoinDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertJoin(CustomerVO vo) {
		return mybatis.insert("CustomerJoinDAO.insertJoin", vo);
	}
	
	public int idCheck(CustomerVO  cId) {
		return mybatis.selectOne("CustomerJoinDAO.idCheck", cId);
	}

	public int authKey(CustomerVO authNum) {
		return mybatis.insert("CustomerJoinDAO.authKey", authNum);
	}

	public int authKey(String authNum) {
		return mybatis.insert("CustomerJoinDAO.authKey", authNum);
		// TODO Auto-generated method stub
		
	}
	
	public int authkeyCheck(CustomerVO authNum) {
		return mybatis.selectOne("CustomerJoinDAO.authkeyCheck", authNum);
	}

	

	
}
