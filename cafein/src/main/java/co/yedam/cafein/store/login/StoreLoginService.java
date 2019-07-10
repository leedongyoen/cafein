package co.yedam.cafein.store.login;

import java.util.List;

import co.yedam.cafein.vo.StoreVO;

public interface StoreLoginService {

	public StoreVO getStore(StoreVO vo);
	
	public List<StoreVO> getStoreList(StoreVO vo);

}
