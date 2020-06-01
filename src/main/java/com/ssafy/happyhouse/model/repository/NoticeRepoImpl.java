package com.ssafy.happyhouse.model.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.NoticeDto;

@Repository
public class NoticeRepoImpl implements NoticeRepo {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List<NoticeDto> listNotice(int currentPage, int sizePerPage,String key, String word) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		
		RowBounds bounds = new RowBounds((currentPage-1)*sizePerPage, sizePerPage);
		
		return sqlSession.selectList("notice.selectAll", map, bounds);
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

	@Override
	public int getTotalCount(String key, String word) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		
		return sqlSession.selectOne("notice.count", map);
	}
}