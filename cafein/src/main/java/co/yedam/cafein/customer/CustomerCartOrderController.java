package co.yedam.cafein.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.yedam.cafein.customer.order.CustomerOrderServiceImpl;
import co.yedam.cafein.store.info.StoreInfoServiceImpl;
import co.yedam.cafein.store.menu.MenuServiceImpl;
import co.yedam.cafein.store.menu.RecipeSerciveImpl;
import co.yedam.cafein.vo.MenuOrderVO;
import co.yedam.cafein.vo.MenuVO;
import co.yedam.cafein.vo.OrdersVO;
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
	        RecipeVO vo=new RecipeVO();
	        
		/*
		 * MenuOrderVO vo; System.out.println(vo); mv.addObject("selectmenu", vo);
		 * mv.addObject("option", service.getorderrecipeno(vo));
		 */
	        ObjectMapper mapper = new ObjectMapper();
	        List<MenuOrderVO> meorvo = (List<MenuOrderVO>) mapper.readValue(jsonData, new TypeReference<List<MenuOrderVO>>() {});
	        System.out.println("meorvo: "+meorvo);
	        mv.addObject("selectmenu",meorvo.get(0));
	        
	        if(meorvo.size()==1) {
	        	
	        	mv.addObject("option", service.getorderrecipeno(meorvo.get(0)));	//메뉴번호로 CAOP들 받아옴
	        	mv.setViewName("customer/orderregi");
	        }else if(meorvo.size()>1) {
	        	
	        	 //meorvo- cuoptionlist 안에 ST번호->RE 교체 
	        	List<RecipeVO> opNames = service.getOptionName(vo);
	        	//System.out.println("opNames: "+opNames);
	        	
	        	for(int j = 0;j<meorvo.size();j++) {
	        		String[] stList = meorvo.get(j).getCuoptionlist();
	        		
	        		for(int s = 0; s<stList.length;s++) {
	        			//System.out.println("stList: "+stList[s]);
	        			
	        			for(int w = 0;w<opNames.size();w++) {
	        				
	        				if(meorvo.get(j).getmNum().equals(opNames.get(w).getmNum())) {
	        					//System.out.println("size: meorvo.get(j).getmNum():"+meorvo.get(j).getmNum());
	        					//System.out.println("size: opNames.get(w).getmNum():"+opNames.get(w).getmNum());
	        					if(opNames.get(w).getStNum().equals(stList[s])) {
		        					stList[s] = opNames.get(w).getRecipeno();
		        					//System.out.println("afterL: "+stList[s]);
		        				}	
	        				}
	        				
	        			}
	        		}
	        		meorvo.get(j).setCuoptionlist(stList);
	        	}
	        	
	        	System.out.println("수정: "+meorvo);
	        	
	        	
	        	
	        	mv.addObject("cartLists",meorvo);
	        	//해당 메뉴별 모든 옵션을 map에다가 넣고map(string,Object)
	        	//mv addObject에 map 넣고 같이 보내기 
	        	
	        	Map<String, Object> map  = new HashMap<String, Object>();
	        	List<RecipeVO> cuoptions = new ArrayList<RecipeVO>();
	        	
	        	
	        	for(int v = 0;v < meorvo.size();v++) {
	        		ArrayList<String> stlist = new ArrayList<String>();
	        		cuoptions = service.getorderrecipeno(meorvo.get(v));
	        		for(int k = 0;k<cuoptions.size();k++) {
	        			stlist.add(cuoptions.get(k).getRecipeno());
	        		}
	        		map.put(meorvo.get(v).getmNum(),stlist);
	        		
	        		
	        		//map.put(meorvo.get(v).getmNum(), );
	        		
	        		//maplist.add(map);
	        	}
	        	System.out.println("cup: "+map);
	        	mv.addObject("menumap",map);
	        	mv.addObject("optionname",opNames);
	        	mv.setViewName("customer/orderregimany");
	        }
	        
			return mv;
		}
		
		@SuppressWarnings("unchecked")
		@RequestMapping(value = "ordercartmany", method = RequestMethod.POST)
		public ModelAndView ordercartmany(@RequestParam String jsonData) throws ParseException, JsonParseException, JsonMappingException, IOException {
			ModelAndView mv = new ModelAndView();
			System.out.println("je:  "+jsonData);
			
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
			
			List<OrdersVO> cartorder = new ArrayList<OrdersVO>();
			JSONParser jsonParser = new JSONParser();
			
			JSONObject insertParam = (JSONObject) jsonParser.parse(jsonData);
			System.out.println(insertParam);
			
			
			ArrayList<String> cartcnt = (ArrayList<String>) insertParam.get("mNum");
			ArrayList<String> hoticeop = (ArrayList<String>) insertParam.get("hotice_option");
			ArrayList<String> oqtyy = (ArrayList<String>) insertParam.get("oQty");

			
		  for(int i = 0; i<cartcnt.size() ;i++) {
			  OrdersVO vo = new OrdersVO();
			  System.out.println(cartcnt.get(i));
			  //해당 메뉴의 선택한 옵션들을 list넣음
			  vo.setmNum(cartcnt.get(i));
			  
			  ArrayList<String> oplistarr =(ArrayList<String>) insertParam.get(cartcnt.get(i).toString());
			  String[] oplist = new String[oplistarr.size()];
			  oplist= oplistarr.toArray(oplist);
			  
			  vo.setOptionlist(oplist);
			  vo.setcAdd((String) insertParam.get("cAdd"));
			  vo.setcAdd3((String) insertParam.get("cAdd3"));
			  vo.setsId((String) insertParam.get("sId")); 
			  vo.setTotal(Integer.parseInt((String)insertParam.get("total")));
			  vo.setPayMethod((String) insertParam.get("payMethod"));
			  vo.setReceipt((String) insertParam.get("receipt"));
			  vo.setcId((String) insertParam.get("cId"));
			  vo.setMileage( Integer.parseInt((String)insertParam.get("mileage"))); 
			  
			  
			  String[] hioption = new String[hoticeop.size()];
			  hioption= hoticeop.toArray(hioption);
			  vo.setHotice_option(hoticeop.get(i)); 
			  
			  String[] oqtty = new String[oqtyy.size()];
			  oqtty= oplistarr.toArray(oqtty);
			  vo.setoQty(oqtyy.get(i));
		
			  cartorder.add(vo);
			  System.out.println(vo);
				  
		 }
		  
		  
		  
		  //order 넣기 start
		  	OrdersVO info = new OrdersVO();
				info = cartorder.get(0);
			  
			
				if(cartorder.get(0).getReceipt().equals("takeout")) {
					cartorder.get(0).setcAdd("");
					cartorder.get(0).setcAdd3("");
					
				}
				cartorder.get(0).setDeliveryStatus("C0");
				
				// orders테이블에 넣기
				service.insertorder(cartorder.get(0));
				
				
				
				
				
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				
				  for(int c = 0;c<cartorder.size();c++) {
					  
					  List<OrdersVO> orderlist = new ArrayList<OrdersVO>();
					  info = cartorder.get(c);
					/*공통데이터를 뒤에 오는 메뉴들에도 넣어줘야함

*다건
*공통으로 들어갈거
x cAdd=대구시 수성구, 
x cAdd3=, 
x cId=moss123,
x mileage=0,
x payMethod=card, 
x receipt=delivery, 
x sId=SH001,
x total=1010,

		*/
					  
						  cartorder.get(c).setoNum(cartorder.get(0).getoNum());
						  cartorder.get(c).setcAdd(cartorder.get(0).getcAdd());
						  cartorder.get(c).setcAdd3(cartorder.get(0).getcAdd3());
						  cartorder.get(c).setcId(cartorder.get(0).getcId());
						  cartorder.get(c).setMileage(cartorder.get(0).getMileage()); 
						  cartorder.get(c).setPayMethod(cartorder.get(0).getPayMethod()); 
						  cartorder.get(c).setReceipt(cartorder.get(0).getReceipt());  
						  cartorder.get(c).setsId(cartorder.get(0).getsId());  
						  cartorder.get(c).setTotal(cartorder.get(0).getTotal());  
						
					//...
					  
					  
				// order details 테이블에 넣을 vo
				RecipeVO recipevo = new RecipeVO();
				recipevo.setmNum(cartorder.get(c).getmNum());
				// 해당 메뉴의 기본 레시피 번호
				List<RecipeVO> recipelist = service.getorderrecipenolist(recipevo);
				OrdersVO insertvo;
				
				// 해당 메뉴의 기본 레시피 넣기
				for (int n = 0; n < recipelist.size(); n++) {
					insertvo = new OrdersVO();
					insertvo.setoNum(cartorder.get(c).getoNum());
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
									
					String[] optionlist = info.getOptionlist();
					for (int n = 0; n < optionlist.length; n++) {
						
						insertvo = new OrdersVO();
						insertvo.setoNum(cartorder.get(c).getoNum());
						insertvo.setmNum(info.getmNum());
						insertvo.setoQty(info.getoQty());
						insertvo.setReceipno(optionlist[n]);
						insertvo.setCaNum("CAOP");

						orderlist.add(insertvo);
					}
					
				}
	
				
				
				System.out.println("======== 완성" + orderlist);
				
				map.put("list", orderlist);
				
				
				  System.out.println("map: "+map.get("list").toString());
				
				
				//***** 여러개 넣기
				// order details 테이블에 넣기
				int n = service.insertorderdetails(map);
		
				System.out.println("===========결과 : "+n);
				n = service.getodnum2(info);
		}		
				
				// 해당 주문번호의 op_dnum수정
					
					
					// 마일리지 업데이트
					int n = service.updatemileage(info);
					
					// 해당 매장에 대한 마일리지가 없을 경우
					if(n == 0) {
						n = service.insertmileage(info);
					}
				
			
		/*
		 * JSONParser jsonParser = new JSONParser(); JSONObject cartObj = new
		 * JSONObject(); JSONArray insertParam = (JSONArray) jsonParser.parse(jsonData);
		 * for(int i = 0; i<insertParam.size() ;i++) {
		 * System.out.println(insertParam.get(i)); cartObj = (JSONObject)
		 * insertParam.get(i); } RecipeVO vo=new RecipeVO();
		 */
			

		
		  //ObjectMapper mapper = new ObjectMapper(); 
		  //List<OrdersVO> meorvo = (List<OrdersVO>) mapper.readValue(jsonData, new TypeReference<List<OrdersVO>>() {});
		  //System.out.println("meorvo: "+meorvo);
		 
	        
		  	mv.setViewName("customer/delivery");
			return mv;
		}
	
}
