package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.PageNavigation;
import com.ssafy.happyhouse.model.dto.BusinessInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;

public interface BusinessService {
	public List<BusinessInfo> searchAll(int currentPage, int sizePerPage, String word) throws Exception;
	
	public List<BusinessInfo> search(String word) throws Exception;
	
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String word) throws Exception;
}
