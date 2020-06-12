package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCode;

public interface SelectBoxService {
	public List<SidoCode> selectSido();
	public List<SidoCode> selectGugun(String sido);
	public List<HouseInfo> selectDong(String gugun);
	public List<HouseInfo> selectApt(String dong);
}