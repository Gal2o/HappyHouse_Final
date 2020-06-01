package com.ssafy.happyhouse.model.repository;

import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;

public interface HouseRepo {
	public List<HouseDeal> searchAll(int currentPage, int sizePerPage, String key, String word, String type[]);
	
	public HouseDeal search(int no);
	
	public int getTotalCount(String key, String word) throws Exception;
}
