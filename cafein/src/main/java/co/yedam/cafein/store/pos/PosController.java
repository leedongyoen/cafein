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

import co.yedam.cafein.viewvo.ViewPosCusSearchVO;
import co.yedam.cafein.viewvo.ViewPosVO;
import co.yedam.cafein.vo.OrderDetailsVO;
import co.yedam.cafein.vo.OrdersVO;
import co.yedam.cafein.vo.RecipeVO;

@Controller
public class PosController {
	@Autowired
	PosService posService;
	
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
		List<OrdersVO> orderlist = new ArrayList<OrdersVO>();
		System.out.println("====================== pos controller:  "+jsonData);
		
		  ObjectMapper mapper = new ObjectMapper();
		  mapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
		  
		  List<OrdersVO> cartorder = new ArrayList<OrdersVO>(); JSONParser jsonParser = new JSONParser();
		  
		  JSONObject insertParam = (JSONObject) jsonParser.parse(jsonData);
		  
		  System.out.println("===================================insertPa: "+insertParam);
		 
		  OrderDetailsVO menuvo;
		  JSONArray menulist;
		  JSONArray menu;
		  menulist = (JSONArray) insertParam.get("optionlist");
		  System.out.println("====================== menulist "+ menulist);
		  for(int n=0; n<menulist.size(); n++) {
			  System.out.println("==================menulist get "+ menulist.get(n));
			  
			  menu = (JSONArray) menulist.get(n);
			  menuvo = new OrderDetailsVO();
			  for(int j=0; j<menu.size();j++) {
				  System.out.println("=========================menu get "+ menu.get(j));
				  JSONArray menudetail = (JSONArray) menu.get(j);
				  if(menudetail.size() == 1) {
					  System.out.println("================menudetail.toString() : "+menudetail.get(0));					  
				  }else if(menudetail.size() == 0){
					  System.out.println("================size() == 0 : "+menudetail.toString());		
				  }
			  }
			  
		  }
		 
		  
		  
		mv.setViewName("store/pos");
		return mv;
	}
	
}
