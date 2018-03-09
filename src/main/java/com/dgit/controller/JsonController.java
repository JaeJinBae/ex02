package com.dgit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.SampleVO;

@RestController
@RequestMapping("/json/*")
public class JsonController {
	private static final Logger logger=LoggerFactory.getLogger(JsonController.class);
	
	@RequestMapping("/hello")
	public String sayHello(){
		return "hello";
	}
	
	@RequestMapping("/map")
	public HashMap<String, String> testMap(){
		HashMap<String, String> map=new HashMap<>();
		map.put("key1", "값1");
		map.put("key2", "값2");
		map.put("key3", "값3");
		return map;
	}
	
	@RequestMapping("/sendList")
	public List<SampleVO> sendList(){
		ArrayList<SampleVO> list=new ArrayList<>();
		for(int i=0;i<10;i++){
			SampleVO vo=new SampleVO();
			vo.setFirstName("길동"+i);
			vo.setLastName("홍"+i);
			vo.setMno(i);
			list.add(vo);
		}
		return list;
	}
}
