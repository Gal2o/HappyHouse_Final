package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.BusinessInfo;
import com.ssafy.happyhouse.model.repository.BusinessRepo;

@Service
public class BusinessServiceImpl implements BusinessService{
	
	@Autowired
	private BusinessRepo bizRepo;

	@Override
	public List<BusinessInfo> searchAll(String word) throws Exception {
		return bizRepo.searchAll(word);
	}

	@Override
	public List<BusinessInfo> search(String word) throws Exception {
		return bizRepo.search(word);
	}

		
}
