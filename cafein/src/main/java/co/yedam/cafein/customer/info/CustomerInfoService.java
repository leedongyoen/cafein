package co.yedam.cafein.customer.info;

import co.yedam.cafein.vo.CustomerVO;

public interface CustomerInfoService {
	
//	회원 단건 조회
	public CustomerVO getCustomer(CustomerVO vo);
	
//	회원 정보 수정
	public int infoedit(CustomerVO vo);

//	비밀번호 변경
	public int checkpw(CustomerVO vo);
	
//	회원 삭제(탈퇴)
	public int deleteCustomer(CustomerVO vo);

	

}
