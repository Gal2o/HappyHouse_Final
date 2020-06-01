package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.UserDto;

public interface UserService {
	
	public List<UserDto> selectAll() throws Exception;
	public UserDto select(UserDto user) throws Exception;
	public void insert(UserDto user) throws Exception;
	public void update(UserDto user) throws Exception;
	public void delete(String no) throws Exception;
	
}
