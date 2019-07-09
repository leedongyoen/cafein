package co.yedam.cafein.vo;

<<<<<<< HEAD
import java.sql.Timestamp;

public class WarehousingVO {
	private String wareNum;
	private Timestamp wareDate;
	private int wareQty;
	private String warePrice;
	private String stNum;
	private String sId;
	private String stPayMethod;
	public String getWareNum() {
		return wareNum;
	}
	public void setWareNum(String wareNum) {
		this.wareNum = wareNum;
	}
	public Timestamp getWareDate() {
		return wareDate;
	}
	public void setWareDate(Timestamp wareDate) {
		this.wareDate = wareDate;
	}
	public int getWareQty() {
		return wareQty;
	}
	public void setWareQty(int wareQty) {
		this.wareQty = wareQty;
	}
	public String getWarePrice() {
		return warePrice;
	}
	public void setWarePrice(String warePrice) {
		this.warePrice = warePrice;
	}
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getStPayMethod() {
		return stPayMethod;
	}
	public void setStPayMethod(String stPayMethod) {
		this.stPayMethod = stPayMethod;
	}
	
=======
import java.util.Date;

public class WarehousingVO {

	private String wareNum;
	private Date wareDate;
	private int wareQty;
	private String warePrice;
	private String stNum;
	private String sId;
	private Date expDate;
	private String stPayMethod;
	
	public String getWareNum() {
		return wareNum;
	}
	public void setWareNum(String wareNum) {
		this.wareNum = wareNum;
	}
	public Date getWareDate() {
		return wareDate;
	}
	public void setWareDate(Date wareDate) {
		this.wareDate = wareDate;
	}
	public int getWareQty() {
		return wareQty;
	}
	public void setWareQty(int wareQty) {
		this.wareQty = wareQty;
	}
	public String getWarePrice() {
		return warePrice;
	}
	public void setWarePrice(String warePrice) {
		this.warePrice = warePrice;
	}
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public Date getExpDate() {
		return expDate;
	}
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}
	public String getStPayMethod() {
		return stPayMethod;
	}
	public void setStPayMethod(String stPayMethod) {
		this.stPayMethod = stPayMethod;
	}
	@Override
	public String toString() {
		return "WarehousingVO [wareNum=" + wareNum + ", wareDate=" + wareDate + ", wareQty=" + wareQty + ", warePrice="
				+ warePrice + ", stNum=" + stNum + ", sId=" + sId + ", expDate=" + expDate + ", stPayMethod="
				+ stPayMethod + "]";
	}
>>>>>>> branch 'master' of https://github.com/leedongyoen/cafein
	
}
