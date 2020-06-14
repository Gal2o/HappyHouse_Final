package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.repository.UserRepo;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserRepo repo;

	@Override
	public List<UserDto> selectAll() throws Exception{
		return repo.selectAll();
	}

	@Override
	public UserDto select(UserDto user) throws Exception {
		return repo.select(user);
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

	@Override
	public UserDto searchPw(String id) throws Exception {
		UserDto tmp = repo.searchPw(id);		
		System.out.println("repo test: "+ tmp.getId());
		return repo.searchPw(id);
	}

}
