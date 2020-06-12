package com.ssafy.happyhouse.model.repository;

import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCode;

public interface SelectBoxRepo {
	public List<SidoCode> selectSido();
	public List<SidoCode> selectGugun(String sido);
	public List<HouseInfo> selectDong(String gugun);
	public List<HouseInfo> selectApt(String dong);
}