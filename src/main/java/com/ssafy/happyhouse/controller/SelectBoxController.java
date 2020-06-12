package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCode;
import com.ssafy.happyhouse.model.service.SelectBoxService;


@RestController
@RequestMapping("/selectbox.do")
public class SelectBoxController {
	
	@Autowired
	SelectBoxService service;
	
	@GetMapping("sido")
	public List<SidoCode> selectSido() {
		return service.selectSido();
	}
	
	@GetMapping("gugun/{sido}")
	public List<SidoCode> selectGugun(@PathVariable("sido") String sido) {
		return service.selectGugun(sido);
	}
	
	@GetMapping("dong/{gugun}")
	public List<HouseInfo> selectDong(@PathVariable("gugun") String gugun) {
		return service.selectDong(gugun);
	}
	
	@GetMapping("apt/{dong}")
	public List<HouseInfo> selectApt(@PathVariable("dong") String dong) {
		return service.selectApt(dong);
	}
}