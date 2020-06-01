package com.ssafy.happyhouse.model.dto;

public class EnvironmentInfo {
	/**환경정보를 식별할 번호*/
	private int    no;
	/**환경정보 이름*/
	private String	name;
	/***/
	private String    address;
	/***/
	private String    dongcode;
	/***/
	private String    dong;
	/***/
	private String    lng;
	/***/
	private String    lat;
	/***/
	private String    bizcode;
	/***/
	private String    type;			// 1. 환경점검 데이터 2. 녹지정보 데이터
	
	public EnvironmentInfo() {}
	
	public EnvironmentInfo(int no, String name, String dong) {
		this.no = no;
		this.name= name;
		this.dong = dong;
	}
	public EnvironmentInfo(int no, String name, String address, String dongcode, String dong, String lng,
			String lat, String bizcode, String type) {
		super();
		this.no = no;
		this.name = name;
		this.address = address;
		this.dongcode = dongcode;
		this.dong = dong;
		this.lng = lng;
		this.lat = lat;
		this.bizcode = bizcode;
		this.type = type;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDongcode() {
		return dongcode;
	}

	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getBizcode() {
		return bizcode;
	}

	public void setBizcode(String bizcode) {
		this.bizcode = bizcode;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "EnvironmentAreaInfo [no=" + no + ", name=" + name + ", address=" + address + ", dongcode=" + dongcode
				+ ", dong=" + dong + ", lng=" + lng + ", lat=" + lat + ", bizcode=" + bizcode + ", type=" + type + "]";
	}

}
