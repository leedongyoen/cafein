package co.yedam.cafein.store.open;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.StoreOpenVO;
@Repository
public class StoreOpenDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public StoreOpenVO getStoreOpen(StoreOpenVO vo) {
		
		return null;
	}
	
	public int insertOpen(StoreOpenVO vo) {
		
		return mybatis.insert("storeOpenDAO.insertOpen", vo);
	}
}
