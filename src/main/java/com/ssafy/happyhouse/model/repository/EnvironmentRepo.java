package com.ssafy.happyhouse.model.repository;

import java.util.List;

import com.ssafy.happyhouse.model.dto.EnvironmentInfo;

public interface EnvironmentRepo {

	public List<EnvironmentInfo> searchAll(int currentPage, int sizePerPage, String word);
	
	public List<EnvironmentInfo> search(String word);
	
	public int getTotalCount(String word) throws Exception;
}
