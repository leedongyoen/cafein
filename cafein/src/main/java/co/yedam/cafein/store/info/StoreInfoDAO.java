package co.yedam.cafein.store.info;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.StoreVO;

@Repository
public class StoreInfoDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public StoreVO getStore(StoreVO vo) {
		
		return mybatis.selectOne("storeinfoDAO.getStore", vo);
	}

	public int infoedit(StoreVO vo) {
		System.out.println("mybatis 매장정보수정");
		return mybatis.update("storeinfoDAO.infoedit", vo);
	}

}
