package co.yedam.cafein.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.vo.CustomerVO;

@Controller
public class StoreMainController {
	
	@Autowired
	StoreCustomerListServiceImpl storeCustomerListService;
	
	
	//매장 메인화면
	@RequestMapping("storemainform.do")
	public String storemainform() {
		return "store/main";
	}
	//매장 우리매장 고객 조회
	@RequestMapping("customerlist.do")
	public String customerlist() {
		return "store/customerlist";
	}
	//매장 우리매장 고객 조회
	@ResponseBody
	@RequestMapping(value="/allcustomerlist", method = RequestMethod.GET)
	public List<CustomerVO> getCustomerList( CustomerVO vo){
		System.out.println(vo.getsId());
		return storeCustomerListService.getCustomerList(vo);
	}
	
	//매장 주문내역 조회
	@RequestMapping("storeorderlist.do")
	public String storeorderlist() {
		return "store/orderlist";
	}
	
	//매장 주문하기
		@RequestMapping("pos.do")
		public String pos() {
			return "store/pos";
		}
	

}
