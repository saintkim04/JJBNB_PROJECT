package ezen.dev.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ReservationVo;

@Repository//DAO클래스에 대한 표시, 스프링 컨테이너가 컴포넌트 스캔으로 빈 등록시 
//MemberDao클래스를 빈으로 등록시켜줌
public class MemberDao {
	private SqlSession sqlSession;
	
	private final String MAPPER = "ezen.dev.spring.member";
	
	@Autowired(required=false)//생성자를 통한 자동 의존주입
	//SqlSession은 root-context.xml에 빈(SqlSessionTemplate)으로 등록되어져 있음
	public MemberDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int join(MemberVo memberVo) {//DB와 관련된 작업을 위해 MyBatis 프레임워크의
		//SqlSession객체가 필요함. SqlSession객체를 얻으면 그것을 가지고 해당 Mapper 파일에 접근해서
		//SQL문을 처리하도록 요청하면 됨. 해당 Mapper파일을 찾는 것은 Mapper가 가지고 있는 네임스페이스와
		//Mapper 내에 정의된 DML작업 태그가 가지고 있는 id 속성값을 이용해서 찾음. 전달값이 있으면
		//두번째 매개변수(memberVo)로 정의해줌.
		
		return sqlSession.insert(MAPPER+".join", memberVo);
		//SqlSession객체의 insert, update, delete 메소드는 SQL문의 실행 결과로 처리된 행의 수를 반환함
	}

	public MemberVo login(MemberVo memberVo) {
		return sqlSession.selectOne(MAPPER+".login", memberVo);
	}
	
	public int pwfind_process(MemberVo memberVo) {
		int result= sqlSession.selectOne(MAPPER+".pwfind_process", memberVo);
		return result;
	}
	
	public MemberVo pwChk(MemberVo memberVo) {
		return sqlSession.selectOne(MAPPER+".pwChk", memberVo);
		
	}

	public MemberVo getMember(String m_id) {
		return sqlSession.selectOne(MAPPER+".getMember", m_id);
	}

	public int updateNname(MemberVo memberVo) {
		return sqlSession.update(MAPPER+".updateNname", memberVo);
	}
	
	public int updateEmail(MemberVo memberVo) {
		return sqlSession.update(MAPPER+".updateEmail", memberVo);
	}
	
	public int updateTell(MemberVo memberVo) {
		return sqlSession.update(MAPPER+".updateTell", memberVo);
	}
	
	public int updatePw(MemberVo memberVo) {
		return sqlSession.update(MAPPER+".updatePw", memberVo);
	}

	public List<MemberVo> getMemberList() {
		return sqlSession.selectList(MAPPER+".getMemberList");
	}
	
	public int updateGrade(HashMap<String, Integer> map) {
		return sqlSession.update(MAPPER+".updateGrade", map);
	}


	public int deleteMember(List<Integer> idxList) {
		return sqlSession.delete(MAPPER+".deleteMember", idxList);
	}


	public List<MemberVo> getUpdateList() {
		return sqlSession.selectList(MAPPER+".getUpdateList");
	}


	public List<MemberVo> getDeleteList() {
		return sqlSession.selectList(MAPPER+".getDeleteList");
	}
	
	public int idChk(MemberVo memberVo) {
		int result= sqlSession.selectOne(MAPPER+".idChk", memberVo);
		return result;
	}
	public int nnameChk(MemberVo memberVo) {
		int result=sqlSession.selectOne(MAPPER+".nnameChk",memberVo);
		return result;
	}
	
	public List<ReservationVo> reservation_list(int m_idx){
		return sqlSession.selectList(MAPPER+".reservation_list",m_idx);
	}

}

/*
create table member_tbl(
member_idx int unsigned not null primary key AUTO_INCREMENT, 
member_id varchar(50) not null unique,
member_pw varchar(20) not null,
member_name varchar(30) not null,
member_handphone varchar(20),
member_gender char(2),
member_grade tinyint(1) default 0,
reg_date datetime default now(),
del_yn char(2) default 'N'
);
*/


