package co.yedam.cafein.customer.join;

import co.yedam.cafein.vo.CustomerVO;

public interface CustomerJoinService {
	
	public int insertJoin(CustomerVO vo);
	
	public int idCheck(CustomerVO  vo);

}
