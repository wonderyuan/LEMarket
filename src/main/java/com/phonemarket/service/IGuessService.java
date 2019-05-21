package com.phonemarket.service;

import java.util.List;
import java.util.Map;

import com.phonemarket.entity.Guess;

public interface IGuessService {
	List<Guess> findGuessGoodsByUserId(Integer userId,Integer num);
	Integer addGuess(Guess guess);
	Guess findGuessByUserId(Integer userId,Integer goodsId);
	Integer updateGuess(Guess g);
	Integer addGoodsToFavorite(Integer userId,Integer goodsId);
	List<Guess> findAllFavoriteByUserId(Integer userId);
	Integer removeFavorite(Integer userId,Integer goodsId);
	List<Guess> findRecentViewGoods(Integer userId,Integer limit);
	List<Map<String,Object>> findMostHotGoods(Integer limit);
}
