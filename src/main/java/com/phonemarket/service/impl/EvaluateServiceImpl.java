package com.phonemarket.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.phonemarket.entity.Evaimg;
import com.phonemarket.entity.Evaluate;
import com.phonemarket.entity.Goods;
import com.phonemarket.mapper.EvaimgMapper;
import com.phonemarket.mapper.EvaluateMapper;
import com.phonemarket.service.IEvaluateService;
import com.phonemarket.util.PageValue;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service
public class EvaluateServiceImpl implements IEvaluateService {
	@Autowired
	private EvaluateMapper evaluateMapper;
	@Autowired
	private EvaimgMapper evaImgMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer addEvaluate(Evaluate eva,String[] imgs) {
		Integer rs = evaluateMapper.addEvaluate(eva);
		if(rs>0){
			for (String img : imgs) {
				Evaimg evaimg=new Evaimg(img, eva.getEvaId());
				evaImgMapper.addEvaimg(evaimg);
			}
		}
		return rs;
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Evaluate> findEvaluateByGoodsId(Integer goodsId) {
		List<Evaluate> evaList = evaluateMapper.findEvaByGoodsId(goodsId);
		for (Evaluate evaluate : evaList) {
			List<Evaimg> imgList = evaImgMapper.findEvaimgByEvaId(evaluate.getEvaId());
			evaluate.setImgList(imgList);
		}
		return evaList;
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public PageInfo<Evaluate> findAllEvaluate(Integer page,Integer limit,String keyword) {
		PageHelper.startPage(page, limit);
		List<Evaluate> evaList=new ArrayList<Evaluate>();
		if(keyword!=null&&!keyword.trim().equals("")){
			evaList=evaluateMapper.findAllEvaluteLikeContent(keyword);
		}else{
			evaList = evaluateMapper.findAllEvalute();
		}
		PageInfo<Evaluate> info=new PageInfo<Evaluate>(evaList);
		return info;
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer deleteEvaluate(Integer evaId) {
		return  evaluateMapper.deleteEvaluate(evaId);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Evaluate findEvaluteById(Integer evaId) {
		Evaluate eva = evaluateMapper.findEvaById(evaId);
		List<Evaimg> imgList = evaImgMapper.findEvaimgByEvaId(eva.getEvaId());
		eva.setImgList(imgList);
		return eva;
	}

}
