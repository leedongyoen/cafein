package co.yedam.cafein.customer.reserve;

import java.util.List;

import co.yedam.cafein.vo.ReserveVO;

public interface ReserveService {
		
		//총적립금
		ReserveVO getTotalReserve(ReserveVO vo);
		
		//사용된 적립금
		ReserveVO getUseReserve(ReserveVO vo);
		
		//요일별 주문한 적립금 리스트
		List<ReserveVO> getListReserve(ReserveVO vo);
		
}
