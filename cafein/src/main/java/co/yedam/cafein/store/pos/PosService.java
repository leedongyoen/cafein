package co.yedam.cafein.store.pos;

import java.util.List;

import co.yedam.cafein.viewvo.ViewPosVO;

public interface PosService {
	
	List<ViewPosVO> getStoreMenuList(ViewPosVO vo);
	

}
