package ezen.dev.spring.service.event;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartRequest;

import ezen.dev.spring.vo.Criteria_e;
import ezen.dev.spring.vo.EventVo;

public interface EventService {
	
	
	default EventVo getEvent(String e_idx) {
		return null;
	}
	
	
	//이벤트 목록
	default List<EventVo> getEventList(Criteria_e cri){
		return null;
	}
	
	
	//이벤트 관리자 등록
	default int eventWrite(EventVo eventVo, MultipartRequest uploadFile, HttpServletRequest request) {
		
		return 0;
	}

	//이벤트 상세보기
	default EventVo eventView(int e_idx) {
		return null;
	}

	//이벤트 수정
	default int modifyEvent(EventVo eventVo, MultipartRequest uploadFile, HttpServletRequest request) {
		return 0;
	}
	
	
	//이벤트 삭제
	default int deleteEvent(int e_idx) {
		return 0;
	}
	
	/* 게시물 총 갯수 */
    default int getTotal() {
    	return 0;
    }

}
