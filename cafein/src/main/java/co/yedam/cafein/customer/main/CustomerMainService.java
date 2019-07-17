package co.yedam.cafein.customer.main;

import java.util.List;

import co.yedam.cafein.vo.CustomerMainVO;

public interface CustomerMainService {
	//자주 찾은 매장 리스트
	List<CustomerMainVO> getLikeStoreList(CustomerMainVO vo);
	
	//메인에서 보여줄 자주찾은 매장 리스트
	List<CustomerMainVO> mainLikeStoreList(CustomerMainVO vo);
	
	//자주 찾은 메뉴 리스트
	List<CustomerMainVO> getLikeMenuList(CustomerMainVO vo);
	
	//메인에서 보여줄 자주찾은 메뉴 리스트
	List<CustomerMainVO> mainLikeMenuList(CustomerMainVO vo);
}
