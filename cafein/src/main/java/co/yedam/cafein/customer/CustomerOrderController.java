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

import co.yedam.cafein.customer.order.CustomerOrderServiceImpl;
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
	
	// 주문으로 넘어가는 부분
	
	  @RequestMapping(value="/customerorder",method=RequestMethod.POST) 
	  public ModelAndView customerorder(MenuOrderVO vo){ 
		  ModelAndView mv = new ModelAndView();
		  mv.addObject("selectmenu",vo );
		  System.out.println("================== 주문 내역 :"+vo);
		  mv.addObject("option",service.getorderrecipeno(vo));
		  mv.setViewName("customer/orderregi");
		  return mv;
	  }
	  
	// 배달서비스 여부
	@ResponseBody
	@RequestMapping(value="/getstoredeliverservice", method=RequestMethod.GET)
	public int getstoredeliverservice(String sId) {
		
		return service.getstoredeliverservice(sId);
	}
	  
	
	//고객 주문 페이지로 이동.
	@RequestMapping("orderlist.do")
	public String orderlist() {
		return "customer/orderlist";
	}
	
	// 고객 주문 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/orderlist/{cid}", method=RequestMethod.GET)
	public List<OrdersVO> getOrderList(@PathVariable("cid") String cId){
		OrdersVO vo = new OrdersVO();
		vo.setcId(cId);

		return service.getOrderList(vo);
	}
	
	// 주문 넣기
	@RequestMapping(value="/insertcustomerorder", method=RequestMethod.POST) 
	public ModelAndView insertorder(OrdersVO vo) {
		System.out.println("============주문 :"+vo);
		ModelAndView mv = new ModelAndView();
		/*
		 * String oNum = service.getordernumber(vo.getsId()); vo.setoNum(oNum);
		 */
		OrdersVO info = new OrdersVO();
		info = vo;
		service.insertorder(vo);
		List<OrdersVO> orderlist = new ArrayList<OrdersVO>();
		RecipeVO recipevo = new RecipeVO();
		recipevo.setmNum(vo.getmNum());
		List<RecipeVO> recipelist = service.getorderrecipenolist(recipevo);
		
		OrdersVO insertvo;
		
		// 해당 메뉴의 기본 레시피 넣기
		for(int n=0; n<recipelist.size();n++) {
			insertvo = new OrdersVO();
			insertvo.setoNum(vo.getoNum());
			insertvo.setmNum(info.getmNum());
			
			if(recipelist.get(n).getCaNum().equals("CAHT") && recipelist.get(n).getCaNum().equals(info.getHotice_option())) {
				insertvo.setoQty("0");
				insertvo.setReceipno(recipelist.get(n).getRecipeno());
				insertvo.setCaNum(recipelist.get(n).getCaNum());
			}else if(recipelist.get(n).getCaNum().equals("CAIC") && recipelist.get(n).getCaNum().equals(info.getHotice_option())) {
				insertvo.setoQty("0");
				insertvo.setReceipno(recipelist.get(n).getRecipeno());
				insertvo.setCaNum(recipelist.get(n).getCaNum());
			}else {
				insertvo.setoQty(info.getoQty());
				insertvo.setReceipno(recipelist.get(n).getRecipeno());
				insertvo.setCaNum(recipelist.get(n).getCaNum());
			}
			
			orderlist.add(insertvo);
		}
		
		// 해당 메뉴의 옵션처리
		String[] optionlist = info.getOptionlist();
		for(int n=0; n<optionlist.length;n++) {
			
			insertvo = new OrdersVO();
			insertvo.setoNum(vo.getoNum());
			insertvo.setmNum(info.getmNum());
			insertvo.setoQty(info.getoQty());
			insertvo.setReceipno(optionlist[n]);
			insertvo.setCaNum("CAOP");
			orderlist.add(insertvo);
		}
		
		System.out.println("======== 완성"+orderlist);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", orderlist);
		
		int n = service.insertorderdetails(map);
		System.out.println("===========결과 : "+n);

		mv.setViewName("customer/delivery");
		return mv;
	}
	
	//고객 주문배달 조회
	@RequestMapping("delivery.do")
	public String delivery() {
		return "customer/delivery";
	}
	//고객 주문상세 조회
	@RequestMapping("orderdetails.do")
	public String orderdetails() {
		return "customer/orderdetails";
	}
	//고객장바구니 관리

	  @RequestMapping(value="cartmng",method=RequestMethod.GET) public ModelAndView
	  cartmng(ModelAndView mv, HttpSession session) {
	  
	 // ArrayList<CartVO> list = (ArrayList<CartVO>)session.getAttribute("cartlist");
	 // for(int i = 0;i<list.size();i++) {
	 // System.out.println(list.get(i).toString()); }
	  
	  
	  RecipeVO vo = new RecipeVO();
	  mv.addObject("optionname",service.getOptionName(vo));
	  
	  
	  
	  
	  
		/*
		 * ArrayList<CartVO> list = (ArrayList<CartVO>)session.getAttribute("cartlist");
		 * 
		 * if(list == null) { list = new ArrayList<CartVO>(); list.add(vo); }else{
		 * list.add(vo); }
		 * 
		 * session.setAttribute("cartlist", list);
		 * System.out.println("session : "+session.getAttribute("cartlist"));
		 * 
		 */
	  
	  
	  
	  ArrayList<CartVO> list = (ArrayList<CartVO>)session.getAttribute("cartlist");
	  if(list != null) {
		  for(int i = 0;i<list.size();i++) {
				System.out.println("-----------------------------------"+list.get(i).toString());
			}  
	  }else if(list == null) {
		  System.out.println("없음");
	  }
	  
	  mv.setViewName("customer/cartmng"); return mv; }
	 
	  
	  
	/*
	@RequestMapping(value="cartmng",method=RequestMethod.GET)
	public ModelAndView cartmng(ModelAndView mv, HttpSession session) {
		//getSession CartVO를 꺼내고 
		//Mapper Query 돌아서 나머지 상세정보들을 들고와서 cartmng.jsp 보낸다
		MenuVO vo = new MenuVO();
		RecipeVO vo2 = new RecipeVO();
		
		
		ArrayList<CartVO> list = (ArrayList<CartVO>)session.getAttribute("cartlist");
		for(int i = 0;i<list.size();i++) {
			System.out.println(list.get(i).toString());
		}
		
		mv.setViewName("customer/cartmng");
		return mv;
	}
	
	*/
	

}
