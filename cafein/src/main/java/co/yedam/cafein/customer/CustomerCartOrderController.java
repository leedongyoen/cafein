package co.yedam.cafein.customer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.cafein.customer.order.CustomerOrderServiceImpl;
import co.yedam.cafein.store.info.StoreInfoServiceImpl;
import co.yedam.cafein.store.menu.MenuServiceImpl;
import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.RecipeVO;
import co.yedam.cafein.vo.StoreVO;

@Controller
public class CustomerCartOrderController {

	@Autowired
	CustomerOrderServiceImpl service;
	@Autowired
	StoreInfoServiceImpl service2;
	@Autowired
	MenuServiceImpl service3;
	
	
	
	// 고객장바구니 관리
		@RequestMapping(value = "cartmng", method = RequestMethod.GET)
		public ModelAndView cartmng(ModelAndView mv, HttpSession session) {

			// ArrayList<CartVO> list = (ArrayList<CartVO>)session.getAttribute("cartlist");
			// for(int i = 0;i<list.size();i++) {
			// System.out.println(list.get(i).toString()); }

			RecipeVO vo = new RecipeVO();
			StoreVO vo2 = new StoreVO();
			MenuVO vo3 = new MenuVO();
			mv.addObject("optionname", service.getOptionName(vo));		
			mv.addObject("storename",service2.getStoreList(vo2) );
			mv.addObject("menuimg", service3.getMenuList(vo3));
			
			mv.setViewName("customer/cartmng");
			return mv;
		}
		


		/*
		 * @RequestMapping(value="cartmng",method=RequestMethod.GET) public ModelAndView
		 * cartmng(ModelAndView mv, HttpSession session) { //getSession CartVO를 꺼내고
		 * //Mapper Query 돌아서 나머지 상세정보들을 들고와서 cartmng.jsp 보낸다 MenuVO vo = new MenuVO();
		 * RecipeVO vo2 = new RecipeVO();
		 * 
		 * 
		 * ArrayList<CartVO> list = (ArrayList<CartVO>)session.getAttribute("cartlist");
		 * for(int i = 0;i<list.size();i++) {
		 * System.out.println(list.get(i).toString()); }
		 * 
		 * mv.setViewName("customer/cartmng"); return mv; }
		 * 
		 */
	
}
