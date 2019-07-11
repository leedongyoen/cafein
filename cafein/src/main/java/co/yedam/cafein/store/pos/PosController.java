package co.yedam.cafein.store.pos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.cafein.viewvo.ViewPosVO;
import co.yedam.cafein.vo.MenuVO;

@Controller
public class PosController {
	@Autowired
	PosService posService;
	
	
	@ResponseBody
	@RequestMapping(value="/pos/{sId}", method=RequestMethod.GET)
	public List<ViewPosVO> getStoreMenuList(ViewPosVO vo, @PathVariable("sId") String sId){
		vo.setsId(sId);
		System.out.println("dd");
		return posService.getStoreMenuList(vo);
	}
}
