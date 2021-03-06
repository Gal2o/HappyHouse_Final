package com.ssafy.happyhouse.model.repository;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;

@Repository
public class HouseRepoImpl implements HouseRepo {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HouseDeal> searchAll(int currentPage, int sizePerPage, String key, String word, LinkedList<String> type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("word", word);
		map.put("type", type);
		
		/*
		 * String sql =
		 * sqlSession.getConfiguration().getMappedStatement("house.searchAll").
		 * getBoundSql(map).getSql(); List<ParameterMapping> parameterMappings =
		 * sqlSession.getConfiguration().getMappedStatement("house.searchAll").
		 * getBoundSql(map).getParameterMappings(); for (ParameterMapping
		 * parameterMapping : parameterMappings) { String param = (String)
		 * map.get(parameterMapping.getProperty()); sql = sql.replaceFirst("\\?", "'" +
		 * param + "'"); } System.out.println("sql : " + sql);
		 */
		
		RowBounds bounds = new RowBounds((currentPage-1)*sizePerPage, sizePerPage);
		return sqlSession.selectList("house.searchAll", map, bounds);
	}

	@Override
	public HouseDeal search(int no) {
		return sqlSession.selectOne("house.search", no);
	}

	@Override
	public int getTotalCount(String key, String word, LinkedList<String> type) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("word", word);
		map.put("type", type);
		
		return sqlSession.selectOne("house.count", map);
	}
}
