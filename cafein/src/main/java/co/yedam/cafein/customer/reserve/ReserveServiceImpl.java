package co.yedam.cafein.customer.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.cafein.vo.ReserveVO;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	ReserveDAO dao;

	@Override
	public List<ReserveVO> getTotalReserve(ReserveVO vo) {
		return dao.getTotalReserve(vo);
	}

//	@Override
//	public ReserveVO getUseReserve(ReserveVO vo) {		
//		return dao.getUseReserve(vo);
//	}

	@Override
	public List<ReserveVO> getListReserve(ReserveVO vo) {
		return dao.getListReserve(vo);
	}
}
