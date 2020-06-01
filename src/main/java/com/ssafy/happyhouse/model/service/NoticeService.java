package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.PageNavigation;
import com.ssafy.happyhouse.model.dto.NoticeDto;

public interface NoticeService {
	
	public List<NoticeDto> listNotice(int currentPage, int sizePerPage, String key, String word) throws Exception;
	public NoticeDto getNotice(int no) throws Exception;
	public void writeNotice(NoticeDto noticeDto) throws Exception;
	public void modifyNotice(NoticeDto noticeDto) throws Exception;
	public void deleteNotice(int no) throws Exception;
	
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word) throws Exception;
	
}