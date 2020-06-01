package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.PageNavigation;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;

public interface HouseService {
	public List<HouseDeal> searchAll(int currentPage, int sizePerPage, String key, String word, String type[]) throws Exception;
	
	public HouseDeal search(int no);
	
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word) throws Exception;
}
