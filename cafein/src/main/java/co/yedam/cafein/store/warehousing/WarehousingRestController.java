package co.yedam.cafein.store.warehousing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.cafein.vo.WarehousingVO;

@RestController
public class WarehousingRestController {
	
	@Autowired
	WarehousingServiceImpl warehousingService;
	
	@RequestMapping(value="/warehousing", method=RequestMethod.GET)
	public List<WarehousingVO> getWareList(Model model, WarehousingVO vo){
		return warehousingService.getWareList(vo);
		
	}
}
