package co.yedam.cafein.customer.info;

import co.yedam.cafein.vo.CustomerVO;

public interface CustomerInfoService {
	
	public CustomerVO getCustomer(CustomerVO vo);
	public int infoedit(CustomerVO vo);
	
	

}
