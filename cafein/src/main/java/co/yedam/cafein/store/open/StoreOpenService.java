package co.yedam.cafein.store.open;

import java.util.List;

import co.yedam.cafein.vo.StoreOpenVO;

public interface StoreOpenService {
	
	public List<StoreOpenVO> getOpenList(StoreOpenVO vo);
	
	public int insertOpen(StoreOpenVO vo);

	public StoreOpenVO getOpen(StoreOpenVO vo);
	
	
}
