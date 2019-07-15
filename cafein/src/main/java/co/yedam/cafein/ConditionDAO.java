package co.yedam.cafein;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.ConditionVO;


@Repository
public class ConditionDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ConditionVO> getConditionDetailList(ConditionVO vo){
		return mybatis.selectList("conditionDAO.getConditionDetailList", vo);
	}
	public List<ConditionVO> getConditionList(ConditionVO vo){
		return mybatis.selectList("conditionDAO.getConditionList");
	}
	public int insertCondition(ConditionVO vo) {
		return mybatis.insert("conditionDAO.insertCondition");
	}
	
	public int updateCondition(ConditionVO vo) {
		return mybatis.update("conditionDAO.updateCondition");
	}
	public int deleteCondition(ConditionVO vo) {
		return mybatis.delete("conditionDAO.deleteCondition");
	}
	public ConditionVO getCondition(ConditionVO vo) {
		return mybatis.selectOne("conditionDAO.getCondition");
		}
	
}
