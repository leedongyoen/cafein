package co.yedam.cafein.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.CustomerVO;

@Service
public class StoreCustomerListServiceImpl implements StoreCustomerListService{
	
	@Autowired
	StoreCustomerDAO storecustomerDao;

	@Override
	public List<CustomerVO> getCustomerList(CustomerVO vo) {
		return storecustomerDao.getCustomerList(vo);
	}
	
	public CustomerVO getCustomer(CustomerVO vo) {
		return storecustomerDao.getCustomer(vo);
	}

	public CustomerVO getCustomerhistory(CustomerVO vo) {
		return storecustomerDao.getCustomerhistory(vo);
	}

}
