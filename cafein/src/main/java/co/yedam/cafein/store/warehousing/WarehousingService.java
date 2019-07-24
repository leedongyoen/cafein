package co.yedam.cafein.store.warehousing;

import java.util.List;

import co.yedam.cafein.vo.WarehousingVO;

public interface WarehousingService {
	public List<WarehousingVO> getWarehousingList(WarehousingVO vo);
	
	public List<WarehousingVO> getReleasedList(WarehousingVO vo);
	
	public List<WarehousingVO> getEnteredList(WarehousingVO vo);
	
	public int insertEnter(WarehousingVO vo);
	
	public List<WarehousingVO> getWarehousing(WarehousingVO vo);
	
}
