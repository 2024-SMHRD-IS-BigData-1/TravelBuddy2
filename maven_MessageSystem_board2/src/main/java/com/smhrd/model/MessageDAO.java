package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class MessageDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int sendMessage(Message sendMessage) {
       	SqlSession session = sqlSessionFactory.openSession(true);
       	int cnt = session.insert("com.smhrd.db.MessageMapper.sendMessage",sendMessage);
       	session.close();
		return cnt;
	}
	
	
	public List<Message> messageList(String email) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Message> messageList = session.selectList("com.smhrd.db.MessageMapper.messageList",email);
		session.close();
		return messageList;
	}

}
