package co.yedam.cafein.store.info;

import java.util.List;

import co.yedam.cafein.vo.StoreVO;

public interface StoreInfoService {

	//매장 단건조회
	public StoreVO getStore(StoreVO vo);

	public int infoedit(StoreVO vo);

	public int checkpw(StoreVO vo);
	
	public List<StoreVO> getStoreList(StoreVO vo);
}

