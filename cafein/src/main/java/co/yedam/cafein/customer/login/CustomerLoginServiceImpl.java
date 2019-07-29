package co.yedam.cafein.customer.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.CustomerVO;
@Service
public class CustomerLoginServiceImpl implements CustomerLoginService {
	
	@Autowired
	CustomerLoginDAO dao;

	@Override
	public CustomerVO getCustomer(CustomerVO vo) {
		return dao.getCustomer(vo);
	}
	
	@Override
	public CustomerVO getKakaoCustomer(CustomerVO vo) {
		return dao.getKakaoCustomer(vo);
	}
	
	@Override
	public CustomerVO getNaverCustomer(CustomerVO vo) {
		return dao.getNaverCustomer(vo);
	}
	
	@Override
	public List<CustomerVO> getCustomerList(CustomerVO vo) {
		return dao.getCustomerList(vo);
	}

	@Override
	public int insertCustomerKakao(CustomerVO vo) {
		return dao.insertCustomerKakao(vo);
	}

	@Override
	public int insertCustomerNaver(CustomerVO vo) {
		return dao.insertCustomerNaver(vo);
	}

	//비밀번호 찾을 컨트롤
	@Override
	public void pwFind(CustomerVO vo) {
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		//암호화  하기전
		String scPw = scpwd.encode(vo.getcPw());
		//암호화 후 db저장
		vo.setcPw(scPw);
		System.out.println(vo.toString());
		
		dao.pwFind(vo);
	}
	//아이디를 찾을 폼
	@Override
	public CustomerVO idFind(CustomerVO vo) {
		return dao.idFind(vo);
	}

}
