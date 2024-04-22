package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class MemberDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	
	public int join(Member member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.db.Mapper.join",member);
		session.close();
		return cnt;
	}

	public Member login(Member member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Member loginMember = session.selectOne("com.smhrd.db.MemberMapper.login",member);
		session.close();
		return loginMember;
	}

	public int update(Member member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.smhrd.db.MemberMapper.update",member);
		session.close();
		return cnt;
	}
	
	public List<Member> memberList(){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Member> memberList = session.selectList("com.smhrd.db.MemberMapper.memberList");
		session.close();
		return memberList;
	}
	
	public Member IDcheck(String inputE) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Member member = (Member)session.selectOne("com.smhrd.db.MemberMapper.idCheck",inputE);
		session.close();
		return member;
	}

	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		return 0;
	}


	
}
