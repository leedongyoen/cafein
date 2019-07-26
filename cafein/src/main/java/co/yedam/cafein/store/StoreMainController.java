package co.yedam.cafein.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.store.main.StoreMainService;
import co.yedam.cafein.vo.CustomerVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.StockVO;

@Controller
public class StoreMainController {
	
	@Autowired
	StoreCustomerListServiceImpl storeCustomerListService;
	
	@Autowired
	StoreMainService service;
	
	//매장 메인화면
	@RequestMapping("storemainform.do")
	public String storemainform() {
		return "store/login";
	}
	
	// 매장 메인 판매율 TOP3 메뉴 조회
	@ResponseBody
	@RequestMapping(value="/salesrank", method=RequestMethod.GET)
	public List<OrdersVO> getSalesRank(OrdersVO vo) {
		return service.getSalesRank(vo);
	}
	

	
	// -------------------------------------------------------------------------------------------------------------
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
	
	//매장 우리매장 고객 단건조회
	@ResponseBody
	@RequestMapping(value = "getcustomerdetail/{cId}/{sid}", method = RequestMethod.GET)
	public CustomerVO getcustomer(@PathVariable("cId") String cId, @PathVariable("sid") String sid,CustomerVO vo) {
		vo.setcId(cId);
		vo.setsId(sid);
		vo = storeCustomerListService.getCustomer(vo);
		System.out.println(vo);
		
		return vo;
	}
	
	//매장 우리매장 고객 구매이력조회
	@ResponseBody
	@RequestMapping(value = "customerhistory/{cId}/{sid}", method = RequestMethod.GET)
	public List<CustomerVO> getcustomerhistory(@PathVariable("cId") String cId, @PathVariable("sid") String sid ,CustomerVO vo) {
		vo.setcId(cId);
		vo.setsId(sid);
		return storeCustomerListService.getCustomerhistory(vo);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/datesearch", method=RequestMethod.POST)
	public List<CustomerVO> getWarehousingaa(Model model, CustomerVO vo){
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		System.out.println(vo.getcId());
		return storeCustomerListService.getWarehousing(vo);
		
		
	}
	
	
	//매장 주문내역 조회
	@RequestMapping("storeorderlist.do")
	public String storeorderlist() {
		return "store/orderlist";
	}
	

	

}
