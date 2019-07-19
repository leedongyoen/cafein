package co.yedam.cafein.vo;

import java.util.Arrays;

public class SidVO {
	String[] sid;

	public String[] getSid() {
		return sid;
	}

	public void setSid(String[] sid) {
		this.sid = sid;
	}

	@Override
	public String toString() {
		return "SidVO [sid=" + Arrays.toString(sid) + "]";
	}
	
	

}
