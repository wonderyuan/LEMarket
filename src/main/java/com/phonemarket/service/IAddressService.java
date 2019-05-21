package com.phonemarket.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.phonemarket.entity.Address;
import com.phonemarket.entity.Areas;
import com.phonemarket.entity.Cities;
import com.phonemarket.entity.Provinces;

public interface IAddressService {
	List<Address> findAddressByUserId(Integer userId);
	Address findAddresById(Integer id);
	Provinces findProByProByName(String name);
	Cities findCityByCityName(String name,String provinceId);
	Areas findAreaByAreaName(String name,String cityId);
	Integer addAddress(Address addr);
	Integer updateAddress(Address addr);
	Integer deleteAddress(Integer addrId);
}
