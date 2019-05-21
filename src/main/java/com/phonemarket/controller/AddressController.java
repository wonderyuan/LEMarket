package com.phonemarket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phonemarket.entity.Address;
import com.phonemarket.entity.Areas;
import com.phonemarket.entity.Cities;
import com.phonemarket.entity.Provinces;
import com.phonemarket.entity.Users;
import com.phonemarket.service.IAddressService;
import com.phonemarket.service.IProCityAreaService;

@Controller
@RequestMapping("/address")
public class AddressController {
	@Autowired
	private IAddressService addressService;
	@Autowired
	private IProCityAreaService pService;

	@RequestMapping("findAddrByUserId")
	@ResponseBody
	public List<Address> findAddrByUserId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		List<Address> list = addressService.findAddressByUserId(user.getUserId());
		return list;
	}

	@RequestMapping("addAddress")
	@ResponseBody
	public String addAddress(Address addr,HttpServletRequest request) {
		String provinceId = addr.getAddrProvince();
		String cityId = addr.getAddrCity();
		String areaId = addr.getAddrArea();
		Provinces province = pService.findProvinceById(provinceId);
		Cities city = pService.findCityById(cityId);
		Areas area = pService.findAreaById(areaId);
		addr.setAddrProvince(province.getProvinceName());
		addr.setAddrCity(city.getCityName());
		addr.setAddrArea(area.getAreaName());
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		addr.setAddrUser(user.getUserId());
		Integer rs = addressService.addAddress(addr);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("findAddressById")
	@ResponseBody
	public Address findAddrByAddrId(Integer addrId){
		Address addr = addressService.findAddresById(addrId);
		Provinces province = pService.findProvinceByName(addr.getAddrProvince());
		Cities city = pService.findCityByName(addr.getAddrCity(),province.getProvinceId());
		Areas area = pService.findAreaByName(addr.getAddrArea(),city.getCityId());
		addr.setAddrProvince(province.getProvinceId());
		addr.setAddrCity(city.getCityId());
		addr.setAddrArea(area.getAreaId());
		return addr;
	}
	@RequestMapping("modifyAddress")
	@ResponseBody
	public String modifyAddress(Address addr){
		String provinceId = addr.getAddrProvince();
		String cityId = addr.getAddrCity();
		String areaId = addr.getAddrArea();
		Provinces province = pService.findProvinceById(provinceId);
		Cities city = pService.findCityById(cityId);
		Areas area = pService.findAreaById(areaId);
		addr.setAddrProvince(province.getProvinceName());
		addr.setAddrCity(city.getCityName());
		addr.setAddrArea(area.getAreaName());
		Integer rs = addressService.updateAddress(addr);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
	@RequestMapping("deleteAddress")
	@ResponseBody
	public String deleteAddress(Integer addrId){
		Integer rs = addressService.deleteAddress(addrId);
		if(rs>0){
			return "success";
		}else{
			return "fail";
		}
	}
}
