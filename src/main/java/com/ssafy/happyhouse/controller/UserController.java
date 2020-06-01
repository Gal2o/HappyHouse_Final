package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService service;
	
	
	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("user", new UserDto());
		return "user/login";
		
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
