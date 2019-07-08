package co.yedam.cafein.customer.mymenu;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.viewvo.ViewMymenuVO;
import co.yedam.cafein.vo.MyMenuVO;

@Controller
public class CusMyMenuController {
	@Autowired
	CusMyService cusmyService;
	
	//怨좉컼 �굹留뚯쓽 硫붾돱 議고쉶
			@ResponseBody
			@RequestMapping(value="/customer",  method=RequestMethod.GET)
			public List<ViewMymenuVO> getMymenu(ViewMymenuVO vo, HttpSession session) {
				String cId = (String)session.getAttribute("cId");
				vo.setcId(cId);
				return cusmyService.getMymenu(vo);
			}
			
			
			
			
			
			@ResponseBody
			@RequestMapping(value="/customer",  method=RequestMethod.DELETE, consumes="application/json")
			public Map<String, String> deleteMymenu(@RequestBody MyMenuVO vo) {
				cusmyService.deleteMymenu(vo);
				return Collections.singletonMap("result", "ok");
			}
}
