package co.yedam.cafein.customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.cafein.common.Paging;
import co.yedam.cafein.customer.order.CustomerOrderServiceImpl;
import co.yedam.cafein.store.info.StoreInfoServiceImpl;
import co.yedam.cafein.store.menu.MenuServiceImpl;
import co.yedam.cafein.store.order.StoreOrderServiceImpl;
import co.yedam.cafein.vo.CustomerVO;
import co.yedam.cafein.vo.MenuOrderVO;
import co.yedam.cafein.vo.OrderDetailsVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.StoreVO;

@Controller
public class CustomerOrderController {

	@Autowired
	CustomerOrderServiceImpl service;
	@Autowired
	StoreInfoServiceImpl service2;
	@Autowired
	StoreOrderServiceImpl storeorderservice;
	@Autowired
	MenuServiceImpl service3;
	
	
	// 주문 페이지에서 고객이 입력한 주소와 선택한 매장과의 거리 계산을 위해서
	@ResponseBody
	@RequestMapping(value = "/getorderstoreaddress", method = RequestMethod.GET)
	public StoreVO getorderstoreaddress(StoreVO vo) {

		return service.getorderstoreaddress(vo);
	}
	
	// 주문으로 넘어가는 부분 
	@RequestMapping(value = "/customerorder", method = RequestMethod.POST)
	public ModelAndView customerorder(MenuOrderVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("selectmenu", vo);
		System.out.println("================== 주문 내역 :" + vo);
		mv.addObject("option", service.getorderrecipeno(vo));
		mv.setViewName("customer/orderregi");
		return mv;
	}
	
	// 자주 이용하는 매장목록
	@ResponseBody
	@RequestMapping(value = "/gettopstorelist", method = RequestMethod.GET)
	public List<StoreVO> gettopstorelist(CustomerVO vo) {

		return service.gettopstorelist(vo);
	}

	// 배달서비스 여부
	@ResponseBody
	@RequestMapping(value = "/getstoredeliverservice", method = RequestMethod.GET)
	public int getstoredeliverservice(String sId) {

		return service.getstoredeliverservice(sId);
	}
	
	// 마일리지 서비스 여부
	@ResponseBody
	@RequestMapping(value = "/getstoremileageservice", method = RequestMethod.GET)
	public String getstoremileageservice(String sId) {
		return service.getstoremileageservice(sId);
	}
	
	// 고객이 직접 주문 취소한 경우
	@ResponseBody
	@RequestMapping(value = "/updatecusordercancel", method = RequestMethod.GET)
	public int updatecusordercancel(OrdersVO vo) {
		
		// 주문 취소
		int n = service.updatecusordercancel(vo);
		// 마일리지 서비스 여부 확인
		String mileageservice = service.getstoremileageservice(vo.getsId());
		vo.setMileageservice(mileageservice);
		// 마일리지 수정을 위해서
		if(n > 0 && mileageservice.equals("Y")) {		
			n = storeorderservice.updateordermileage(vo);

		}
		
		return n;
	}

	// 고객 주문 페이지로 이동.
	@RequestMapping("orderlist.do")
	public String orderlist() {
		return "customer/orderlist";
	}

	// 고객 주문 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public Map<String, Object> getOrderList(OrdersVO vo, HttpSession session) {
		/*
		 * OrdersVO vo = new OrdersVO(); vo.setcId(cId);
		 */
		
		Paging paging = new Paging();
		paging.setPage(vo.getCheckpagenum());
		
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		
		
		// 전체 건수 받아오기
		paging.setTotalRecord(service.getorderlistcount(vo));
		
		/*
		 * // 보여주는 행의 처음과 끝 vo.setStartPage(paging.getStartPage());
		 * vo.setEndPage(paging.getEndPage());
		 * 
		 * // 마지막 페이지번호 vo.setLastPage(paging.getLastPage());
		 */
		
		System.out.println("================getTotalRecord"+
					paging.getTotalRecord()+
					"=== getCheckpagenum"+
					vo.getCheckpagenum()
					+"=== getStart"+
					vo.getStart()
					+"=== getEnd"+
					vo.getEnd()
					+"=== getStartPage"+
					vo.getStartPage()
					+"=== getEndPage"+
					vo.getEndPage()
					+"=== getLastPage"+
					vo.getLastPage()

				);
		List<OrdersVO> orderlist = service.getOrderList(vo);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", orderlist);
		result.put("paging", paging);
		
		return result;
	}
	
	// 고객 페이지 - 주문 클릭시 메뉴 상세
	@ResponseBody
	@RequestMapping(value = "/getcustomerordermenudetail", method = RequestMethod.GET)
	public List<OrderDetailsVO> getstoreorderdetails(OrdersVO vo) {

		return service.getcustomerordermenudetail(vo);
	}
	
	// 고객 페이지 - 주문 클릭시 주문 상세
	@ResponseBody
	@RequestMapping(value = "/getcustomeroderdetail", method = RequestMethod.GET)
	public OrdersVO getcustomeroderdetail(OrdersVO vo) {

		return service.getcustomeroderdetail(vo);
	}

	
	//메인에서 고객 총주문금액 리스트 
	@RequestMapping(value="mainorderlist.do", method=RequestMethod.GET)
	@ResponseBody
	public List<OrdersVO> mainOrderList(OrdersVO vo) {
		System.out.println(vo);
		return service.mainOrderList(vo);
	}
	

	// 주문 넣기
	@RequestMapping(value = "/insertcustomerorder", method = RequestMethod.POST)
	public String insertorder(OrdersVO vo) {
		System.out.println("============주문 :" + vo);
		ModelAndView mv = new ModelAndView();
		/*
		 * String oNum = service.getordernumber(vo.getsId()); vo.setoNum(oNum);
		 */
		OrdersVO info = new OrdersVO();
		info = vo;
		
		//orders 테이블에 넣기 
		if(vo.getReceipt().equals("takeout")) {
			vo.setcAdd("");
			vo.setcAdd3("");
			
		}
		
		vo.setDeliveryStatus("C0");
		
		// orders테이블에 넣기
		service.insertorder(vo);
		
		// 마일리지 사용했으면 마일리지 업데이트
		if(info.getMileage() > 0) {
			info.setoNum(vo.getoNum());
			int n = service.setcanclemileage(info);
			
		}
		
		// order details 테이블에 넣을 list
		List<OrdersVO> orderlist = new ArrayList<OrdersVO>();
		// order details 테이블에 넣을 vo
		RecipeVO recipevo = new RecipeVO();
		recipevo.setmNum(vo.getmNum());
		
		// 해당 메뉴의 기본 레시피 번호
		List<RecipeVO> recipelist = service.getorderrecipenolist(recipevo);

		OrdersVO insertvo;

		// 해당 메뉴의 기본 레시피 넣기
		for (int n = 0; n < recipelist.size(); n++) {
			insertvo = new OrdersVO();
			insertvo.setoNum(vo.getoNum());
			insertvo.setmNum(info.getmNum());

			if ((recipelist.get(n).getCaNum().equals("CAIC") && recipelist.get(n).getCaNum().equals(info.getHotice_option()))) {
				insertvo.setoQty("0");
				insertvo.setReceipno(recipelist.get(n).getRecipeno());
				insertvo.setCaNum(recipelist.get(n).getCaNum());

				orderlist.add(insertvo);
				
			}else if((recipelist.get(n).getCaNum().equals("CAHT") && recipelist.get(n).getCaNum().equals(info.getHotice_option()))) {

				insertvo.setoQty("0");
				insertvo.setReceipno(recipelist.get(n).getRecipeno());
				insertvo.setCaNum(recipelist.get(n).getCaNum());
				orderlist.add(insertvo);

			}else if((recipelist.get(n).getCaNum().equals("CAHT") && !(recipelist.get(n).getCaNum().equals(info.getHotice_option())))
						|| (recipelist.get(n).getCaNum().equals("CAIC") && !(recipelist.get(n).getCaNum().equals(info.getHotice_option())))) {
				System.out.println("================= not hot/ice :"+recipelist.get(n).getCaNum());
				continue;
				
			}else{
				// 나마지 공통
				insertvo.setoQty(info.getoQty());
				insertvo.setReceipno(recipelist.get(n).getRecipeno());
				insertvo.setCaNum(recipelist.get(n).getCaNum());
				orderlist.add(insertvo);
			}


		}

		
		// 해당 메뉴의 옵션처리
		if( info.getOptionlist() != null) {
			System.out.println(vo.getOptionlist());
			
			String[] optionlist = info.getOptionlist();
			for (int n = 0; n < optionlist.length; n++) {
				
				insertvo = new OrdersVO();
				insertvo.setoNum(vo.getoNum());
				insertvo.setmNum(info.getmNum());
				insertvo.setoQty(info.getoQty());
				insertvo.setReceipno(optionlist[n]);
				insertvo.setCaNum("CAOP");
				orderlist.add(insertvo);
			}
		}

		System.out.println("======== 완성" + orderlist);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", orderlist);
		
		// order details 테이블에 넣기
		int n = service.insertorderdetails(map);

		System.out.println("===========결과 : "+n);
		
		// 해당 주문번호의 op_dnum수정
		n = service.getodnum(info);
		
		// 해당 매장의 마일리지 서비스를 할 경우에만.
		if(info.getMileageservice().equals("Y")) {
			
			// 마일리지 업데이트
			n = service.updatemileage(info);
			
			// 해당 매장에 대한 마일리지가 없을 경우
			if(n == 0) {
				n = service.insertmileage(info);
			}
		}
		return "redirect:orderlist.do";
	}

	// 고객 주문배달 조회
	@RequestMapping("delivery.do")
	public String delivery() {
		return "customer/delivery";
	}

	// 고객 주문상세 조회
	@RequestMapping("orderdetails.do")
	public String orderdetails() {
		return "customer/orderdetails";
	}


}
