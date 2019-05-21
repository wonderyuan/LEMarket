package com.phonemarket.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.phonemarket.entity.GoodsType;

public interface IGoodsTypeService {
	List<GoodsType> findAllType();
	
	PageInfo<GoodsType> findTypeBySplitPage(Integer page,Integer limit,String keyword);
	Integer updateGoodsType(GoodsType type);
	Integer addGoodsType(GoodsType type);
	Integer changeTypeState(Integer state,Integer typeId);
	Integer deleteGoodsType(Integer typeId);
}
