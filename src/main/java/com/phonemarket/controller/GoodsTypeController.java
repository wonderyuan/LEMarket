package com.phonemarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.phonemarket.entity.GoodsType;
import com.phonemarket.service.IGoodsTypeService;

@Controller
@RequestMapping("/goodsType")
public class GoodsTypeController {
	@Autowired
	private IGoodsTypeService goodsTypeService;
	@RequestMapping("findAll")
	@ResponseBody
	public List<GoodsType> finAllType(){
		List<GoodsType> list = goodsTypeService.findAllType();
		return list;
	}
	@RequestMapping("findTypeBySplitPage")
	@ResponseBody
	public JSONObject findTypeBySplitPage(Integer page,Integer limit,String keyword){
		PageInfo<GoodsType> info = goodsTypeService.findTypeBySplitPage(page, limit, keyword);
		JSONObject obj=new JSONObject();
		obj.put("code", 0);
		obj.put("msg", "");
		obj.put("count", info.getTotal());
		obj.put("data", info.getList());
		return obj;
	}
	@RequestMapping("deleteGoodsType")
	@ResponseBody
	public String deleteGoodsType(Integer typeId){
		Integer rs = goodsTypeService.deleteGoodsType(typeId);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("updateGoodsType")
	@ResponseBody
	public String updateGoodsType(GoodsType type){
		Integer rs = goodsTypeService.updateGoodsType(type);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("changeTypeState")
	@ResponseBody
	public String disableGoodsType(Integer typeId,Integer state){
		System.out.println(state+"state");
		System.out.println(typeId+"typeId");
		Integer rs = goodsTypeService.changeTypeState(state, typeId);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("batchDelete")
	@ResponseBody
	public String batchDelete(String batchId){
		String[] list = batchId.split(",");
		boolean flag=true;
		for (String s : list) {
			Integer typeId = Integer.valueOf(s);
			Integer rs = goodsTypeService.deleteGoodsType(typeId);
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
	@RequestMapping("addGoodsType")
	@ResponseBody
	public String addGoodsType(GoodsType goodsType){
		Integer rs = goodsTypeService.addGoodsType(goodsType);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
}
