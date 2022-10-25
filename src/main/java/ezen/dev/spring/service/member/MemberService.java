package ezen.dev.spring.service.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ReservationVo;

public interface MemberService {
	
	//디폴트 메소드와 정적 메소드는 JDK8부터 적용 가능
	//강제성이 없음
	default int join(MemberVo memberVo) {
		return 0;
	}

	default MemberVo login(MemberVo memberVo) {
		return null;
	}
	
	default MemberVo pwChk(MemberVo memberVo) {
		return null;
	}

	default MemberVo getMember(String m_id) {
		return null;
	}

	default int updateNname(MemberVo memberVo) {
		return 0;
	}
	
	default int updateEmail(MemberVo memberVo) {
		return 0;
	}
	
	default int updateTell(MemberVo memberVo) {
		return 0;
	}
	
	default int updatePw(MemberVo memberVo) {
		return 0;
	}

	default List<MemberVo> getMemberList(){
		return null;
	}
	
	default int updateGrade(HashMap<String, Integer> map) {
		return 0;
	}

	default int deleteMember(List<Integer> idx_list) {
		return 0;
	}

	default List<MemberVo> getUpdateList(){
		return null;
	}

	default List<MemberVo> getDeleteList(){
		return null;
	}
	
	default int idChk(MemberVo memberVo) {
		return 0;
	}
	default int nnameChk(MemberVo memberVo) {
		return 0;
	}

	default int pwfind_process(MemberVo memberVo) {
		return 0;
	}
	
	default List<ReservationVo> reservation_list(int m_idx){
		return null;
	}
}
