package co.yedam.cafein.store.join;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.StoreVO;

@Repository
public class StoreJoinDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public int insertJoin(StoreVO vo) {
		return mybatis.insert("StoreJoinDAO.insertJoin", vo);
	}

	public int idCheck(StoreVO sid) {
		return mybatis.selectOne("StoreJoinDAO.idCheck", sid);
	}
	
	

}
