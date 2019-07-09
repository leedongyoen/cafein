package co.yedam.cafein.store.close;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.viewvo.ViewWarehousingVO;

@Repository
public class StoreCloseDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 영업 준비금 목록 조회
	public List<ViewWarehousingVO> getWarehousing(ViewWarehousingVO vo) {
		return mybatis.selectList("storeCloseDAO.getWarehousing", vo);
	}
}
