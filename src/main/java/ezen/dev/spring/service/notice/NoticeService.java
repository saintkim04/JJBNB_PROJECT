package ezen.dev.spring.service.notice;

import java.util.List;

import ezen.dev.spring.vo.Criteria;
import ezen.dev.spring.vo.NoticeVo;

public interface NoticeService {

	
	

	//공지사항 목록
	default List<NoticeVo> getNoticeList(Criteria cri){
		return null;
	}
		
	
		
	//공지사항 등록
	default int writeNotice(NoticeVo noticeVo) {
		return 0;
	}
	
	//공지사항 인덱스 가져오기
	default NoticeVo getNotice(String n_idx) {
		return null;
	}
	

	//공지사항 수정
	default int modifyNotice(NoticeVo noticeVo) {
		return 0;
	}


	//공지사항 삭제
	default int deleteNotice(int n_idx) {
		return 0;
	}
	
	/* 게시물 총 갯수 */
    default int getTotal() {
    	return 0;
    }
	
	
	
}
