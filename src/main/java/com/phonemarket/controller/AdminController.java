package com.phonemarket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.pool.DruidDataSource;
import com.phonemarket.entity.Admins;
import com.phonemarket.entity.Funs;
import com.phonemarket.service.IAdminService;

@Controller
@Scope("prototype")
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private IAdminService adminService;
	
	@RequestMapping("/login")
	@ResponseBody
	public String login(String adminName,String adminPass,HttpServletRequest request){
		Admins admin = adminService.login(adminName, adminPass);
		List<Funs> list = admin.getAdminRole().getRoleFuns();
		HttpSession session = request.getSession();
		if(admin!=null){
			session.setAttribute("admin", admin);
			return "success";
		}
		return "fail";
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		return "forward:/view/admin";
	}
	@RequestMapping("updatePass")
	@ResponseBody
	public String updatePass(String oldPass,String newPass,HttpServletRequest request){
		HttpSession session = request.getSession();
		Admins admin = (Admins) session.getAttribute("admin");
		if(oldPass.equals(admin.getAdminPass())){
			admin.setAdminPass(newPass);
			adminService.updateAdmin(admin);
			session.removeAttribute("admin");
			return "success";
		}
		return "fail";
	}
}
