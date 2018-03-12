package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ReplyVO;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	private static final String namespace="com.dgit.mappers.ReplyMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		return session.selectList(namespace+".list",bno);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		session.insert(namespace+".create",vo);

	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		session.update(namespace+".update",vo);

	}

	@Override
	public void delete(int rno) throws Exception {
		session.delete(namespace+".delete",rno);
	}

}
