package co.yedam.cafein.vo;

public class StoreVO {

	private String sid;
	private String spw;
	private String sname;
	private String sadd;
	private String stel;
	private String deliveryability;
	private String stdeliservice;
	private int stopentime;
	private int stclosetime;
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSpw() {
		return spw;
	}
	public void setSpw(String spw) {
		this.spw = spw;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSadd() {
		return sadd;
	}
	public void setSadd(String sadd) {
		this.sadd = sadd;
	}
	public String getStel() {
		return stel;
	}
	public void setStel(String stel) {
		this.stel = stel;
	}
	public String getDeliveryablity() {
		return deliveryability;
	}
	public void setDeliveryablity(String deliveryability) {
		this.deliveryability = deliveryability;
	}
	public String getStdeliservice() {
		return stdeliservice;
	}
	public void setStdeliservice(String stdeliservice) {
		this.stdeliservice = stdeliservice;
	}
	public int getStopentime() {
		return stopentime;
	}
	public void setStopentime(int stopentime) {
		this.stopentime = stopentime;
	}
	public int getStclosetime() {
		return stclosetime;
	}
	public void setStclosetime(int stclosetime) {
		this.stclosetime = stclosetime;
	}
	@Override
	public String toString() {
		return "StoreVO [sid=" + sid + ", spw=" + spw + ", sname=" + sname + ", sadd=" + sadd + ", stel=" + stel
				+ ", deliveryability=" + deliveryability + ", stdeliservice=" + stdeliservice + ", stopentime="
				+ stopentime + ", stclosetime=" + stclosetime + "]";
	}
	
	
}
