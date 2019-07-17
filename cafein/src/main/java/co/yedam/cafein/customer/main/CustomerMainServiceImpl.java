package co.yedam.cafein.customer.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.CustomerMainVO;
@Service
public class CustomerMainServiceImpl implements CustomerMainService {

	@Autowired
	CustomerMainDAO dao;
	
	@Override
	public List<CustomerMainVO> getLikeStoreList(CustomerMainVO vo) {
		return dao.getLikeStoreList(vo);
	}

	@Override
	public List<CustomerMainVO> mainLikeStoreList(CustomerMainVO vo) {
		
		return dao.mainLikeStoreList(vo);
	}

	@Override
	public List<CustomerMainVO> getLikeMenuList(CustomerMainVO vo) {
		return dao.getLikeMenuList(vo);
	}

	@Override
	public List<CustomerMainVO> mainLikeMenuList(CustomerMainVO vo) {
		return dao.mainLikeMenuList(vo);
	}

}
