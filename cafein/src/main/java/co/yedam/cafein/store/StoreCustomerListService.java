package co.yedam.cafein.store;

import java.util.List;

import co.yedam.cafein.vo.CustomerVO;

public interface StoreCustomerListService {
	
	public List<CustomerVO> getCustomerList(CustomerVO vo);

}
