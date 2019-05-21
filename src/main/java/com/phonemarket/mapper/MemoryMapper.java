package com.phonemarket.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.phonemarket.entity.Memory;

@Repository
public interface MemoryMapper {
	Memory findMemoryById(Integer id);
	List<Memory> findAllMemory();
}
