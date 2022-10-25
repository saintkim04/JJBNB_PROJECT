package ezen.dev.spring.service.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.EventDao;

@Service("e_delete")
public class EventDeleteService implements EventService {

	private EventDao eventDao;
	
	@Autowired(required=false)
	public EventDeleteService(EventDao eventDao) {
		this.eventDao = eventDao;
	}
	
	
	@Override
	public int deleteEvent(int e_idx) {
		
		return eventDao.deleteEvent(e_idx);
	}
}
