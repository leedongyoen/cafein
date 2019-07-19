package co.yedam.cafein.store.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.StoreVO;

@Service
public class StoreJoinServiceImpl implements StoreJoinService{

	@Autowired
	StoreJoinDAO storejoinDAO;
	
	@Override
	public int insertJoin(StoreVO vo) {
		return storejoinDAO.insertJoin(vo);
	}

	@Override
	public int idCheck(StoreVO sid) {
		return storejoinDAO.idCheck(sid);
	}

}
