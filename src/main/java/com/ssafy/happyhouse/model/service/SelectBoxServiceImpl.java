package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCode;
import com.ssafy.happyhouse.model.repository.SelectBoxRepo;

@Service
public class SelectBoxServiceImpl implements SelectBoxService {
	
	@Autowired
	private SelectBoxRepo selectBoxRepo;

	@Override
	public List<SidoCode> selectSido() {
		return selectBoxRepo.selectSido();
	}

	@Override
	public List<SidoCode> selectGugun(String sido) {
		return selectBoxRepo.selectGugun(sido);
	}

	@Override
	public List<HouseInfo> selectDong(String gugun) {
		return selectBoxRepo.selectDong(gugun);
	}

	@Override
	public List<HouseInfo> selectApt(String dong) {
		return selectBoxRepo.selectApt(dong);
	}
}