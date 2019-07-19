package co.yedam.cafein.vo;

import java.util.List;

public class StoreCloseDataInsertVO {

	List<StoreOpenVO> store;
	List<StockVO> stock;
	List<WarehousingVO> warehousingLoss;
	List<WarehousingVO> warehousingAddStock;
	
	
	public List<StoreOpenVO> getStore() {
		return store;
	}
	public void setStore(List<StoreOpenVO> store) {
		this.store = store;
	}
	public List<StockVO> getStock() {
		return stock;
	}
	public void setStock(List<StockVO> stock) {
		this.stock = stock;
	}
	public List<WarehousingVO> getWarehousingLoss() {
		return warehousingLoss;
	}
	public void setWarehousingLoss(List<WarehousingVO> warehousingLoss) {
		this.warehousingLoss = warehousingLoss;
	}
	public List<WarehousingVO> getWarehousingAddStock() {
		return warehousingAddStock;
	}
	public void setWarehousingAddStock(List<WarehousingVO> warehousingAddStock) {
		this.warehousingAddStock = warehousingAddStock;
	}
	@Override
	public String toString() {
		return "StoreCloseDataInsertVO [store=" + store + ", stock=" + stock + ", warehousingLoss=" + warehousingLoss
				+ ", warehousingAddStock=" + warehousingAddStock + "]";
	}

	
}
