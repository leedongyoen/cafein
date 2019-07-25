package co.yedam.cafein.store.open;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.vo.StoreOpenVO;


@Controller
public class StoreOpenController {

	@Autowired
	StoreOpenService storeOpenService;
	
	//오픈 페이지 이동
	@RequestMapping(value="/storeopen.do")
	public String getStoreOpenListForm() {
		return "store/storeopen"; 
	}
	
//	//오픈할 때 INSERT 컨트롤
//	@ResponseBody
//	@RequestMapping(value="/insertstoreopen.do",  method = RequestMethod.POST, consumes = "application/json")
//	public  Map<Object, Object> insertOpen(Model model,@RequestBody StoreOpenVO vo,HttpServletResponse response) throws IOException {
//		int n = storeOpenService.checkOpen(vo);
//		PrintWriter out = response.getWriter();
//		Map<Object, Object> result = new HashMap<Object, Object>();
//		result.put("cnt", Boolean.TRUE);
//		if(n != 0) {
////			System.out.println("이미오픈됨");
//			out.println("<script>alert('이미 오픈 하였습니다. 다음날 시도해주세요.');</script>");
//		}else {
//			storeOpenService.insertOpen(vo);
//			out.println("<script>alert('오픈 하였습니다.');</script>");
//		}
//		return result;
//	}
	//--------------------------------------------------------------------------------------------------
	//오픈할 때 INSERT 컨트롤
	@ResponseBody
	@RequestMapping(value="/insertstoreopen.do",  method = RequestMethod.POST, consumes = "application/json")
	public  int insertOpen(Model model,@RequestBody StoreOpenVO vo){
		int n = storeOpenService.checkOpen(vo);
		Map<Object, Object> result = new HashMap<Object, Object>();
		result.put("cnt", Boolean.TRUE);
		if(n == 0) {
			storeOpenService.insertOpen(vo);
		}
		return n;
	}
	//--------------------------------------------------------------------------------------------------
	//오픈 목록 리스트
	@ResponseBody
	@RequestMapping(value = "/getOpenList.do")
	public List<StoreOpenVO> getOpenList(Model model, StoreOpenVO vo) {
		
		return storeOpenService.getOpenList(vo);

	}
	//오픈 목록 단건검색
		@ResponseBody
		@RequestMapping(value = "/getOpen.do")
		public StoreOpenVO getOpen(Model model,@RequestBody StoreOpenVO vo) {
			
			return storeOpenService.getOpen(vo);

		}
}
