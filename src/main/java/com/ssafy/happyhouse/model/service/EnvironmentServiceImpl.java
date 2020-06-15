package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.PageNavigation;
import com.ssafy.happyhouse.model.dto.EnvironmentInfo;
import com.ssafy.happyhouse.model.repository.EnvironmentRepo;

@Service
public class EnvironmentServiceImpl implements EnvironmentService{
	
	@Autowired
	private EnvironmentRepo envRepo;

	@Override
	public List<EnvironmentInfo> searchAll(int currentPage, int sizePerPage, String word) throws Exception {
		return envRepo.searchAll(currentPage, sizePerPage, word);
	}

	@Override
	public List<EnvironmentInfo> search(String word) throws Exception {
		return envRepo.search(word);
	}


	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String word) throws Exception {
PageNavigation pageNavigation = new PageNavigation();
		
		int naviSize = sizePerPage;	// 페이지 갯수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		
		int totalCount = envRepo.getTotalCount(word);	// 총 게시글 수
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount-1)/naviSize+1;	// 총 페이지수
		pageNavigation.setTotalPageCount(totalPageCount);
		
		boolean startRange = currentPage<=naviSize ;	// startRange true:이전 X , false :이전 O
		pageNavigation.setStartRange(startRange);
		
		boolean endRange = (totalPageCount -1) / naviSize * naviSize < currentPage ;
		
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		
		return pageNavigation;
	}

		
}
