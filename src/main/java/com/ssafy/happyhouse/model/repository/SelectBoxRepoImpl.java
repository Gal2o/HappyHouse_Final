package com.ssafy.happyhouse.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCode;

@Repository
public class SelectBoxRepoImpl implements SelectBoxRepo {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SidoCode> selectSido() {
		return sqlSession.selectList("selectBox.selectSido");
	}

	@Override
	public List<SidoCode> selectGugun(String sido) {
		return sqlSession.selectList("selectBox.selectGugun", sido);
	}

	@Override
	public List<HouseInfo> selectDong(String gugun) {
		return sqlSession.selectList("selectBox.selectDong", gugun);
	}

	@Override
	public List<HouseInfo> selectApt(String dong) {
		return sqlSession.selectList("selectBox.selectApt", dong);
	}
}