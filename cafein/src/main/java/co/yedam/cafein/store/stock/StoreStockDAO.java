package co.yedam.cafein.store.stock;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.cafein.vo.StockVO;

@Repository
public class StoreStockDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//	전체조회
	public List<StockVO> getStockList(StockVO vo){
		return mybatis.selectList("StockDAO.getStockList",vo);
	}
	public StockVO getStock(StockVO vo) {
		return mybatis.selectOne("StockDAO.getStock",vo);
	}
	public int insertStock(StockVO vo) {
		return mybatis.insert("StockDAO.insertStock",vo);
		}
	public int updateStock(StockVO vo) {
		return mybatis.update("StockDAO.updateStock",vo);
	}
	public int deleteStock(StockVO vo) {
		return mybatis.delete("StockDAO.deleteStock",vo);
	}
	
	public int updateEnterQty(StockVO vo) {
		return mybatis.update("StockDAO.updateEnterQty",vo);
	}
	//재고삭제시 레시피 체크
		public int checkStock(StockVO vo) {
			return mybatis.selectOne("StockDAO.checkStock",vo);
		}
}
