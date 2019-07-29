package co.yedam.cafein.customer.info;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.CustomerVO;

@Service
public class CustomerInfoServiceImpl implements CustomerInfoService{
	@Autowired
	CustomerInfoDAO customerDAO;
	
	@Autowired
	CustomerInfoService service;
		
	//회원 단건조회
	@Override
	public CustomerVO getCustomer(CustomerVO vo) {
		return customerDAO.getCustomer(vo);
	}
	
	// 회원 정보 수정
	@Override
	public int infoedit(CustomerVO vo){
		return customerDAO.infoedit(vo);
	}
	
	// 비밀번호 변경
		@Override
		public int checkpw(CustomerVO vo){
			BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
			//암호화  하기전
			String scPw = scpwd.encode(vo.getcPw());
			//암호화 후 db저장
			vo.setcPw(scPw);
			System.out.println(vo.toString());
			
			
			return customerDAO.checkpw(vo);
		}
	
	//회원 삭제(탈퇴)

	public int deleteCustomer(CustomerVO vo) {
		// TODO Auto-generated method stub
		return customerDAO.deleteCustomer(vo);
	}

	
	

}
