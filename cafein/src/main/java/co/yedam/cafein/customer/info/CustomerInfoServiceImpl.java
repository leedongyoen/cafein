package co.yedam.cafein.customer.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.CustomerVO;

@Service
public class CustomerInfoServiceImpl implements CustomerInfoService{
	@Autowired
	CustomerInfoDAO customerDAO;
	
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
			
			return customerDAO.checkpw(vo);
		}
	
	//회원 삭제(탈퇴)

	public int deleteCustomer(CustomerVO vo) {
		// TODO Auto-generated method stub
		return customerDAO.deleteCustomer(vo);
	}

	
	

}
