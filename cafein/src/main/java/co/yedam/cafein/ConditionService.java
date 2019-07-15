package co.yedam.cafein;

import java.util.List;

import co.yedam.cafein.vo.ConditionVO;


public interface ConditionService {
	public List<ConditionVO> getConditionDetailList(ConditionVO vo);
	public List<ConditionVO> getConditionList(ConditionVO vo);
	public int insertCondition(ConditionVO vo);
	public int updateCondition(ConditionVO vo);
	public int deleteCondition(ConditionVO vo);
	public ConditionVO getCondition(ConditionVO vo);
	
}
