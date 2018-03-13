package com.dgit.ex02;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.MemberVO;
import com.dgit.persistence.MemberDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberTest {
	@Autowired
	private MemberDao dao;
	
	//@Test
	public void insertTest() throws Exception{		
		MemberVO vo=new MemberVO();
		vo.setUserid("zzz");
		vo.setUsername("재지");
		vo.setUserpw("321");
		vo.setEmail("aaa@naver.com");
		dao.insert(vo);
	}
	
	//@Test
	public void listTest() throws Exception{
		dao.list();
	}
	
	//@Test
	public void updateTest() throws Exception{
		MemberVO vo=new MemberVO();
		vo.setUserid("zzz");
		vo.setUsername("장보고");
		vo.setUserpw("aaaa");
		vo.setEmail("zzz@daum.net");
		dao.update(vo);
	}
	
	@Test
	public void deleteTest() throws Exception{
		dao.delete("hhh");
		
	}

}
