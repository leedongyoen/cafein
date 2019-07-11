package co.yedam.cafein.store.pos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.viewvo.ViewPosVO;

@Repository
public class PosDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ViewPosVO> getStoreMenuList(ViewPosVO vo){
		System.out.println("===> Mybatis getStoreMenuList()");
		return mybatis.selectList("PosDAO.getStoreMenuList", vo);
	}

}
