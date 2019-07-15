package co.yedam.cafein.store.pos;

import java.util.List;

import co.yedam.cafein.viewvo.ViewPosVO;
import co.yedam.cafein.vo.RecipeVO;

public interface PosService {
	
	List<ViewPosVO> getStoreMenuList(ViewPosVO vo);
	List<RecipeVO> getOptionList(RecipeVO vo);
	

}
