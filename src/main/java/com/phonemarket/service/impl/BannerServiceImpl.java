package com.phonemarket.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.phonemarket.entity.Banner;
import com.phonemarket.mapper.BannerMapper;
import com.phonemarket.service.IBannerService;

@Service
public class BannerServiceImpl implements IBannerService {
	@Autowired
	private BannerMapper bannerMapper;
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public PageInfo<Banner> findAllBannerBySplitePage(Integer page,Integer limit,String keyword) {
		PageHelper.startPage(page,limit);
		List<Banner> list=new ArrayList<Banner>();
		if(keyword!=null&&!keyword.trim().equals("")){
			list=bannerMapper.findAllBannerByLikeName(keyword);
		}else{
			list=bannerMapper.findAllBanner();
		}
		PageInfo<Banner> info=new PageInfo<Banner>(list);
		return info;
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Banner> findAllShowBanner() {
		return bannerMapper.findAllShowBanner();
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer updateBanner(Banner banner) {
		return bannerMapper.updateBanner(banner);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer changeBannerState(Integer state, Integer bannerId) {
		return bannerMapper.changeBannerState(state, bannerId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer deleteBanner(Integer bannerId) {
		return bannerMapper.deleteBanner(bannerId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer addBanner(Banner banner) {
		return bannerMapper.addBanner(banner);
	}

}
