package com.phonemarket.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.phonemarket.entity.Goods;
import com.phonemarket.entity.Guess;
import com.phonemarket.entity.Users;
import com.phonemarket.service.IGoodsService;
import com.phonemarket.service.IGuessService;

@Controller
@RequestMapping("/guess")
public class GuessController {
	@Autowired
	private IGuessService guessService;
	@Autowired
	private IGoodsService goodsService;
	
	@RequestMapping("findFavorite")
	@ResponseBody
	public List<Guess> findFavoriteGoods(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		List<Guess> guessList = guessService.findAllFavoriteByUserId(user.getUserId());
		return guessList;
	}
	
	@RequestMapping("addToFavorite")
	@ResponseBody
	public String addGoodsToFavorite(Integer goodsId,HttpServletRequest request){
		HttpSession session = request.getSession();
		Users user=(Users) session.getAttribute("user");
		Integer rs = guessService.addGoodsToFavorite(user.getUserId(), goodsId);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping("isFaorite")
	@ResponseBody
	public String isFavorite(Integer goodsId,HttpServletRequest request){
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		if(user!=null){
			Guess guess = guessService.findGuessByUserId(user.getUserId(), goodsId);
			Integer rs = guess.getFavorite();
			if(rs>0){
				return "true";
			}else{
				return "false";
			}
		}else{
			return "false";
		}
	}
	@RequestMapping("removeFavorite")
	@ResponseBody
	public String removeFavorite(Integer goodsId,HttpServletRequest request){
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		Integer rs = guessService.removeFavorite(user.getUserId(), goodsId);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("findRecentGoods")
	@ResponseBody
	public List<Guess> findRecentViewGoods(HttpServletRequest request){
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		List<Guess> list = guessService.findRecentViewGoods(user.getUserId(), 8);
		return list;
	}
	@RequestMapping("findMostHotGoods")
	@ResponseBody
	public JSONArray findHotGoods(){
		List<Map<String, Object>> list = guessService.findMostHotGoods(6);
		JSONArray arr=new JSONArray();
		for (Map<String, Object> map : list) {
			JSONObject obj=new JSONObject();
			Integer goodsId = (Integer) map.get("g");
			Number n=(Number) map.get("num");
			Goods g = goodsService.findById(goodsId);
			obj.put("name", g.getGoodsName());
			obj.put("num", n.longValue());
			arr.add(obj);
		}
		return arr;
	}
}
