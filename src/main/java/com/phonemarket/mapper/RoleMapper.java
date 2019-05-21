package com.phonemarket.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.phonemarket.entity.Funs;
import com.phonemarket.entity.Role;

@Repository
public interface RoleMapper {
	Role findById(Integer id);
	List<Role> findAllRole();
	Role findRolesFunsById(Integer roleId);
}
