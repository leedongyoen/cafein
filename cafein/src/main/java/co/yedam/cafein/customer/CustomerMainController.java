package co.yedam.cafein.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.customer.reserve.ReserveService;
import co.yedam.cafein.vo.ReserveVO;

@Controller
public class CustomerMainController {

	@Autowired
	ReserveService reserveService;
	
	// 메인화면으로
	@RequestMapping("customermainform.do")
	public String customerMainForm() {
		return "customer/main";
	}
	
	// 자주 이용한 매장 조회
	@RequestMapping("likestorelist.do")
	public String likestorelist() {
		return "customer/likestorelist";
	}
	
	// 선호 메뉴 조회
	@RequestMapping("likemenulist.do")
	public String likemenulist() {
		return "customer/likemenulist";
	}
	
	// 고객 마일리지 조회
	@RequestMapping("reservelist.do")
	public String reservelist() {
		return "customer/reservelist";
	}  
	
	//적립금 리스트를 뿌릴 컨트롤러
	@RequestMapping(value="getListReserve.do", method=RequestMethod.GET)
	@ResponseBody
	public List<ReserveVO> getReserveList(ReserveVO vo) {
		System.out.println(vo);
		return reserveService.getListReserve(vo);
	}
	//총 적림금과 사용한 적립금을 보여줄 컨트롤러
	@RequestMapping(value="getTotalReserve.do", method=RequestMethod.GET)
	@ResponseBody
	public List<ReserveVO> getReserveTotal(ReserveVO vo) {
		System.out.println(vo);
		return reserveService.getTotalReserve(vo);
	}
	
//	//사용한 적립금 리스트를 뿌릴 컨트롤러
//	@RequestMapping(value="getUseReserve.do", method=RequestMethod.GET)
//	@ResponseBody
//	public ReserveVO getReserveUse(ReserveVO vo) {
//		System.out.println(vo);
//		return reserveService.getUseReserve(vo);
//	}
	
	
}
