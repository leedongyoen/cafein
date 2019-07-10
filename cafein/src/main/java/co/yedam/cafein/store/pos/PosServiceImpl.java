package co.yedam.cafein.store.pos;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.MenuVO;

@Service("PosService")
public class PosServiceImpl implements PosService{

	
	@Resource(name="posDAO")
	private PosDAO DAO;
	
	public List<MenuVO> getStoreMenuList(MenuVO vo){
		System.out.println(vo.getsId());
		return DAO.getStoreMenuList(vo);
	}
}
