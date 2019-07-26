package co.yedam.cafein.store;

import java.util.List;

import co.yedam.cafein.vo.CustomerVO;

public interface StoreCustomerListService {
	
	public List<CustomerVO> getCustomerList(CustomerVO vo);

	public CustomerVO getCustomer(CustomerVO vo);
	
	public List<CustomerVO> getCustomerhistory(CustomerVO vo);
	
	public List<CustomerVO> getWarehousing(CustomerVO vo);
}
