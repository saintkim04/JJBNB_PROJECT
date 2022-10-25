package ezen.dev.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import ezen.dev.spring.service.admin.AdminService;
import ezen.dev.spring.service.member.MemberService;
import ezen.dev.spring.vo.FileVo;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.NoticeVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	MemberService listService, updateService, deleteService;
	AdminService fileService;
	
	@Autowired(required=false)
	public void setListService(@Qualifier("m_list") MemberService listService) {
		this.listService = listService;
	}
	
	@Autowired(required=false)
	public void setUpdateService(@Qualifier("m_update") MemberService updateService) {
		this.updateService = updateService;
	}
	
	
	@Autowired(required=false)
	public void setDeleteService(@Qualifier("m_delete") MemberService deleteService) {
		this.deleteService = deleteService;
	}
	
	@Autowired(required=false)
	public void setFileService(@Qualifier("file") AdminService fileService) {
		this.fileService = fileService;
	}
	
	
	//메인
	@GetMapping("/index.do")
	public String admin_index() {
		return "admin/index";
	}
	
	
	
	
		
//------------------- 회원목록 관련
		
		
	
		//회원목록 조회
		@GetMapping("/member_list.do")
		public String memberList(Model model) {
			List<MemberVo> memberList = listService.getMemberList();
			
			//System.out.println("memberList:"+memberList.get(0).getM_idx());
			model.addAttribute("memberList", memberList);
			
			return "admin/member/list";
		}
		
		
		
		
		
		//수정된 회원목록 조회
		@GetMapping("/member_edit_list.do")
		public String member_updateList(Model model) {
			
			List<MemberVo> updateList = listService.getUpdateList();
			//모델객체에 회원목록을 추가함
			model.addAttribute("updateList",updateList);
			
			
			return "admin/member/edit_list";
		}
				
				
				
		//삭제된 회원목록 조회
		@GetMapping("/member_del_list.do")
		public String member_deleteList(Model model) {
			
			List<MemberVo> deleteList = listService.getDeleteList();
			//모델객체에 회원목록을 추가함
			model.addAttribute("deleteList",deleteList);
			
			return "admin/member/del_list";
		}
		
		
		
		
		
				
		//회원등급 수정
		@PostMapping("/update_grade.do")
		@ResponseBody //요청에 대한 처리결과를 Ajax통신의 결과로 전달
		public String adminUpdateInfo(@RequestParam("m_idx") int m_idx,
				@RequestParam("m_grade") int m_grade) {
			
			//웹브라우저에서 전달받은 2개의 값을 MyBatis의 입력값으로 사용하기 위해 HashMap객체 생성해서 저장
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("m_idx", m_idx);
			map.put("m_grade", m_grade);
					
			String result="N";//정보수정 실패
			
			int flag = updateService.updateGrade(map);
			
			if(flag == 1) result = "Y";//정보수정 성공
			
			return result;
		} 
		
		
		//회원 삭제
		@PostMapping("/delete_member.do")
		@ResponseBody //요청에 대한 처리결과를 Ajax통신의 결과로 전달
		public String admin_del_member(@RequestParam("m_idx_arr[]") List<Integer> idx_list) {
			
			String result="N";//회원삭제 실패
			
			int flag = deleteService.deleteMember(idx_list);
			
			if(flag != 0) result = "Y";//회원삭제 성공
			
			return result;
		}
		
		
		
		
	
//-------------------- 숙소 관련
	
		
		
	
//------------------ 이벤트 관련
	
	
	
	
//-------------------- 공지사항 관련
		
	
		
//--------------------- 자주 묻는 질문 관련

			
			
//--------------------- 약관 정책 관련
		
	
		
//-------------------- 1:1 문의 관련
		

		
		
	
	
	
	/* Spring MVC에서 파일 업로드를 구현하기 위한 조치들
	 
	   1. pom.xml에 fileupload에 필요한 dependency 추가
	    <!-- https://mvnrepository.com/artifact/commons-fileupload/commons-fileupload -->
		<dependency>
		  <groupId>commons-fileupload</groupId>
		  <artifactId>commons-fileupload</artifactId>
		  <version>1.4</version>
		</dependency>
		
		2. MultipartResolver를 빈 객체로 등록
			(1) XML 기반 설정: servlet-context.xml
				<beans:bean id="multipartResolver" class="org.springframework.web.multipart.support.StandardServletMultipartResolver"></beans:bean>
			(2) Annotation 기반 설정: 설정 파일(예) MvcConfig.java
				@Bean
				public StandardServletMultipartResolver standardServletMultipartResolver(){
					return new StandardServletMultipartResolver();
				}
			
		3. web.xml에 <servlet>태그 내에 multipart-config 설정 정보 추가	
		 	<multipart-config>
			    <max-file-size>10485760</max-file-size> <!-- 파일 한 개의 최대 크기: 10MB -->
			    <max-request-size>52428800</max-request-size> <!-- 한 번에 여러 파일 올릴 때 총 크기: 50MB -->
			    <file-size-threshold>20971520</file-size-threshold> <!-- 넘으면 temp에 넣고 업로드에 들어가지 않는다 : 20mb -->
		  	</multipart-config>Spring MVC에서 파일 업로드를 구현하기 위한 조치들
	 	
	 	4. resources/upload 폴더 생성하기(이클립스에서는 가상의 경로이고, 실제 톰캣에서 프로그램 구동 시에는 실제 경로가 됨)
	 */
	
}



