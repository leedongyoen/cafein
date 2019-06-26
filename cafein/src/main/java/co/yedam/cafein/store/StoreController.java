package co.yedam.cafein.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	
	@RequestMapping("storejoinForm.do")
	public String join() {
		return "store/join";
	}
}
