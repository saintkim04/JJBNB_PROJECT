package ezen.dev.spring.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.MemberVo;

@Service("join")
public class MemberJoinService implements MemberService {
	
	private MemberDao memberDao;
	
	@Autowired(required=false)//생성자를 통한 자동 의존 주입
	public MemberJoinService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public int join(MemberVo memberVo) {//요청에 대한 처리를 위해 MemberDao객체가 필요함
		return memberDao.join(memberVo);
	}
	
	//아이디 중복 체크
	@Override
	public int idChk(MemberVo memberVo) {
		int result = memberDao.idChk(memberVo);
		return result;
	}
	@Override
	public int nnameChk(MemberVo memberVo) {
		int result = memberDao.nnameChk(memberVo);
		return result;
	}
	
}
