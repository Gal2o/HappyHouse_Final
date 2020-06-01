package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.EnvironmentInfo;
import com.ssafy.happyhouse.model.repository.EnvironmentRepo;

@Service
public class EnvironmentServiceImpl implements EnvironmentService{
	
	@Autowired
	private EnvironmentRepo envRepo;

	@Override
	public List<EnvironmentInfo> searchAll(String word) throws Exception {
		return envRepo.searchAll(word);
	}

	@Override
	public List<EnvironmentInfo> search(String word) throws Exception {
		return envRepo.search(word);
	}

		
}
