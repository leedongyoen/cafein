package co.yedam.cafein.store.warehousing;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.WarehousingVO;

@Repository
public class WarehousingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<WarehousingVO> getWarehousingList(WarehousingVO vo){
		return mybatis.selectList("WarehousingDAO.getWareList",vo);
	}
}
