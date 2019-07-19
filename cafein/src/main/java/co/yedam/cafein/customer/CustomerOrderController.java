package co.yedam.cafein.customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.JsonObject;

import co.yedam.cafein.customer.order.CustomerOrderServiceImpl;
import co.yedam.cafein.store.info.StoreInfoServiceImpl;
import co.yedam.cafein.store.menu.MenuServiceImpl;
import co.yedam.cafein.store.menu.RecipeSerciveImpl;
import co.yedam.cafein.vo.CartVO;
import co.yedam.cafein.vo.MenuOrderVO;
import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.MyMenuVO;
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
	MenuServiceImpl service3;
	
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

	// 고객 주문 페이지로 이동.
	@RequestMapping("orderlist.do")
	public String orderlist() {
		return "customer/orderlist";
	}

	// 고객 주문 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "/orderlist/{cid}", method = RequestMethod.GET)
	public List<OrdersVO> getOrderList(@PathVariable("cid") String cId) {
		OrdersVO vo = new OrdersVO();
		vo.setcId(cId);

		return service.getOrderList(vo);
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
	public ModelAndView insertorder(OrdersVO vo) {
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
		
		// 마일리지 업데이트
		n = service.updatemileage(info);
		
		// 해당 매장에 대한 마일리지가 없을 경우
		if(n == 0) {
			n = service.insertmileage(info);
		}
		
		mv.setViewName("customer/delivery");
		return mv;
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
