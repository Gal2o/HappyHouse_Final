package com.ssafy.happyhouse.model.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.BusinessInfo;

@Repository
public class BusinessRepoImpl implements BusinessRepo {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BusinessInfo> searchAll(int currentPage, int sizePerPage, String word) {
		RowBounds bounds = new RowBounds((currentPage - 1) * sizePerPage, sizePerPage);

		return sqlSession.selectList("house.bsearchAll", word, bounds);
	}

	@Override
	public List<BusinessInfo> search(String word) {
		return sqlSession.selectOne("house.bsearch", word);
	}

	@Override
	public int getTotalCount(String word) throws Exception {
		return sqlSession.selectOne("house.bcount", word);
	}

}
