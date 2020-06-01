package com.ssafy.happyhouse.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.NoticeDto;

@Repository
public class NoticeRepoImpl implements NoticeRepo {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List<NoticeDto> listNotice(String key, String word) throws Exception {
		System.out.println("key: "+key+", "+"word: "+word);
		return sqlSession.selectList("notice.selectAll");
	}

	@Override
	public NoticeDto getNotice(int no) throws Exception {
		return sqlSession.selectOne("notice.select", no);
	}
	
	@Override
	public void writeNotice(NoticeDto noticeDto) throws Exception {
		sqlSession.insert("notice.insert", noticeDto);
		
		return;
	}

	@Override
	public void modifyNotice(NoticeDto noticeDto) throws Exception {
		sqlSession.update("notice.update", noticeDto);
		
		return;
	}

	@Override
	public void deleteNotice(int no) throws Exception {
		sqlSession.delete("notice.delete", no);
		
		return;
	}
}