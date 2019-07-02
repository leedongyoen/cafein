package co.yedam.cafein.customer.storemenu;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.StoreVO;

@Service
public class StoreListMenuServiceImpl {
	
	@Resource
	StoreListMenuDAO dao;

	public List<StoreVO> getStoreList(StoreVO vo){
		return dao.getStoreList(vo);
	}
	
}
