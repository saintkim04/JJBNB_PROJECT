package ezen.dev.spring.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.MemberDao;

@Service("m_delete")
public class MemberDeleteService implements MemberService {
	
	private MemberDao memberDao;
	
	@Autowired(required=false)
	public MemberDeleteService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public int deleteMember(List<Integer> idxList) {
		return memberDao.deleteMember(idxList);
	}

}
