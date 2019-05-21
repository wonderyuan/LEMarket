package com.phonemarket.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.phonemarket.entity.Address;
import com.phonemarket.entity.Provinces;

@Repository
public interface ProvincesMapper {
	List<Provinces> findAllProvince();
	Provinces findProByProName(String name);
	Provinces findProByProId(String id);
}
