package com.dgit.persistence;

import com.dgit.domain.MessageVO;

public interface MessageDao {
	public void create(MessageVO vo) throws Exception;
	public MessageVO readMessage(int mno) throws Exception;
	public void updateState(int mno) throws Exception;
}
