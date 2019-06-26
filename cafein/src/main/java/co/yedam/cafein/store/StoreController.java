package co.yedam.cafein.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	
	//매장 회원가입
	@RequestMapping("storejoin.do")
	public String storejoin() {
		return "store/join";
	}
	//매장 로그인
	@RequestMapping("storelogin.do")
	public String storelogin() {
		return "store/login";
	}
	//매장 정보수정
	@RequestMapping("storeinfoedit.do")
	public String storeinfoedit() {
		return "store/infoedit";
	}

	
}
