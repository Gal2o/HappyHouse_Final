package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.PageNavigation;
import com.ssafy.happyhouse.model.dto.EnvironmentInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;

public interface EnvironmentService {
	public List<EnvironmentInfo> searchAll(int currentPage, int sizePerPage, String word) throws Exception;
	
	public List<EnvironmentInfo> search(String word) throws Exception;
	
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String word) throws Exception;
}
