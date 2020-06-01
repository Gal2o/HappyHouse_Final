package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.service.UserService;

@Controller
@RequestMapping("/User.do")
public class UserController {
	
	@Autowired
	UserService service;
	
	@GetMapping("/login")
	public String loginPage() {
		return "user/login";
	}
	
	@PostMapping("/login")
	public String login(UserDto userDto, Model model, HttpServletRequest request) {
		try {
			UserDto user = service.select(userDto);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", user);
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인 해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "/index";
	}
	
	
	
	
	
	@GetMapping("delete")
	public String delete(String id, Model model) {
		try {
			service.delete(id);
			model.addAttribute("msg", "회원을 탈퇴했습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "탈퇴 불가.");
			return "error/error";
		}
		
		return "";
	}
	
}
