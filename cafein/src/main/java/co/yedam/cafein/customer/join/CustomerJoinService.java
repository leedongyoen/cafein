package co.yedam.cafein.customer.join;

import co.yedam.cafein.vo.CustomerVO;

public interface CustomerJoinService {
	
	public int insertJoin(CustomerVO vo);
	
	public int idCheck(CustomerVO  vo);

	public int authKey(String authNum);

	public int authKey(CustomerVO authNum); 
	
	public int authkeyCheck(CustomerVO vo);
}
