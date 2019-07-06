package co.yedam.cafein.customer.storemenu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.StoreVO;

@RestController
public class StoreListMenuController {
	
	@Autowired
	StoreListMenuDAO service;
	
	
	
	  @RequestMapping(value="/storelistmenu", method=RequestMethod.GET) 
	  public List<StoreVO> getstorelist(ModelAndView mv){
		  StoreVO vo = new StoreVO();
		/*
		 * mv.addObject("storelist",service.getStoreList(vo));
		 * mv.setViewName("customer/storelist");
		 */
	  
		  return service.getStoreList(vo); 
	  }
	 
	  
	  @RequestMapping(value="/storelistmenu/{sid}", method=RequestMethod.GET) 
	  public List<MenuVO> getmenulist(@PathVariable("sid") String sid){ 
		  MenuVO vo = new MenuVO();
		  vo.setsId(sid);
		  return service.getMenuList(vo);
	  }
	
	  @RequestMapping(value="/searchstorelist/{sadd}", method=RequestMethod.GET) 
	  public List<StoreVO> getsearchstorelist(@PathVariable("sadd") String sadd){ 
		  StoreVO vo = new StoreVO();
		  vo.setsAdd(sadd);
		  return service.getSearchStoreList(vo);
	  }
	
	/*
	 * @RequestMapping(value="/storelistmenu", method=RequestMethod.GET) public
	 * List<StoreVO> getstorelist(StoreVO vo){
	 * 
	 * 
	 * return service.getStoreList(vo); }
	 */
	 

}
