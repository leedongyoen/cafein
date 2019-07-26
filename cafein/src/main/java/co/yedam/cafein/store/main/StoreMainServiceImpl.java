package co.yedam.cafein.store.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.OrdersVO;

@Service
public class StoreMainServiceImpl implements StoreMainService {
	
	@Autowired
	StoreMainDAO dao;

	@Override
	public List<OrdersVO> getSalesRank(OrdersVO vo) {
		return dao.getSalesRank(vo);
	}

}
