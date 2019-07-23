package co.yedam.cafein.store.pos;

import java.util.ArrayList;
import java.util.List;

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
	@ResponseBody
	@RequestMapping(value = "/posorder", method = RequestMethod.POST)
	public ModelAndView posOrder(@RequestParam String jsonData) throws ParseException {
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
		  ordervo.setcId("");
		  ordervo.setcAdd("");
		  ordervo.setcAdd3("");
		  // 결제방식가져와야됨.
		  // 배송상태 부분 메퍼수정해야됨
		  ordervo.setDeliveryStatus("C5");
		  System.out.println("===== 미완 ordersVO "+ ordervo);
		  
		  if(!insertParam.get("cId").equals("")) {
			  // 고객정보가 넘어올경우에는 마일리지 업데이트 인데
			  // 해당 매장의 마일리지 서비스를 하는 경우!!!!
			  // 넣어줘야됨.
		  }
		  
		 // System.out.println("====================== menulist "+ menulist);
		  
		  List<RecipeVO> recipelist = null;
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
			  for(int j=0; j<menu.size();j++) {
				  
				  // 들어온 메뉴 갯수대로 가져온다. menudetail 배열
				  JSONArray menudetail = (JSONArray) menu.get(j);
				 
				  
				  // 하나의 menu 배열에서 처음은 메뉴명을 가져온다.
				  if(j == 0) {
					  	v_mNum = (String) menudetail.get(0);
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
			  
		  }
		 
		 
		  
		mv.setViewName("store/pos");
		return mv;
	}
	
}
