package co.yedam.cafein.customer.reserve;

import java.util.List;

import co.yedam.cafein.vo.ReserveVO;

public interface ReserveService {
		
		//총적립금과 사용한 적립금 
		List<ReserveVO> getTotalReserve(ReserveVO vo);
		
		//요일별 주문한 적립금 리스트
		List<ReserveVO> getListReserve(ReserveVO vo);

		//메인에서  보여줄 총적립금
		List<ReserveVO> mainTotalReserve(ReserveVO vo);
		
}
