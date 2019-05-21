package com.phonemarket.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.phonemarket.entity.Users;
import com.phonemarket.mapper.UserMapper;
import com.phonemarket.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserMapper userMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Users login(String userName, String userPass) {
		List<Users> userList = userMapper.findUserByName(userName);
		for (Users users : userList) {
			if(users.getUserPass().equals(userPass)){
				return users;
			}
		}
		return null;
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer updateUserInfo(Users user) {
		return userMapper.updateUser(user);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Users findUserById(Integer id) {
		return userMapper.findUserById(id);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public PageInfo<Users> findAllUsersBySplitPage(Integer page,Integer limit,String keyword) {
		PageHelper.startPage(page, limit);
		List<Users> list=new ArrayList<Users>();
		if(keyword!=null&&!keyword.trim().equals("")){
			list=userMapper.findAllUserLikeName(keyword);
		}else{
			list=userMapper.findAllUser();
		}
		PageInfo<Users> info=new PageInfo<Users>(list);
		return info;
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer changeUserState(Integer state,Integer userId){
		return userMapper.changeUserState(state, userId);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Integer deleteUser(Integer userId) {
		return userMapper.deleteUser(userId);
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Integer addUser(Users user) {
		return userMapper.addUser(user);
	}

}
