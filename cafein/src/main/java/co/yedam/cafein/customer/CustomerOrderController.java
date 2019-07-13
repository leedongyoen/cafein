package co.yedam.cafein.customer;

import java.util.ArrayList;
import java.util.List;

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
	@Autowired
	MenuServiceImpl service2;
	@Autowired
	RecipeSerciveImpl service3;

	
	// 주문으로 넘어가는 부분
	  @RequestMapping(value="/customerorder",method=RequestMethod.POST) 
	  public ModelAndView customerorder(MenuOrderVO vo){ 
		  ModelAndView mv = new ModelAndView();
		  mv.addObject("selectmenu",vo );

		  StoreVO stvo = new StoreVO();
		  stvo.setSid(vo.getsId());
		  System.out.println(stvo.getSid());
		  mv.addObject("store",service.getSearchStore(stvo));
		  mv.setViewName("customer/orderregi");
		  return mv;
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
	/*
	 * @RequestMapping(cartmng.do) 
	 * public String cartmng() { return "customer/cartmng"; }
	 */
	
	@RequestMapping(value="cartmng",method=RequestMethod.GET)
	public ModelAndView cartmng(ModelAndView mv, HttpSession session) {
		//getSession CartVO를 꺼내고 
		//Mapper Query 돌아서 나머지 상세정보들을 들고와서 cartmng.jsp 보낸다
		MenuVO vo = new MenuVO();
		RecipeVO vo2 = new RecipeVO();
		
		mv.addObject("storemenu",service2.getMenuList(vo));
		mv.addObject("storerecipe",service3.getRecipeDetailList(vo2));
		ArrayList<CartVO> list = (ArrayList<CartVO>)session.getAttribute("cartlist");
		for(int i = 0;i<list.size();i++) {
			System.out.println(list.get(i).toString());
		}
		
		mv.setViewName("customer/cartmng");
		return mv;
	}
	//
	
	

}
