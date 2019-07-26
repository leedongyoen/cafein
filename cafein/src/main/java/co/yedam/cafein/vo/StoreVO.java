package co.yedam.cafein.vo;

public class StoreVO {

	private String sid;
	private String spw;
	private String sname;
	private String sadd;
	private String stel;
	private String stdeliservice;
	private String stopentime;
	private String stclosetime;
	private String stappstat;
	private String stmileservice;
	private String opencheck;
	private String rank;
	private String sadd2;
	private String sadd3;
	
	
	
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getOpencheck() {
		return opencheck;
	}
	public void setOpencheck(String opencheck) {
		this.opencheck = opencheck;
	}
	public String getSadd3() {
		return sadd3;
	}
	public void setSadd3(String sadd3) {
		this.sadd3 = sadd3;
	}
	public String getSadd2() {
		return sadd2;
	}
	public void setSadd2(String sadd2) {
		this.sadd2 = sadd2;
	}
	public String getStopentime() {
		return stopentime;
	}
	public void setStopentime(String stopentime) {
		this.stopentime = stopentime;
	}
	public String getStclosetime() {
		return stclosetime;
	}
	public void setStclosetime(String stclosetime) {
		this.stclosetime = stclosetime;
	}
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

	public String getStdeliservice() {
		return stdeliservice;
	}
	public void setStdeliservice(String stdeliservice) {
		this.stdeliservice = stdeliservice;
	}
	
	public String getStappstat() {
		return stappstat;
	}
	public void setStappstat(String stappstat) {
		this.stappstat = stappstat;
	}
	public String getStmileservice() {
		return stmileservice;
	}
	public void setStmileservice(String stmileservice) {
		this.stmileservice = stmileservice;
	}
	@Override
	public String toString() {
		return "StoreVO [sid=" + sid + ", spw=" + spw + ", sname=" + sname + ", sadd=" + sadd + ", stel=" + stel
				+ ", stdeliservice=" + stdeliservice + ", stopentime=" + stopentime + ", stclosetime=" + stclosetime
				+ ", stappstat=" + stappstat + ", stmileservice=" + stmileservice + ", opencheck=" + opencheck
				+ ", rank=" + rank + ", sadd2=" + sadd2 + ", sadd3=" + sadd3 + "]";
	}


	
}
