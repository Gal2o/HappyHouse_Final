package com.ssafy.happyhouse.model.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.EnvironmentInfo;

@Repository
public class EnvironmentRepoImpl implements EnvironmentRepo {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<EnvironmentInfo> searchAll(String word) {
		return sqlSession.selectList("house.esearchAll",word);
	}

	@Override
	public List<EnvironmentInfo> search(String word) {
		return sqlSession.selectOne("house.esearch", word);
	}

}
