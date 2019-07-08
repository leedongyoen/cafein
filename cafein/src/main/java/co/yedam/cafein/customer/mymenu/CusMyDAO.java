package co.yedam.cafein.customer.mymenu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.viewvo.ViewMymenuVO;
import co.yedam.cafein.vo.MyMenuVO;

@Repository
public class CusMyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	


	public List<ViewMymenuVO> getMymenu(ViewMymenuVO vo) {
		System.out.println("===> Mybatis getMymenu()");
		return mybatis.selectList("MymenuDAO.getMymenu", vo);
	}
	
	public void deleteMymenu(MyMenuVO vo) {
		  System.out.println("===> Mybatis deleteMymenu()");
		  mybatis.update("MymenuDAO.deleteMymenu", vo); }
	  
	
	
	/*
	 * public void inserMymenu(MyMenuVO vo) {
	 * System.out.println("===> Mybatis inserMymenu()");
	 * mybatis.insert("MymenuDAO.insertBoard", vo); }
	 * 
	 * public void updateMymenu(MyMenuVO vo) {
	 * System.out.println("===> Mybatis updateMymenu()");
	 * mybatis.update("MymenuDAO.updateMymenu", vo); }
	 */


	
	
}
