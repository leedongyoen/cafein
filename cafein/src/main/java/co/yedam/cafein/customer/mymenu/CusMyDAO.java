package co.yedam.cafein.customer.mymenu;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.MyMenuVO;

@Repository
public class CusMyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public MyMenuVO getMymenu(MyMenuVO vo) {
		System.out.println("===> Mybatis getMymenu()");
		return mybatis.selectOne("MyMenuVO.getMymenu", vo);
	}
	
	
}
