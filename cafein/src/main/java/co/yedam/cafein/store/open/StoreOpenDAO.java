package co.yedam.cafein.store.open;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.StoreOpenVO;
@Repository
public class StoreOpenDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<StoreOpenVO> getStoreOpenList(StoreOpenVO vo) {
		
		return mybatis.selectList("storeOpenDAO.getOpenList", vo);
	}
	
	public int insertOpen(StoreOpenVO vo) {
		
		return mybatis.insert("storeOpenDAO.insertOpen", vo);
	}
	
	public StoreOpenVO getOpen(StoreOpenVO vo) {
		return mybatis.selectOne("storeOpenDAO.getOpen",vo);
	}
}
