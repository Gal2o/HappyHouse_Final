package com.ssafy.happyhouse.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.UserDto;

@Repository
public class UserRepoImpl implements UserRepo{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<UserDto> selectAll() throws Exception{
		return sqlSession.selectList("user.selectAll");
	}
	@Override
	public UserDto select(String id) throws Exception{
		return sqlSession.selectOne("user.select",id);
	}

	@Override
	public void insert(UserDto user) throws Exception{
		sqlSession.insert("user.insert",user);		
	}

	@Override
	public void update(UserDto user) throws Exception {
		sqlSession.update("user.update",user);		
	}

	@Override
	public void delete(String id) throws Exception{
		sqlSession.delete("user.delete",id);		
	}


	

}
