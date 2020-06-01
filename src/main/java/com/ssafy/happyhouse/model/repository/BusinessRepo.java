package com.ssafy.happyhouse.model.repository;

import java.util.List;

import com.ssafy.happyhouse.model.dto.BusinessInfo;

public interface BusinessRepo {

	public List<BusinessInfo> searchAll(String word);
	
	public List<BusinessInfo> search(String word);
}
