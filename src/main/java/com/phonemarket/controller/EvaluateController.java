package com.phonemarket.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.phonemarket.entity.Evaluate;
import com.phonemarket.entity.Goods;
import com.phonemarket.entity.Order;
import com.phonemarket.entity.OrderDetail;
import com.phonemarket.entity.Users;
import com.phonemarket.service.IEvaluateService;
import com.phonemarket.service.IGoodsService;
import com.phonemarket.service.IOrderService;
import com.phonemarket.service.IRedisEvaluateService;
import com.phonemarket.util.UUIDUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Controller
@RequestMapping("/evaluate")
public class EvaluateController {
	@Autowired
	private IEvaluateService evaluateService;
	@Autowired
	private IGoodsService goodsService;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IRedisEvaluateService redisService;
	
	@RequestMapping(value="uploadEvaImg",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject uploadEvaImg(@PathVariable(value="file")MultipartFile file,HttpServletRequest request){
		String str=file.getOriginalFilename();
		JSONObject obj=new JSONObject();
		String name=UUIDUtil.getUUID()+str.substring(str.lastIndexOf("."));
		String path=request.getServletContext().getRealPath("/upload")+"/"+name;
		try {
			file.transferTo(new File(path));
			obj.put("src", name);
			obj.put("code", 0);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			obj.put("code", 1);
		}
		return obj;
	}
	@RequestMapping("addEvaluate")
	@ResponseBody
	public String addEvaluate(Evaluate eva,String imgUrls,String evaOrderId,HttpServletRequest request){
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		Order order = orderService.findOrderById(evaOrderId);
		List<OrderDetail> list = order.getDetailList();
		String[] imgs = imgUrls.split(",");
		boolean flag=true;
		for (OrderDetail o : list) {
			eva.setEvaDate(new Date());
			eva.setEvaGoods(o.getDetailGoods());
			eva.setEvaUser(user);
			Integer rs = evaluateService.addEvaluate(eva,imgs);
			if(rs<0){
				flag=false;
			}
			redisService.RefreshEvaluate(o.getDetailGoods().getGoodsId());
		}
		if(flag){
			orderService.evaOrder(evaOrderId);
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("findAll")
	@ResponseBody
	public JSONObject findAllEvaList(Integer page,Integer limit,String keyword){
		PageInfo<Evaluate> info = evaluateService.findAllEvaluate(page,limit,keyword);
		JSONObject obj=new JSONObject();
		obj.put("code", 0);
		obj.put("msg", "");
		obj.put("data", info.getList());
		obj.put("count", info.getTotal());
		return obj;
	}
	@RequestMapping("batchDelete")
	@ResponseBody
	public String batchDelete(String batchId){
		String[] list = batchId.split(",");
		boolean flag=true;
		for (String s : list) {
			Integer evaId = Integer.valueOf(s);
			Evaluate evaluate = evaluateService.findEvaluteById(evaId);
			Integer rs = evaluateService.deleteEvaluate(evaId);
			redisService.RefreshEvaluate(evaluate.getEvaGoods().getGoodsId());
			if(rs<0){
				flag=false;
			}
		}
		if(flag){
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("deleteEvalute")
	@ResponseBody
	public String deleteEvalute(Integer evaId){
		Evaluate evaluate = evaluateService.findEvaluteById(evaId);
		redisService.RefreshEvaluate(evaluate.getEvaGoods().getGoodsId());
		Integer rs = evaluateService.deleteEvaluate(evaId);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("findEvaById")
	@ResponseBody
	public Evaluate findEvaluateById(Integer evaId){
		return evaluateService.findEvaluteById(evaId);
	}
}
