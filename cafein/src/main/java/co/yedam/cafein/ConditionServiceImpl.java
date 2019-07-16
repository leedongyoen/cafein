package co.yedam.cafein;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.ConditionVO;
@Service
public class ConditionServiceImpl implements ConditionService {
	
	@Autowired
	ConditionDAO Dao;
	
	@Override
	public List<ConditionVO> getConditionDetailList(ConditionVO vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.getMasterCd());
		
		return 	Dao.getConditionDetailList(vo);
		//return null;

	}

	@Override
	public List<ConditionVO> getConditionList(ConditionVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertCondition(ConditionVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCondition(ConditionVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCondition(ConditionVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ConditionVO getCondition(ConditionVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
