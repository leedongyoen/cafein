package co.yedam.cafein.store.pos;

import java.util.List;
import java.util.Map;

import co.yedam.cafein.viewvo.ViewPosCusSearchVO;
import co.yedam.cafein.viewvo.ViewPosOrdetailsVO;
import co.yedam.cafein.viewvo.ViewPosVO;
import co.yedam.cafein.vo.OrderDetailsVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.RecipeVO;

public interface PosService {
	
	List<ViewPosVO> getStoreMenuList(ViewPosVO vo);
	List<RecipeVO> getOptionList(RecipeVO vo);
	List<ViewPosCusSearchVO> getCusList(ViewPosCusSearchVO vo);
	List<OrdersVO> getCusRefund(OrdersVO vo);
	List<ViewPosOrdetailsVO> getOrDetails(ViewPosOrdetailsVO vo);
	void refoundcall(OrdersVO vo);
	int orderalarmcount(OrdersVO vo);
	List<OrdersVO> getcallorderlist(OrdersVO vo);
	List<OrderDetailsVO> getcallorderdetails(OrderDetailsVO vo);
	int getOrDetailscount(OrdersVO vo);
	
	
}
