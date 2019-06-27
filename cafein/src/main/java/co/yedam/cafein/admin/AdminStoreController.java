package co.yedam.cafein.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminStoreController {

	
	// 관리자 매장 목록 조회
	@RequestMapping("storelist.do")
	public String storelist() {
		return "admin/storelist";
	}
	
	
	// 관리자 매장 등록 관리
	@RequestMapping("storemng.do")
	public String storemng() {
		return "admin/storemng";
	}
	
}
