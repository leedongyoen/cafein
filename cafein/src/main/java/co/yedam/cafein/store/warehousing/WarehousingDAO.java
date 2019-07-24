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
	
	public List<WarehousingVO> getEndteredList(WarehousingVO vo){
		return mybatis.selectList("WarehousingDAO.getEnteredList",vo);
	}
	public List<WarehousingVO> getReleasedList(WarehousingVO vo){
		return mybatis.selectList("WarehousingDAO.getReleasedList",vo);
	}
	
	public List<WarehousingVO> getWarehousingList(WarehousingVO vo){
		return mybatis.selectList("WarehousingDAO.getWarehousingList",vo);
	}
	
	public int insertEnter(WarehousingVO vo) {
		return mybatis.insert("WarehousingDAO.insertEnter",vo);
	}
	
	public List<WarehousingVO> getWarehousing(WarehousingVO vo) {
		return mybatis.selectList("WarehousingDAO.getWarehousing",vo);
	}
}
