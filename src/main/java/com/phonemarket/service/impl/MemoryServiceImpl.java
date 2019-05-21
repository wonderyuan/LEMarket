package com.phonemarket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phonemarket.entity.Memory;
import com.phonemarket.mapper.MemoryMapper;
import com.phonemarket.service.IMemoryService;

@Service
public class MemoryServiceImpl implements IMemoryService {
	@Autowired
	private MemoryMapper memoryMapper;
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Memory> finAllMemory() {
		return memoryMapper.findAllMemory();
	}

}
