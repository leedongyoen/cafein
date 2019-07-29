package co.yedam.cafein.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.customer.main.CustomerMainService;
import co.yedam.cafein.customer.reserve.ReserveService;
import co.yedam.cafein.vo.CustomerMainVO;
import co.yedam.cafein.vo.ReserveVO;

@Controller
public class CustomerMainController {

	@Autowired
	ReserveService reserveService;
	
	@Autowired
	CustomerMainService customerMainSerivce;
	
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
	
	//자주 이용한 매장 리스트를 순위별로 뿌림.
	@RequestMapping(value="getLikeStoreList.do" , method=RequestMethod.GET)
	@ResponseBody
	public List<CustomerMainVO> getLikeStoreList(CustomerMainVO vo) {
		return customerMainSerivce.getLikeStoreList(vo);
	}
	
	//메인에서 자주 이용한 매장 리스트
	@RequestMapping(value="mainLikeStoreList.do" ,method = RequestMethod.GET)
	@ResponseBody
	public 	List<CustomerMainVO> mainLikeStoreList(CustomerMainVO vo) {
		return customerMainSerivce.mainLikeStoreList(vo);
	}

	
	// 선호 메뉴 조회
	@RequestMapping("likemenulist.do")
	public String likemenulist() {
		return "customer/likemenulist";
	}
	
	//고객이 자주 이용한 메뉴 리스트
	@RequestMapping(value="getLikeMenuList.do", method=RequestMethod.GET)
	@ResponseBody
	public List<CustomerMainVO> getLikeMenuList(CustomerMainVO vo) {
		System.out.println(vo);
		return customerMainSerivce.getLikeMenuList(vo);
	}
	
	//메인에서 고객이 이용한 메뉴 리스트
	@RequestMapping(value="mainLikeMenuList.do",method=RequestMethod.GET)
	@ResponseBody
	public List<CustomerMainVO> mainLikeMenuList(CustomerMainVO vo) {
		return customerMainSerivce.mainLikeMenuList(vo);
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
	
	//메인에서   총 적립금을 보여줄 컨트롤러
	@RequestMapping(value="mainTotalReserve.do", method=RequestMethod.GET)
	@ResponseBody
	public List<ReserveVO> mainReserveTotal(ReserveVO vo) {
		System.out.println(vo);
		return reserveService.mainTotalReserve(vo);
	}
	
	
	
}
