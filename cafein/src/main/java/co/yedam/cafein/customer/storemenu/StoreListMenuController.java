package co.yedam.cafein.customer.storemenu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.cafein.customer.order.CustomerOrderServiceImpl;
import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.ReserveVO;
import co.yedam.cafein.vo.StoreVO;

@RestController
public class StoreListMenuController {
	
	@Autowired
	StoreListMenuDAO service;
	
	@Autowired
	CustomerOrderServiceImpl orderservice;
	
	
		// 모든 매장 보여줌
	  @RequestMapping(value="/storelistmenu", method=RequestMethod.GET) 
	  public List<StoreVO> getstorelist(ModelAndView mv){
		  StoreVO vo = new StoreVO();
		/*
		 * mv.addObject("storelist",service.getStoreList(vo));
		 * mv.setViewName("customer/storelist");
		 */
	  
		  return service.getStoreList(vo); 
	  }
	  
	  @RequestMapping(value="/getstoredetail/{sid}",method=RequestMethod.GET)
	  public StoreVO getstoredetail(@PathVariable("sid") String sid){
		  StoreVO vo = new StoreVO();
		  vo.setSid(sid);
		  return orderservice.getSearchStore(vo);
	  }
	 
	  // 매장 메뉴 가져오기
	  @RequestMapping(value="/storelistmenu/{sid}", method=RequestMethod.GET) 
	  public List<MenuVO> getmenulist(@PathVariable("sid") String sid){ 
		  MenuVO vo = new MenuVO();
		  vo.setsId(sid);
		  return service.getMenuList(vo);
	  }
	
	  // 범위 지정해서 매장 정보 가져오기
	  @RequestMapping(value="/searchstorelist/{sadd}", method=RequestMethod.GET) 
	  public List<StoreVO> getsearchstorelist(@PathVariable("sadd") String sadd){ 
		  StoreVO vo = new StoreVO();
		  vo.setSadd(sadd);
		  return service.getSearchStoreList(vo);
	  }
	  
	  
	  
	// 고객 마일리지 가져오기. ( 매장 ID 사용 )
	  @RequestMapping(value="/customerreserve",method=RequestMethod.GET) 
	  public ReserveVO customerorder(ReserveVO vo){ 

		  return service.getReserve(vo);
	  }
	  
	  // 선택한 메뉴의 옵션 가져오기
	  @RequestMapping(value="/getmenuoptionlist", method=RequestMethod.GET)
	  public List<RecipeVO> getmenuoptionlist(RecipeVO vo) {
		  return service.getmenuoptionlist(vo);
	  }
	  
	  // 선택한 메뉴 상세조회
	  @RequestMapping(value="/getmenudetail", method=RequestMethod.GET)
	  public MenuVO getmenudetail(MenuVO vo){
			return service.getmenudetail(vo);
	  }
	
	/*
	 * @RequestMapping(value="/storelistmenu", method=RequestMethod.GET) public
	 * List<StoreVO> getstorelist(StoreVO vo){
	 * 
	 * 
	 * return service.getStoreList(vo); }
	 */
	 

}
