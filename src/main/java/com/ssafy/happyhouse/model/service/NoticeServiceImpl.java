package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.PageNavigation;
import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.repository.NoticeRepo;

@Service
public class NoticeServiceImpl implements NoticeService {


	@Autowired
	private NoticeRepo noticeRepo;
	
	@Override
	public List<NoticeDto> listNotice(int currentPage, int sizePerPage, String key, String word) throws Exception {
		return noticeRepo.listNotice(currentPage, sizePerPage, key, word);
	}

	@Override
	public NoticeDto getNotice(int no) throws Exception {
		return noticeRepo.getNotice(no);
	}
	
	@Override
	public void writeNotice(NoticeDto noticeDto) throws Exception {
		noticeRepo.writeNotice(noticeDto);
		
		return;
	}

	@Override
	public void modifyNotice(NoticeDto noticeDto) throws Exception {
		noticeRepo.modifyNotice(noticeDto);
		
		return;
	}

	@Override
	public void deleteNotice(int no) throws Exception {
		noticeRepo.deleteNotice(no);

		return;
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word)
			throws Exception {
		PageNavigation pageNavigation = new PageNavigation();
		
		int naviSize = sizePerPage;	// 페이지 갯수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		
		int totalCount = noticeRepo.getTotalCount(key, word);	// 총 게시글 수
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