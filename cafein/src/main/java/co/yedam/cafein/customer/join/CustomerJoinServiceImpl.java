package co.yedam.cafein.customer.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import co.yedam.cafein.vo.CustomerVO;

@Service
public class CustomerJoinServiceImpl implements CustomerJoinService {

	
	@Autowired
	CustomerJoinDAO customerjoinDAO;
	
	@Override
	public int insertJoin(CustomerVO vo) {
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		//암호화  하기전
		String scPw = scpwd.encode(vo.getcPw());
		//암호화 후 db저장
		vo.setcPw(scPw);
		System.out.println(vo.toString());
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
