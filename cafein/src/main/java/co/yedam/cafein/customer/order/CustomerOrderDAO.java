package co.yedam.cafein.customer.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.OrdersVO;

@Repository
public class CustomerOrderDAO {
	@Autowired
	private SqlSessionTemplate dao;
	
	public List<OrdersVO> getOrderlist(OrdersVO vo){
		return dao.selectList("CustomerOrderDAO.getOrderlist",vo);
	}
}
