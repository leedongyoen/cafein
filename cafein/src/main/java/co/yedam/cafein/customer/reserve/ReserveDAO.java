package co.yedam.cafein.customer.reserve;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.ReserveVO;

@Repository
public class ReserveDAO {

		@Autowired
		private SqlSessionTemplate mybatis;
		
		//총 적립금 
		public ReserveVO getTotalReserve(ReserveVO vo) {
			return mybatis.selectOne("ReserveDAO.getTotalReserve", vo);
		}
		//사용된 적립금
		public ReserveVO getUseReserve(ReserveVO vo) {
			return mybatis.selectOne("ReserveDAO.getUseReserve", vo);
		}
		//사용 매장별 마일리지 리스트 
		public List<ReserveVO> getListReserve(ReserveVO vo) {
			return mybatis.selectList("ReserveDAO.getListReserve", vo);
		}



}
