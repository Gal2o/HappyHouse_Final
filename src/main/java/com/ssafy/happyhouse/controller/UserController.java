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
	
	@GetMapping("login")
	public String loginPage() {
		return "user/login";
	}
	
	@PostMapping("login")
	public String login(String id,UserDto userDto, Model model, HttpServletRequest request) {
		try {
			UserDto user = service.select(id);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", user);
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인 해 주세요.");
				return "error/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "/index";
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userinfo");
		
		return "/index";
	}
	
	@GetMapping("join")
	public String joinPage() {
		return "/user/join";
	}
	
	@PostMapping("join")
	public String join(UserDto userDto, String tel1, String tel2, String tel3, Model model) {
		userDto.setPhone(tel1+"-"+tel2+"-"+tel3);
		try {
			service.insert(userDto);
			model.addAttribute("msg", "회원가입에 성공하였습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원가입 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "/index";
	}
	@GetMapping("view")
	public String view(String id, Model model) {
		try {
			model.addAttribute("id", service.select(id));
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원정보를 가져오지 못했습니다");
			return "error/error";
		}
		
		return "user/info";
	}
	
	@GetMapping("revise")
	public String revisePage() {
		return "/user/revise";
	}
	@PostMapping("revise")
	public String update(UserDto userDto, Model model) {
		try {
			service.update(userDto);
			model.addAttribute("msg", "회원정보수정에 성공하였습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원정보수정 중 문제가 발생했습니다.");
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
		
		return "/index";
	}
	
}
