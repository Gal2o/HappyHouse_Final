package com.ssafy.happyhouse.model.dto;

import java.io.Serializable;

public class InterestAreaInfo implements Serializable, Comparable<InterestAreaInfo> {
	
	
	private String gu;
	private String gucode;
	private String id;
	
	
	public InterestAreaInfo() {	}
	
	public InterestAreaInfo(String gu, String gucode, String id) {
		this.gu = gu;
		this.gucode = gucode;
		this.id = id;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getGucode() {
		return gucode;
	}

	public void setGucode(String gucode) {
		this.gucode = gucode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "InterestAreaInfo [gu=" + gu + ", gucode=" + gucode + ", id=" + id + "]";
	}

	public int compareTo(InterestAreaInfo o) {
		if(o!=null && o.gu != null && gu!=null) {
			return gu.compareTo(o.gu);
		}
		return 0;
	}
	
}

