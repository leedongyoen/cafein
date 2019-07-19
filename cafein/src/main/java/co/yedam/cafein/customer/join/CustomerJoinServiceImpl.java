package co.yedam.cafein.customer.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import co.yedam.cafein.vo.CustomerVO;

@Service
public class CustomerJoinServiceImpl implements CustomerJoinService {

	
	@Autowired
	CustomerJoinDAO customerjoinDAO;
	
	@Override
	public int insertJoin(CustomerVO vo) {
		return customerjoinDAO.insertJoin(vo);
	}

	@Override
	public int idCheck(CustomerVO cId) {
		return customerjoinDAO.idCheck(cId);
	}

	@Override
	public int authKey(CustomerVO authNum) {
		return customerjoinDAO.authKey(authNum);
	}

	@Override
	public int authKey(String authNum) {
		return customerjoinDAO.authKey(authNum);
	}

	@Override
	public int authkeyCheck(CustomerVO authNum) {
		return customerjoinDAO.authkeyCheck(authNum);
	}

	
	
	

}
