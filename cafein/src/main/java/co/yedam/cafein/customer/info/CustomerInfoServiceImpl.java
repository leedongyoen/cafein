package co.yedam.cafein.customer.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.CustomerVO;

@Service
public class CustomerInfoServiceImpl implements CustomerInfoService{
	@Autowired
	CustomerInfoDAO customerDAO;
	
	// 회원 정보 수정
	@Override
	public int infoedit(CustomerVO vo){
		
		return customerDAO.infoedit(vo);
	}

	@Override
	public CustomerVO getCustomer(CustomerVO vo) {
		return customerDAO.getCustomer(vo);
	}
	
	

}
