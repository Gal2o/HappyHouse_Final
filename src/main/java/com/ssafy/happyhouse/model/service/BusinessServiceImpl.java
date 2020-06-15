package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.PageNavigation;
import com.ssafy.happyhouse.model.dto.BusinessInfo;
import com.ssafy.happyhouse.model.repository.BusinessRepo;

@Service
public class BusinessServiceImpl implements BusinessService{
	
	@Autowired
	private BusinessRepo bizRepo;

	@Override
	public List<BusinessInfo> searchAll(int currentPage, int sizePerPage, String word) throws Exception {
		return bizRepo.searchAll(currentPage, sizePerPage, word);
	}

	@Override
	public List<BusinessInfo> search(String word) throws Exception {
		return bizRepo.search(word);
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String word) throws Exception {
		PageNavigation pageNavigation = new PageNavigation();
		
		int naviSize = sizePerPage;	// 페이지 갯수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		
		int totalCount = bizRepo.getTotalCount(word);	// 총 게시글 수
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
