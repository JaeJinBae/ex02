package com.dgit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	@RequestMapping("/sendListAuth")
	public ResponseEntity<Void> sendListAuth(){
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);//400error
	}
	
	@RequestMapping("/sendVOAuth")
	public ResponseEntity<SampleVO> sendVOAuth(){
		SampleVO vo=new SampleVO();
		vo.setFirstName("길동");
		vo.setLastName("홍");
		vo.setMno(1);
		return new ResponseEntity<SampleVO>(vo,HttpStatus.OK);
	}
	
	@RequestMapping("/sendMapAuth")
	public ResponseEntity<Map<String,String>> sendMapAuth(String test1, int test2){
		HashMap<String, String> map=new HashMap<>();
		map.put("key1", test1);
		map.put("key2", test2+"String");
		return new ResponseEntity<Map<String,String>>(map,HttpStatus.OK);
	}
}










