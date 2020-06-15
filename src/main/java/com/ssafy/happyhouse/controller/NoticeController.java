package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.service.NoticeService;

@Controller
@RequestMapping("/notice.do")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@GetMapping("write")
	public String writePage() {
		return "notice/NoticeWrite";
	}
	
	@PostMapping("write")
	public String register(NoticeDto noticeDto, Model model) {
		try {
			service.writeNotice(noticeDto);
			model.addAttribute("msg", "글 작성 성공!");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글 등록 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "notice/Success";
	}
	
	@GetMapping("list")
	public String list(@RequestParam(value="key", required=false, defaultValue="") String key, 
					   @RequestParam(value="word", required=false, defaultValue="") String word,
					   @RequestParam(value="pg", required=false, defaultValue="1") int currentPage,
					   Model model) {
		int sizePerPage = 5;
		try {
			System.out.println("word: "+word);
			System.out.println("pg: "+currentPage);
			model.addAttribute("notices", service.listNotice(currentPage, sizePerPage, key, word));
			model.addAttribute("navigation", service.makePageNavigation(currentPage, sizePerPage, key, word));
			model.addAttribute("key", key);
			model.addAttribute("word", word);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "notice/NoticeList";
	}
	
	@GetMapping("view")
	public String view(int no, Model model) {
		try {
			model.addAttribute("notice", service.getNotice(no));
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "상세 내용 조회 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "notice/NoticeView";
	}
	
	@GetMapping("modify")
	public String modifyPage(int no, Model model) {
		try {
			model.addAttribute("notice", service.getNotice(no));
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "수정 페이지 조회 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "notice/NoticeModify";
	}
	
	@PostMapping("modify")
	public String modify(NoticeDto noticeDto, Model model) {
		try {
			service.modifyNotice(noticeDto);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글 수정 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "redirect:/notice.do/view?no="+noticeDto.getNo();
	}
	
	@GetMapping("delete")
	public String delete(int no, Model model) {
		try {
			service.deleteNotice(no);
			model.addAttribute("msg", "글 삭제 성공!");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글 삭제 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "notice/Success";
	}
}