package ezen.dev.spring.service.member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.MemberVo;

@Service("m_update")
public class MemberUpdateService implements MemberService {

	private MemberDao memberDao;
	
	@Autowired(required=false)//생성자를 통한 자동 의존 주입
	public MemberUpdateService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Override
	public MemberVo pwChk(MemberVo memberVo) {
		return memberDao.pwChk(memberVo);
	}
	
	@Override
	public MemberVo getMember(String m_id) {
		return memberDao.getMember(m_id);
	}

	@Override
	public int updateNname(MemberVo memberVo) {
		return memberDao.updateNname(memberVo);
	}
	
	@Override
	public int updateEmail(MemberVo memberVo) {
		return memberDao.updateEmail(memberVo);
	}
	
	@Override
	public int updateTell(MemberVo memberVo) {
		return memberDao.updateTell(memberVo);
	}
	
	@Override
	public int updatePw(MemberVo memberVo) {
		return memberDao.updatePw(memberVo);
	}
	
	@Override
	public int updateGrade(HashMap<String, Integer> map) {
		return memberDao.updateGrade(map);
	}
	
}
