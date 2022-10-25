package ezen.dev.spring.service.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.EventDao;
import ezen.dev.spring.vo.Criteria_e;
import ezen.dev.spring.vo.EventVo;

@Service("e_list")
public class EventListService implements EventService {

	private EventDao eventDao;
	
	@Autowired(required=false)
	public EventListService(EventDao eventDao) {
		this.eventDao = eventDao;
	}
	
	
	@Override
	public List<EventVo> getEventList(Criteria_e cri){
		
		return eventDao.getEventList(cri);
	}
	
	/* 게시물 총 갯수 */
    @Override
    public int getTotal() {
        
        return eventDao.getTotal();
    } 
}
