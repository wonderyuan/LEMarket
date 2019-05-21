package com.phonemarket.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.phonemarket.entity.Evaluate;
import com.phonemarket.entity.Goods;
import com.phonemarket.entity.GoodsType;
import com.phonemarket.entity.Memory;
import com.phonemarket.service.IEvaluateService;
import com.phonemarket.service.IGoodsService;
import com.phonemarket.service.IGoodsTypeService;
import com.phonemarket.service.IMemoryService;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class GoodsAttrListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		ApplicationContext app=new ClassPathXmlApplicationContext("applicationContext.xml");
		IGoodsTypeService typeService = app.getBean(IGoodsTypeService.class);
		ServletContext application = arg0.getServletContext();
		IMemoryService memoryService = app.getBean(IMemoryService.class);
		List<GoodsType> typeList = typeService.findAllType();
		application.setAttribute("goodsTypeList", typeList);
		List<Memory> memoryList = memoryService.finAllMemory();
		application.setAttribute("memoryList", memoryList);
		IGoodsService service = app.getBean(IGoodsService.class);
		List<Goods> goodsList = service.findAll();
		JedisPool jedisPool = app.getBean(JedisPool.class);
		IEvaluateService evaService = app.getBean(IEvaluateService.class);
		Jedis jedis = jedisPool.getResource();
		for (Goods g : goodsList) {
			List<Evaluate> evaList = evaService.findEvaluateByGoodsId(g.getGoodsId());
			g.setEvaList(evaList);
			StringBuffer str =new StringBuffer(JSON.toJSONString(g));
			jedis.set(g.getGoodsId()+"", str.toString());
		}
	}

}
