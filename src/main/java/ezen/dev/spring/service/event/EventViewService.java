package ezen.dev.spring.service.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.EventDao;
import ezen.dev.spring.vo.EventVo;

@Service("e_view")
public class EventViewService implements EventService {
	
	private EventDao eventDao;
	
	@Autowired(required=false)
	public EventViewService(EventDao eventDao) {
		this.eventDao = eventDao;
	}
	
	@Override
	public EventVo eventView(int e_idx) {
		
		return eventDao.eventView(e_idx);
		
	}

}
