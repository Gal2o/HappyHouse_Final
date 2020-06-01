package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.repository.NoticeRepo;

@Service
public class NoticeServiceImpl implements NoticeService {


	@Autowired
	private NoticeRepo noticeRepo;
	
	@Override
	public List<NoticeDto> listNotice(String key, String word) throws Exception {
		return noticeRepo.listNotice(key, word);
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
}