package com.phonemarket.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.phonemarket.entity.Funs;

@Repository
public interface FunsMapper {
	Funs findFunsById(Integer id);
	List<Funs> findFunsByPid(Integer id);
	List<Funs> findAllFuns();
	List<Funs> findFunsByRoleId(Integer roleId);
}
