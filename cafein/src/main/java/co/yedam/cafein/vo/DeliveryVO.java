package co.yedam.cafein.vo;

public class DeliveryVO {
	private String deliNum;
	private String context;
	private String deliStat;
	private String deliLoc;
	private String oNum;
	
	public String getDeliNum() {
		return deliNum;
	}
	public void setDeliNum(String deliNum) {
		this.deliNum = deliNum;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getDeliStat() {
		return deliStat;
	}
	public void setDeliStat(String deliStat) {
		this.deliStat = deliStat;
	}
	public String getDeliLoc() {
		return deliLoc;
	}
	public void setDeliLoc(String deliLoc) {
		this.deliLoc = deliLoc;
	}
	public String getoNum() {
		return oNum;
	}
	public void setoNum(String oNum) {
		this.oNum = oNum;
	}
	@Override
	public String toString() {
		return "DeliveryVO [deliNum=" + deliNum + ", context=" + context + ", deliStat=" + deliStat + ", deliLoc="
				+ deliLoc + ", oNum=" + oNum + "]";
	}
	
	

}
