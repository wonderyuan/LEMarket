package com.phonemarket.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.phonemarket.entity.Goods;

@Repository
public interface GoodsMapper {
	List<Goods> findAllBaseData();
	List<Goods> findAll();
	Integer saveGoods(Goods goods);
	Integer deleteGoods(Integer goods);
	Integer updateGoods(Goods goods);
	Goods findGoodsById(Integer id);
	List<Goods> findGoodsByType(Integer typeId);
	List<Goods> findHotGoods(Integer num);
	List<Goods> findGoodsLikeName(String name);
	List<Goods> findGoodsByVolume(Integer limit);
}
