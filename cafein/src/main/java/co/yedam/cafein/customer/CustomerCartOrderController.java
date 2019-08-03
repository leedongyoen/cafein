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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.yedam.cafein.customer.order.CustomerOrderServiceImpl;
import co.yedam.cafein.store.info.StoreInfoServiceImpl;
import co.yedam.cafein.store.menu.MenuServiceImpl;
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

	

	
	
	// 怨좉컼�옣諛붽뎄�땲 愿�由�
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
			mv.addObject("menuimg", service3.getMenuListAll(vo3));
			
			mv.setViewName("customer/cartmng");
			return mv;
		}
		

	//�옣諛붽뎄�땲->二쇰Ц
	//1嫄� -> �떒嫄� 二쇰Ц�럹�씠吏�, 2嫄� �씠�긽-> �떎嫄� 二쇰Ц�럹�씠吏�
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
	        	
	        	mv.addObject("option", service.getorderrecipeno(meorvo.get(0)));	//硫붾돱踰덊샇濡� CAOP�뱾 諛쏆븘�샂
	        	mv.setViewName("customer/orderregi");
	        }else if(meorvo.size()>1) {
	        	
	        	 //meorvo- cuoptionlist �븞�뿉 ST踰덊샇->RE 援먯껜 
	        	List<RecipeVO> opNames = service.getOptionName(vo);
	        	//System.out.println("opNames: "+opNames);
	        	
	        	
	        	
	        	
	        	int totalPrice = 0;
	        	JSONObject meorvoIn = new JSONObject();
	        	JSONArray meorvoOut = new JSONArray();
	        	ArrayList<String> addCuop = new ArrayList<String>();
	        	
	        	
	        	for(int j = 0;j<meorvo.size();j++) {
	        		
	        		addCuop.clear();
	        		String[] stList = meorvo.get(j).getCuoptionlist();
	        		//System.out.println("stList:"+stList[0]);
	        		
	        		if(stList!=null) {
	        			
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
		        		System.out.println("stLsit: "+stList);
		        		
		        		
		        		for(int d = 0;d<stList.length;d++) {
		        			System.out.println("stList.length:"+stList.length);
		        			addCuop.add(stList[d].toString());
		        			System.out.println("stList[d]: "+stList[d]);
		        		}
		        		System.out.println("::"+addCuop.toString());
		        		
	        		
	        		}
	        		meorvoIn = new JSONObject();
	        		meorvoIn.put("cuoptionlist", addCuop.toString());
	        		
	        		//totalPrice = totalPrice + Integer.parseInt(meorvo.get(j).getTotalPrice());
	        		//meorvo.get(0).setTotalPrice( (String.valueOf(totalPrice)));
	        		
	        		
	        		///�솢 �뿬湲곌� 諛붾�뚯뿀�떎怨�
	        		meorvoIn.put("cId", meorvo.get(j).getcId());
	        		meorvoIn.put("mNum", meorvo.get(j).getmNum());
	        		meorvoIn.put("sId", meorvo.get(j).getsId());
	        		meorvoIn.put("sName", meorvo.get(j).getsName());
	        		meorvoIn.put("mPrice", meorvo.get(j).getmPrice());
	        		meorvoIn.put("mName", meorvo.get(j).getmName());
	        		meorvoIn.put("orderqty", meorvo.get(j).getOrderqty());
	        		meorvoIn.put("totalPrice", meorvo.get(j).getTotalPrice());
	        		meorvoIn.put("deletenum", meorvo.get(j).getQty());
	        		
	        		meorvoOut.add(meorvoIn);
	        		
	        	}
	        	
	        	System.out.println("menrooo: "+meorvoOut.toJSONString());
	        	

	        	mv.addObject("cartLists",meorvo);
	        	mv.addObject("cartListsmero",meorvoOut);
	        	
	        	//�빐�떦 硫붾돱蹂� 紐⑤뱺 �샃�뀡�쓣 map�뿉�떎媛� �꽔怨쟭ap(string,Object)
	        	//mv addObject�뿉 map �꽔怨� 媛숈씠 蹂대궡湲� 
	        	
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
		
		
		
		
		//�떎嫄� 二쇰Ц �럹�씠吏�
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
			System.out.println("insertPa: "+insertParam);
			
			
			ArrayList<String> cartcnt = (ArrayList<String>) insertParam.get("mNum");
			ArrayList<String> hoticeop = (ArrayList<String>) insertParam.get("hotice_option");
			ArrayList<String> oqtyy = (ArrayList<String>) insertParam.get("oQty");

			
			
		  for(int i = 0; i<cartcnt.size() ;i++) {
			  OrdersVO vo = new OrdersVO();
			  System.out.println(cartcnt.get(i));
			  //�빐�떦 硫붾돱�쓽 �꽑�깮�븳 �샃�뀡�뱾�쓣 list�꽔�쓬
			  vo.setmNum(cartcnt.get(i));
			  
			  
			  ArrayList<String> oplistarr = new ArrayList<String>();
			  
			
			  
			  Object insertParam2 =  insertParam.get(cartcnt.get(i).toString());
			  
			  System.out.println("===================="+insertParam2);
			  if(insertParam2 == null)
			  {	
				  //�샃�뀡�씠 �뾾�뒗 硫붾돱
				  System.out.println("�샃�뀡�씠 �뾾�뒗 硫붾돱 �엯�땲�떎.");
			  }else if(insertParam2.toString().length() > 6) {
				  //�샃�뀡�씠 �뿬�윭媛쒖씤 硫붾돱
				  oplistarr =(ArrayList<String>) insertParam2;
				  System.out.println("::::"+oplistarr.toString());
				  
				  String[] oplist = new String[oplistarr.size()];
				  oplist= oplistarr.toArray(oplist);
				  vo.setOptionlist(oplist);
			  }else {
				  //�샃�뀡�씠 �븯�굹�씤 硫붾돱
				  System.out.println("===================="+insertParam2);
				  oplistarr = new ArrayList<String>();
				  String[] oplist = new String[1];
				  oplistarr.add(insertParam2.toString());
				  oplist = oplistarr.toArray(oplist);
				  vo.setOptionlist(oplist);
			  }
			  System.out.println("==========full option list"+vo.getOptionlist());
			  
			  
			  vo.setcAdd((String) insertParam.get("cAdd"));
			  vo.setcAdd3((String) insertParam.get("cAdd3"));
			  vo.setsId((String) insertParam.get("sId")); 
			  vo.setTotal(Integer.parseInt((String)insertParam.get("total")));
			  vo.setPayMethod((String) insertParam.get("payMethod"));
			  vo.setReceipt((String) insertParam.get("receipt"));
			  vo.setcId((String) insertParam.get("cId"));
			  vo.setMileage( Integer.parseInt((String)insertParam.get("mileage"))); 
			 
			  
			  
			/*
			 * String[] hioption = new String[hoticeop.size()]; hioption=
			 * hoticeop.toArray(hioption); vo.setHotice_option(hoticeop.get(i));
			 */
			  
			  String[] hioption = new String[hoticeop.size()];
			  hioption= hoticeop.toArray(hioption);
			  vo.setHotice_option(hoticeop.get(i)); 
			  
			  //String[] oqtty = new String[oqtyy.size()];
			  //oqtty= oplistarr.toArray(oqtty);
			  vo.setoQty(oqtyy.get(i));
		
			   
			  cartorder.add(vo);
			  System.out.println(vo);
				  
		 }
		  
		  
		  
		  //order �꽔湲� start
		  	OrdersVO info = new OrdersVO();
				info = cartorder.get(0);
			  
			
				if(cartorder.get(0).getReceipt().equals("takeout")) {
					cartorder.get(0).setcAdd("");
					cartorder.get(0).setcAdd3("");
					
				}
				cartorder.get(0).setDeliveryStatus("C0");
				
				// orders�뀒�씠釉붿뿉 �꽔湲�
				service.insertorder(cartorder.get(0));
				
				
				
				
				
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				
				  for(int c = 0;c<cartorder.size();c++) {
					  
					  List<OrdersVO> orderlist = new ArrayList<OrdersVO>();
					  info = cartorder.get(c);
					/*怨듯넻�뜲�씠�꽣瑜� �뮘�뿉 �삤�뒗 硫붾돱�뱾�뿉�룄 �꽔�뼱以섏빞�븿

*�떎嫄�
*怨듯넻�쑝濡� �뱾�뼱媛덇굅
x cAdd=��援ъ떆 �닔�꽦援�, 
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
					  
					  
				// order details �뀒�씠釉붿뿉 �꽔�쓣 vo
				RecipeVO recipevo = new RecipeVO();
				recipevo.setmNum(cartorder.get(c).getmNum());
				// �빐�떦 硫붾돱�쓽 湲곕낯 �젅�떆�뵾 踰덊샇
				List<RecipeVO> recipelist = service.getorderrecipenolist(recipevo);
				OrdersVO insertvo;
				
				// �빐�떦 硫붾돱�쓽 湲곕낯 �젅�떆�뵾 �꽔湲�
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
						// �굹留덉� 怨듯넻
						insertvo.setoQty(info.getoQty());
						insertvo.setReceipno(recipelist.get(n).getRecipeno());
						insertvo.setCaNum(recipelist.get(n).getCaNum());
						
						orderlist.add(insertvo);
					}

				}
				
				// �빐�떦 硫붾돱�쓽 �샃�뀡泥섎━
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
	
				
				
				System.out.println("======== �셿�꽦" + orderlist);
				
				map.put("list", orderlist);
				
				
				  System.out.println("map: "+map.get("list").toString());
				
				
				//***** �뿬�윭媛� �꽔湲�
				// order details �뀒�씠釉붿뿉 �꽔湲�
				int n = service.insertorderdetails(map);
		
				System.out.println("===========寃곌낵 : "+n);
				n = service.getodnum2(info);
		}		
				
				// �빐�떦 二쇰Ц踰덊샇�쓽 op_dnum�닔�젙
				  //if(info.getMileageservice().equals("Y")) {
					int n = service.setcanclemileage(info);
					//異붽��맂 留덉씪由ъ� �뾽�뜲�씠�듃 
					n = service.updatemileage(info);
					
					// �빐�떦 留ㅼ옣�뿉 ���븳 留덉씪由ъ�媛� �뾾�쓣 寃쎌슦
					if(n == 0) {
						n = service.insertmileage(info);
					}
				  //}
			
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
		 
	        
		  	mv.setViewName("customer/orderCheck");
			return mv;
		}
	
}
