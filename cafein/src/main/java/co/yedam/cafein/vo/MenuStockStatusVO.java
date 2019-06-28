package co.yedam.cafein.vo;

public class MenuStockStatusVO {
	
	private String statNum;
	private String msStatus;
	private String msNum;
	public String getStatNum() {
		return statNum;
	}
	public void setStatNum(String statNum) {
		this.statNum = statNum;
	}
	public String getMsStatus() {
		return msStatus;
	}
	public void setMsStatus(String msStatus) {
		this.msStatus = msStatus;
	}
	public String getMsNum() {
		return msNum;
	}
	public void setMsNum(String msNum) {
		this.msNum = msNum;
	}
	@Override
	public String toString() {
		return "MenuStockStatusVO [statNum=" + statNum + ", msStatus=" + msStatus + ", msNum=" + msNum + "]";
	}

	
	
	
	
}
