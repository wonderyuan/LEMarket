package com.phonemarket.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.phonemarket.entity.Guess;

@Repository
public interface GuessMapper {
	List<Guess> findAllGuess();
	Integer saveGuess(Guess g);
	Integer deleteGuess(Integer id);
	Integer updateGuess(Guess guess);
	Integer addGoodsToFavorite(Integer goodsId,Integer userId);
	Integer cancelFavorite(Integer goodsId,Integer userId);
	List<Guess> findAllGuessByUserId(Integer userId);
	List<Guess> findAllFavoriteByUserId(Integer userId);
	List<Guess> findMostLikeLimit(Integer userId,Integer count);
	Guess findGuessByUserId(Integer userId,Integer goodsId);
	List<Guess> findRecentReviewGoods(Integer userId,Integer limit);
	List<Map<String,Object>> findMostHotGoods(Integer limit);
}
