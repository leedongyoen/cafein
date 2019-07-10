package co.yedam.cafein.store.info;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.vo.StoreVO;

@Controller
public class StoreInfoController {

	  @Autowired 
	  StoreInfoService storeService;
	  
	  //매점 단건조회
	  
	  @ResponseBody
	  @RequestMapping(value = "/storeinfo/{sid}", method= RequestMethod.GET)
	  public StoreVO getStore(@PathVariable("sid") String id, StoreVO vo, Model model) {
		  vo.setSid(id);
		  return storeService.getStore(vo);
	  }
	  
	  //매정 수정
	  @ResponseBody 
	  @RequestMapping(value="/storeinfo", method=RequestMethod.PUT, consumes="application/json")
	  public StoreVO infoedit(@RequestBody StoreVO vo, Model model, HttpServletRequest req) {
		  System.out.println(vo + "=============");
		  vo.setSpw(null);
		  storeService.infoedit(vo);
		  return vo;
	  }
	  
	 
}
