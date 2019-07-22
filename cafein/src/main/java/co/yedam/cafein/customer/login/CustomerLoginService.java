package co.yedam.cafein.customer.login;

import java.util.List;

import co.yedam.cafein.vo.CustomerVO;

public interface CustomerLoginService {
	
	public CustomerVO getCustomer(CustomerVO vo);

	public CustomerVO getKakaoCustomer(CustomerVO vo);
	
	public CustomerVO getNaverCustomer(CustomerVO vo);
	
	public List<CustomerVO> getCustomerList(CustomerVO vo);
	
	public int insertCustomerKakao(CustomerVO vo);
	
	public int insertCustomerNaver(CustomerVO vo);
	
	public void pwFind(CustomerVO vo);
	
	public CustomerVO idFind(CustomerVO vo);
}
