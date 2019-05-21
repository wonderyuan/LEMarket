package com.phonemarket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phonemarket.entity.Areas;
import com.phonemarket.entity.Cities;
import com.phonemarket.entity.Provinces;
import com.phonemarket.mapper.AreasMapper;
import com.phonemarket.mapper.CitiesMapper;
import com.phonemarket.mapper.ProvincesMapper;
import com.phonemarket.service.IProCityAreaService;

@Service
public class ProCityAreaServiceImpl implements IProCityAreaService {
	@Autowired
	private ProvincesMapper provincesMapper;
	@Autowired
	private CitiesMapper cityMapper;
	@Autowired
	private AreasMapper areaMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Provinces> findAllProvinces() {
		return provincesMapper.findAllProvince();
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Cities> findCityByProvincesId(String provinceId) {
		return cityMapper.findCitiesByProvinceId(provinceId);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Areas> findAreaByCityId(String cityId) {
		return areaMapper.findAreasByCityId(cityId);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Provinces findProvinceById(String id) {
		return provincesMapper.findProByProId(id);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Cities findCityById(String id) {
		return cityMapper.findCityById(id);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Areas findAreaById(String id) {
		return areaMapper.findAreaById(id);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Provinces findProvinceByName(String name) {
		return provincesMapper.findProByProName(name);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Cities findCityByName(String name,String provinceId) {
		return cityMapper.findCityByCityName(name,provinceId);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Areas findAreaByName(String name,String cityId) {
		return areaMapper.findAreaByAreaName(name,cityId);
	}
	
}
