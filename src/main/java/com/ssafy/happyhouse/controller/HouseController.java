package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.service.BusinessService;
import com.ssafy.happyhouse.model.service.EnvironmentService;
import com.ssafy.happyhouse.model.service.HouseService;

@Controller
@RequestMapping("/Apt.do")
public class HouseController {

	@Autowired
	private HouseService service;
	
	@Autowired
	private BusinessService bservice;
	
	@Autowired
	private EnvironmentService eservice;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("site")
	public String site() {
		return "sitemap";
	}
	
	@GetMapping("list")
	public String list(
			@RequestParam(value="key", required=false, defaultValue="") String key,
			@RequestParam(value="word", required=false, defaultValue="") String word,
			@RequestParam(value="pg", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="aptdeal", required=false, defaultValue="1,2,3,4") String type[], 
			Model model) {
		
		int sizePerPage = 10;
		try {
			model.addAttribute("aptdeals", service.searchAll(currentPage, sizePerPage, key, word, type));
			model.addAttribute("navigation", service.makePageNavigation(currentPage, sizePerPage, key, word));
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "상세 내용 조회 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "apt/AptList";
	}
	
	@GetMapping("view")
	public String view(int no, Model model) {
		try {
			model.addAttribute("aptdeal", service.search(no));
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "상세 내용 조회 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "apt/Aptinfo";
	}
	
	@GetMapping("barea")
	public String barea(
			@RequestParam(value="word", required=false, defaultValue="") String word,
			@RequestParam(value="pg", required=false, defaultValue="1") int currentPage,
			Model model) {
		int sizePerPage = 10;
		try {
			model.addAttribute("barea", bservice.searchAll(currentPage, sizePerPage, word));
			model.addAttribute("navigation", bservice.makePageNavigation(currentPage, sizePerPage, word));
			System.out.println(2);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "상세 내용 조회 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "apt/BAreaInfo";
	}
	
	@GetMapping("earea")
	public String earea(@RequestParam(value="word", required=false, defaultValue="") String word, Model model) {
		
		try {
			model.addAttribute("earea", eservice.searchAll(word));
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "상세 내용 조회 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "apt/EAreaInfo";
	}
	
}
