package com.phonemarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phonemarket.entity.Memory;
import com.phonemarket.service.IMemoryService;

@Controller
@RequestMapping("/memory")
public class MemoryController {
	@Autowired
	private IMemoryService memoryService;
	@RequestMapping("findAll")
	@ResponseBody
	public List<Memory> findAllMemory(){
			List<Memory> list = memoryService.finAllMemory();
			return list;
	}
}
