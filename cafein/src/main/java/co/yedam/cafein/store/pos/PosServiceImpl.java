package co.yedam.cafein.store.pos;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.yedam.cafein.viewvo.ViewPosVO;

@Service("PosService")
public class PosServiceImpl implements PosService{

	
	@Resource(name="posDAO")
	private PosDAO DAO;
	
	public List<ViewPosVO> getStoreMenuList(ViewPosVO vo){
		System.out.println(vo.getsId());
		return DAO.getStoreMenuList(vo);
	}
}
