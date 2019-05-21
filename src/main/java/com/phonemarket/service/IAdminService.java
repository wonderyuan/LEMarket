package com.phonemarket.service;

import com.phonemarket.entity.Admins;

public interface IAdminService {
	Admins login(String name,String pass);
	Integer updateAdmin(Admins admin);
	Admins findAdminById(Integer id);
}
