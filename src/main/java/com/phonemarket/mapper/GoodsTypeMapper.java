package com.phonemarket.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.phonemarket.entity.GoodsType;

@Repository
public interface GoodsTypeMapper {
	GoodsType findTypeById(Integer id);
	Integer saveGoodsType(GoodsType goodsType);
	Integer deleteGoodsType(Integer id);
	Integer updateGoodsType(GoodsType type);
	List<GoodsType> findAllType();
	Integer changeTypeState(Integer state,Integer typeId);
	List<GoodsType> findAllTypeByLikeName(String name);
	List<GoodsType> findAllBySplitPage();
}
