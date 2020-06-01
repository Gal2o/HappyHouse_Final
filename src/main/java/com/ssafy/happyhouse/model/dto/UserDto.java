package com.ssafy.happyhouse.model.dto;

public class UserDto {
	/**사용자 ID*/
	private String id;
	/**사용자 비밀번호*/
	private String password;
	/**사용자 이름*/
	private String name;
	/**사용자 주소*/
	private String address;
	/**사용자 전화번호  형식 : 000-0000-0000*/
	private String phone;
	
	public UserDto() {	}
	
	public UserDto(String id, String password, String name, String address, String phone) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", password=" + password + ", name=" + name + ", address="
				+ address + ", phone=" + phone + "]";
	}
	
	
	
}
