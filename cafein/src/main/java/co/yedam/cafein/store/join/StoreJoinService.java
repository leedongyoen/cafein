package co.yedam.cafein.store.join;

import co.yedam.cafein.vo.StoreVO;

public interface StoreJoinService {

	public int insertJoin(StoreVO vo);

	public int idCheck(StoreVO sid);

}
