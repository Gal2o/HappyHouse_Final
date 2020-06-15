package com.ssafy.happyhouse.model.repository;

import java.util.List;

import com.ssafy.happyhouse.model.dto.BusinessInfo;

public interface BusinessRepo {

	public List<BusinessInfo> searchAll(int currentPage, int sizePerPage, String word);
	
	public List<BusinessInfo> search(String word);
	
	public int getTotalCount(String word) throws Exception;
}
