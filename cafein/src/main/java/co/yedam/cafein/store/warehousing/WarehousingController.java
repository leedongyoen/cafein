package co.yedam.cafein.store.warehousing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WarehousingController {

	@Autowired
	WarehousingServiceImpl warehousingService;
	
	@RequestMapping("/warehousing.do")
	public String getWareList() {
		return "store/warehousinglist";
	}
	
}
