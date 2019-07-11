package co.yedam.cafein.store.login;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.StoreVO;

@Repository
public class StoreLoginDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public StoreVO getStore(StoreVO vo) {
		return mybatis.selectOne("storeLoginDAO.getStore", vo);
	}
	
	public List<StoreVO> getStoreList(StoreVO vo){
		System.out.println("--------------끼룩 store Login-----------------");
		return mybatis.selectList("storeLoginDAO.getStoreList", vo);
		
	}

}
