package co.yedam.cafein.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.StoreVO;

@Repository
public class AdminStoreDAO {


	@Autowired
	private SqlSessionTemplate mybatis;
	
	//전체 매장조회
	public List<StoreVO> StoreList(StoreVO vo){
		return mybatis.selectList("AdminStore.getStoreList", vo);
	}
	
	//매장승인목록매장조회헿
	public List<StoreVO> StorePermissionList(StoreVO vo) {
		return mybatis.selectList("AdminStore.getStorePermissionList", vo);
	}

	//승인할지말지어떻게할지그렇게할지
	public int updatePermission(StoreVO vo) {
		// TODO Auto-generated method stub
		return mybatis.update("AdminStore.updatePermission", vo);
	}

}
