package co.yedam.cafein.customer.join;

import java.util.Map;

import co.yedam.cafein.vo.CustomerVO;

public interface CustomerJoinService {
	
	public int insertJoin(CustomerVO vo);
	
	public int idCheck(CustomerVO  vo);

}
