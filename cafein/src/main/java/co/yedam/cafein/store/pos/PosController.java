package co.yedam.cafein.store.pos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.yedam.cafein.customer.order.CustomerOrderServiceImpl;
import co.yedam.cafein.viewvo.ViewPosCusSearchVO;
import co.yedam.cafein.viewvo.ViewPosOrdetailsVO;
import co.yedam.cafein.viewvo.ViewPosVO;
import co.yedam.cafein.vo.OrderDetailsVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.RecipeVO;

@Controller
public class PosController {
	@Autowired
	PosService posService;
	@Autowired
	CustomerOrderServiceImpl cusService;
	
	//매장 주문하기
	@RequestMapping("/pos.do")
	public String pos() {
		return "store/pos";
	}
	
	//메뉴조회
	@ResponseBody
	@RequestMapping(value="/pos/{sId}", method=RequestMethod.GET)
	public List<ViewPosVO> getStoreMenuList(ViewPosVO vo, @PathVariable("sId") String sId){
		vo.setsId(sId);
		System.out.println("dd");
		return posService.getStoreMenuList(vo);
	}
	//옵션조회
	@ResponseBody
	@RequestMapping(value="/pos", method=RequestMethod.GET)
	public List<RecipeVO> getOptionList(RecipeVO vo){
		System.out.println("rr");
		return posService.getOptionList(vo);
	}
	// 고객조회
	@ResponseBody
	@RequestMapping(value = "/searchcuslist", method = RequestMethod.GET)
	public List<ViewPosCusSearchVO> getCusList(ViewPosCusSearchVO vo) {
		System.out.println("고객조회");
		return posService.getCusList(vo);
	}
	//pos기 이전 주문조회
	@ResponseBody
	@RequestMapping (value = "/searchorder", method = RequestMethod.GET)
	public List<OrdersVO> getCusRefund(OrdersVO vo){
		System.out.println("이전주문 조회");
		return posService.getCusRefund(vo);
	}
	//pos기 이전 주문 디테일
	@ResponseBody
	@RequestMapping (value = "/searchdetails", method = RequestMethod.GET)
	public List<ViewPosOrdetailsVO> getOrDetails(ViewPosOrdetailsVO vo){
		System.out.println("이전주문 상세 조회");
		return posService.getOrDetails(vo);
	}
	//pos기 환불
	@ResponseBody
	@RequestMapping (value = "/refoundsuccess", method = RequestMethod.POST)
	public String refoundcall(OrdersVO vo) {
		System.out.println("환불");
		return "redirect:/pos.do";
	}
	
	//pos기 주문
	@RequestMapping(value = "/posorder", method = RequestMethod.POST)
	public String posOrder(@RequestParam String jsonData) throws ParseException {
		ModelAndView mv = new ModelAndView();

		OrdersVO ordervo = new OrdersVO();
		System.out.println("====================== pos controller:  "+jsonData);
		
		  ObjectMapper mapper = new ObjectMapper();
		  mapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
		  
		  List<OrdersVO> orderdetaillist = new ArrayList<OrdersVO>(); 
		  JSONParser jsonParser = new JSONParser();
		  
		  JSONObject insertParam = (JSONObject) jsonParser.parse(jsonData);
		  
		  System.out.println("===================================insertPa: "+insertParam);
		 
		  OrdersVO menuvo;
		  JSONArray menulist;
		  JSONArray menu;
		  menulist = (JSONArray) insertParam.get("optionlist");
		  
		  ordervo.setReceipt((String) insertParam.get("receipt"));
		  String mileage = (String) insertParam.get("mileage");
		  ordervo.setMileage(Integer.parseInt(mileage));
		  ordervo.setsId((String) insertParam.get("sId"));
		  ordervo.setTotal(Integer.parseInt((String) insertParam.get("total")));
		  ordervo.setcAdd("");
		  ordervo.setcAdd3("");
  
		  ordervo.setPayMethod((String) insertParam.get("payMethod"));
		  
		  ordervo.setDeliveryStatus("C5");
		  
		  
		  
		  if(insertParam.get("cId").equals("")) {
			  ordervo.setcId("");
		  }else {
			  ordervo.setcId((String) insertParam.get("cId"));
		  }
		  
		  System.out.println("===== ordersVO "+ ordervo);
		  // orders테이블에 넣기
		  cusService.insertorder(ordervo);
		  
		  // 마일리지 업데이트는 
		  // 해당 매장의 마일리지 서비스를 하는 경우!!!!
		  // 넣어줘야됨.
		  if(ordervo.getMileage() > 0) {
			  ordervo.setoNum(ordervo.getoNum());
				int n = cusService.setcanclemileage(ordervo);
				
			}
		  
		  
		  
		  
		 // System.out.println("====================== menulist "+ menulist);
		  
		  List<RecipeVO> recipelist = null;
		  
		  List<String> opdnum_menulist = new ArrayList<String>(); 
		  
		  // optionlist 
		  for(int n=0; n<menulist.size(); n++) {
			  System.out.println("==================menulist get "+ menulist.get(n));
			 // optionlist에 있는 각각의 배열하나씩. 
			  menu = (JSONArray) menulist.get(n);
			  
			  // orderdetails 테이블에 넣을 보.
			  // 메뉴당 들어가는 메뉴번호, 수량, 옵션과 HOT ICE
			  // 필요한 내용이 각 한 행마다 메뉴번호 공통, 수량은 HOT ICE는 0, 레시피번호, 카테고리 번호
			  
			  OrdersVO insertvo;
			  String v_mNum = null;
			  String v_qty = null;
			  JSONArray optionhotice = null;
			  System.out.println("============== menu size : "+menu.size());
			  System.out.println("============== menulist : "+menu.get(n));
			  for(int j=0; j<menu.size();j++) {
				  
				  // 들어온 메뉴 갯수대로 가져온다. menudetail 배열
				  JSONArray menudetail = (JSONArray) menu.get(j);
				 
				  
				  // 하나의 menu 배열에서 처음은 메뉴명을 가져온다.
				  if(j == 0) {
					  	v_mNum = (String) menudetail.get(0);
					  	opdnum_menulist.add(v_mNum);
					  	RecipeVO recipevo = new RecipeVO();
						recipevo.setmNum((String) menudetail.get(j));
						
						// 해당 메뉴의 기본 레시피들 다 가져옴.
						recipelist = cusService.getorderrecipenolist(recipevo);				  
				  }else if(j == 1){// 두번째는 수량을 가져온다.
					  System.out.println("============= j : "+menudetail.get(0).toString());
					  v_qty = menudetail.get(0).toString();
					  
				  }else if( j > 1){
					  // 나머지는 옵션과 hot ice이므로
					
					  optionhotice = (JSONArray) menu.get(2);
					  System.out.println("================== optionhotice : "+optionhotice);
					  if(optionhotice.size() != 0) {
						  
						  // hot/ice , 공통
						  for(int i=0;i<recipelist.size();i++) {
							  System.out.println("==== recipeno : "+recipelist.get(i).getRecipeno());
							  insertvo = new OrdersVO();
							  insertvo.setoNum(ordervo.getoNum());
							  insertvo.setmNum(v_mNum);
							  
							  for(int hotice=0; hotice<optionhotice.size();hotice++) {
								  // 기본 레시피와 hot/ice 가져옴. recipelist
								  String recipeno = (String) optionhotice.get(hotice);
								  
								  if(!(recipelist.get(i).getCaNum().equals("CAHT")) && !(recipelist.get(i).getCaNum().equals("CAIC"))){
									  // 나마지 공통
									  insertvo.setoQty(v_qty);
									  insertvo.setReceipno(recipelist.get(i).getRecipeno());
									  insertvo.setCaNum(recipelist.get(i).getCaNum());
									  
									  orderdetaillist.add(insertvo);
									  
									  System.out.println("========= common "+ insertvo);
									  break;
								  }
								  
								  // hot ice
								  if ((recipelist.get(i).getRecipeno().equals(recipeno) ) && ((recipelist.get(i).getCaNum().equals("CAHT")) || (recipelist.get(i).getCaNum().equals("CAIC")))) {
									  insertvo.setoQty("0");
									  insertvo.setReceipno(recipeno);
									  insertvo.setCaNum(recipelist.get(i).getCaNum());
									  
									  orderdetaillist.add(insertvo);
									  optionhotice.remove(hotice);
									  hotice--;
									  System.out.println("========= option hot ice "+ insertvo);
									  break;
								  }
								  
								/*
								 * // 이미 위의 if문때매 if((recipelist.get(i).getCaNum().equals("CAHT")) ||
								 * (recipelist.get(i).getCaNum().equals("CAIC"))) break;
								 */
								  
								  
								/*
								 * System.out.println("============== option "+ recipeno);
								 * insertvo.setoQty(v_qty); insertvo.setReceipno(recipeno);
								 * insertvo.setCaNum("CAOP"); orderdetaillist.add(insertvo);
								 * System.out.println("========= option "+ insertvo);
								 */
  
							  }		
							  
							  
							  
						  }
						  
						  for(int i=0; i<optionhotice.size();i++) {
							  System.out.println("======= option"+optionhotice.get(i));
							  insertvo = new OrdersVO(); 
							  insertvo.setoNum(ordervo.getoNum());
							  insertvo.setmNum(v_mNum);
							  
							  insertvo.setoQty(v_qty);
							  insertvo.setReceipno((String) optionhotice.get(i));
							  insertvo.setCaNum("CAOP");
							  
							  orderdetaillist.add(insertvo);
							  
						  }
					  }else if(optionhotice.size() == 0 ) {
						  // 옵션이 없을 경우
						  for(int i=0;i<recipelist.size();i++) {
							 System.out.println("========== 아무런 옵션 없이 공통으로 들어가는 것 "+recipelist.get(i).getCaNum());
							
							  insertvo = new OrdersVO(); 
							  insertvo.setoNum(ordervo.getoNum());
							  insertvo.setmNum(v_mNum);
							  
							  insertvo.setoQty(v_qty);
							  insertvo.setReceipno(recipelist.get(i).getRecipeno());
							  insertvo.setCaNum(recipelist.get(i).getCaNum());
							  
							  orderdetaillist.add(insertvo);
							  
							  System.out.println("========= 옵션이 없는 메뉴 "+ insertvo);
							 
						  }
					  }
					  
				 
					 
					  
				  }
				  
			  }
			  
			  Map<String, Object> map = new HashMap<String, Object>(); 
			  map.put("list",orderdetaillist);
			  
			// order details 테이블에 넣기 
			  int result = cusService.insertorderdetails(map);
			  
			  orderdetaillist.clear();
			  map.clear();
			  
			  
			// 해당 주문번호의 op_dnum수정 
			  ordervo.setmNum(v_mNum); 
			  result = cusService.getmutilodnum(ordervo); 
			  
			int mileageresult;
			// 해당 매장의 마일리지 서비스를 할 경우에만.
			ordervo.setMileageservice((String) insertParam.get("stMileageService"));
			if(ordervo.getMileageservice().equals("Y")) {
				
				// 마일리지 업데이트
				mileageresult = cusService.updatemileage(ordervo);
				
				// 해당 매장에 대한 마일리지가 없을 경우
				if(mileageresult == 0) {
					mileageresult = cusService.insertmileage(ordervo);
				}
			}
			  
			  
			/*
			 * for(int i=0; i<opdnum_menulist.size();i++) {
			 * ordervo.setmNum(opdnum_menulist.get(i)); result =
			 * cusService.getmutilodnum(ordervo); }
			 */
		  }  
		     
		
		  return "redirect:/pos.do";
	}
	
}
