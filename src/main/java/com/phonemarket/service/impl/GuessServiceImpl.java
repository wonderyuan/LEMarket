package com.phonemarket.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phonemarket.entity.Guess;
import com.phonemarket.mapper.GuessMapper;
import com.phonemarket.service.IGuessService;

@Service
public class GuessServiceImpl implements IGuessService {
	@Autowired
	private GuessMapper guessMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Guess> findGuessGoodsByUserId(Integer userId, Integer num) {
		return guessMapper.findMostLikeLimit(userId, num);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer addGuess(Guess guess) {
		Integer rs = guessMapper.saveGuess(guess);
		return rs;
	}

	@Override
	public Guess findGuessByUserId(Integer userId, Integer goodsId) {
		return guessMapper.findGuessByUserId(userId, goodsId);
	}

	@Override
	public Integer updateGuess(Guess g) {
		return guessMapper.updateGuess(g);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer addGoodsToFavorite(Integer userId, Integer goodsId) {
		return guessMapper.addGoodsToFavorite(goodsId, userId);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Guess> findAllFavoriteByUserId(Integer userId) {
		return guessMapper.findAllFavoriteByUserId(userId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer removeFavorite(Integer userId, Integer goodsId) {
		return guessMapper.cancelFavorite(goodsId, userId);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Guess> findRecentViewGoods(Integer userId, Integer limit) {
		return guessMapper.findRecentReviewGoods(userId, limit);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Map<String, Object>> findMostHotGoods(Integer limit) {
		return guessMapper.findMostHotGoods(limit);
	}

}
