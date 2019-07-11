package co.yedam.cafein.store.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.StoreVO;

@Service
public class StoreLoginServiceImpl implements StoreLoginService{

	@Autowired
	StoreLoginDAO dao;
	
	
	@Override
	public StoreVO getStore(StoreVO vo) {
		return dao.getStore(vo);
	}

	@Override
	public List<StoreVO> getStoreList(StoreVO vo) {
		return dao.getStoreList(vo);
	}
	
	
	

}
