package co.yedam.cafein.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.yedam.cafein.customer.order.CustomerOrderServiceImpl;
import co.yedam.cafein.store.info.StoreInfoServiceImpl;
import co.yedam.cafein.store.menu.MenuServiceImpl;
import co.yedam.cafein.vo.MenuOrderVO;
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
		

	//장바구니->주문
	//1건 -> 단건 주문페이지, 2건 이상-> 다건 주문페이지
		@SuppressWarnings("unchecked")
		@RequestMapping(value = "cartorder", method = RequestMethod.POST)
		public ModelAndView cartorder(@RequestParam String jsonData) throws ParseException, JsonParseException, JsonMappingException, IOException {
			ModelAndView mv = new ModelAndView();
			//System.out.println(jsonData);
			JSONParser jsonParser = new JSONParser();
			JSONObject cartObj = new JSONObject();
	        JSONArray insertParam = (JSONArray) jsonParser.parse(jsonData);
	        for(int i = 0; i<insertParam.size() ;i++) {
	        	System.out.println(insertParam.get(i));
	        	cartObj = (JSONObject) insertParam.get(i);
	        }

	        
		/*
		 * MenuOrderVO vo; System.out.println(vo); mv.addObject("selectmenu", vo);
		 * mv.addObject("option", service.getorderrecipeno(vo));
		 */
	        ObjectMapper mapper = new ObjectMapper();
	        List<MenuOrderVO> meorvo = (List<MenuOrderVO>) mapper.readValue(jsonData, new TypeReference<List<MenuOrderVO>>() {});
	        
	        
	        if(meorvo.size()==1) {
	        	mv.addObject("selectmenu",meorvo.get(0));
	        	mv.addObject("option", service.getorderrecipeno(meorvo.get(0)));
	        	mv.setViewName("customer/orderregi");
	        }else if(meorvo.size()>1) {
	        	mv.addObject("cartLists",meorvo);
	        	mv.setViewName("customer/orderregimany");
	        }
	        
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
