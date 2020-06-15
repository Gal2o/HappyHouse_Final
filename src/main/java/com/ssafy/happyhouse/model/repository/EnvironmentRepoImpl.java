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
	public List<EnvironmentInfo> searchAll(int currentPage, int sizePerPage, String word) {
		RowBounds bounds = new RowBounds((currentPage - 1) * sizePerPage, sizePerPage);

		return sqlSession.selectList("house.esearchAll", word, bounds);
	}

	@Override
	public List<EnvironmentInfo> search(String word) {
		return sqlSession.selectOne("house.esearch", word);
	}

	@Override
	public int getTotalCount(String word) throws Exception {
		if (word == null) word = "null";
		return sqlSession.selectOne("house.ecount", word);
	}
}
