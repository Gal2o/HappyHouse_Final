package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.repository.UserRepo;


public class UserServiceImpl implements UserService{
	@Autowired
	UserRepo repo;

	@Override
	public List<UserDto> selectAll() throws Exception{
		return repo.selectAll();
	}

	@Override
	public UserDto select(String id) throws Exception {
		return repo.select(id);
	}

	@Override
	public void insert(UserDto user) throws Exception {
		repo.insert(user);
		return;
	}

	@Override
	public void update(UserDto user) throws Exception {
		repo.update(user);
		return;
	}

	@Override
	public void delete(String no) throws Exception {
		repo.delete(no);
		return;
	}

}
