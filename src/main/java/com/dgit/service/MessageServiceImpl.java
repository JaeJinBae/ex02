package com.dgit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.MessageVO;
import com.dgit.persistence.MessageDao;
import com.dgit.persistence.PointDao;

@Service
public class MessageServiceImpl implements MessageService {

	
	@Autowired
	private MessageDao messageDao;

	@Autowired
	private PointDao pointDao;

	@Override
	@Transactional
	public void addMessage(MessageVO vo) throws Exception {
		messageDao.create(vo);

		pointDao.updatePoint(vo.getSender(), 10);
	}

	@Override
	@Transactional
	public MessageVO readMessage(String uid, int mno) throws Exception {
		messageDao.updateState(mno);// 읽은 시간 업데이트
		MessageVO vo = messageDao.readMessage(mno);
		pointDao.updatePoint(uid, 5);
		return vo;
	}

}
