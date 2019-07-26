package co.yedam.cafein.store.pos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.yedam.cafein.viewvo.ViewPosCusSearchVO;
import co.yedam.cafein.viewvo.ViewPosOrdetailsVO;
import co.yedam.cafein.viewvo.ViewPosVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.RecipeVO;

@Service("PosService")
public class PosServiceImpl implements PosService{

	
	@Resource(name="posDAO")
	private PosDAO dao;
	
	public List<ViewPosVO> getStoreMenuList(ViewPosVO vo){
		System.out.println(vo.getsId());
		return dao.getStoreMenuList(vo);
	}
	
	public List<RecipeVO> getOptionList(RecipeVO vo){
		System.out.println(vo.getmNum());
		return dao.getOptionList(vo);
	}
	
	public List<ViewPosCusSearchVO> getCusList(ViewPosCusSearchVO vo) {
		return dao.getCusList(vo);
	}

	public List<OrdersVO> getCusRefund(OrdersVO vo){
		System.out.println(vo.getoNum());
		return dao.getCusRefund(vo);
	
	}
	public List<ViewPosOrdetailsVO> getOrDetails(ViewPosOrdetailsVO vo){
		System.out.println(vo.getoNum());
		return dao.getOrDetails(vo);
	
	} 
	public void refoundcall(OrdersVO vo) {
		System.out.println(vo.getoNum());
		dao.refoundcall(vo);
	};
}
