package co.yedam.cafein.admin;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import co.yedam.cafein.vo.StoreVO;

@Controller
public class AdminStoreController {
	
	@Autowired
	AdminStoreService adminstoreservice;

	
	// 관리자 매장 목록 조회
	@RequestMapping("storelist.do")
	public String storelist() {
		return "admin/storelist";
	}
	
	//관리자 매장 목록조회('Y'인 매장들만)
	@ResponseBody
	@RequestMapping(value="/storelist", method=RequestMethod.GET)
	public List<StoreVO> StoreList(StoreVO vo){
//		System.out.println(vo.getSid());
		return adminstoreservice.StoreList(vo);
	}
	
	// 관리자 매장 승인/ 목록조회('N'인 매장들만)
	@RequestMapping("storemng.do")
	public String storemng() {
		return "admin/storemng";
	}
	
	// 관리자 매장 승인/ 목록조회('N'인 매장들만)
		@ResponseBody
		@RequestMapping(value="/storepermissionlist", method=RequestMethod.GET)
		public List<StoreVO> StorePermissionList(StoreVO vo){
//			System.out.println(vo.getSid());
			return adminstoreservice.StorePermissionList(vo);
		}
	// 관리자 매장 승인 체크 storepermissionlist
	
		@ResponseBody
		@RequestMapping(value="/storepermissionlist", method=RequestMethod.PUT, consumes="application/json")
		public int updatePermission(@RequestBody List<String> sid) throws JsonParseException, JsonMappingException, IOException {

			
		/*
		 * ObjectMapper mapper = new ObjectMapper(); List<StoreVO> meorvo =
		 * mapper.readValue(jsonData, new TypeReference<List<StoreVO>>() { });
		 */
			System.out.println("sid : "+sid);
			return adminstoreservice.updatePermission(sid);
			
		}
		
	
}
