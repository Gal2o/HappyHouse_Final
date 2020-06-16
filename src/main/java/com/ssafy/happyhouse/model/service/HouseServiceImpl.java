package com.ssafy.happyhouse.model.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.PageNavigation;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.repository.HouseRepo;

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	private HouseRepo houseRepo;
	
	@Override
	public List<HouseDeal> searchAll(int currentPage, int sizePerPage, String key, String word, LinkedList<String> type) throws Exception {
		return houseRepo.searchAll(currentPage, sizePerPage, key, word, type);
	}

	@Override
	public HouseDeal search(int no) {
		return houseRepo.search(no);
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word, LinkedList<String> type)
			throws Exception {
		
		PageNavigation pageNavigation = new PageNavigation();
		
		int naviSize = sizePerPage;	// 페이지 갯수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		
		int totalCount = houseRepo.getTotalCount(key, word, type);	// 총 게시글 수
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
