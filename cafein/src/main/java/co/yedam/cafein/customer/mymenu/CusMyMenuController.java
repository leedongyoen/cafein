package co.yedam.cafein.customer.mymenu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.viewvo.ViewMymenuVO;
import co.yedam.cafein.vo.MyMenuVO;

@Controller
public class CusMyMenuController {
	@Autowired
	CusMyService cusmyService;
	
	//고객 나만의 메뉴 조회
			@ResponseBody
			@RequestMapping(value="/customer/{cId}",  method=RequestMethod.GET)
			public List<ViewMymenuVO> getMymenu(@PathVariable("cId") String cId, ViewMymenuVO vo) {
				vo.setcId(cId);
				return cusmyService.getMymenu(vo);
			}
}
