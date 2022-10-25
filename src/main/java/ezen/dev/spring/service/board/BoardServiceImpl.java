package ezen.dev.spring.service.board;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import ezen.dev.spring.dao.BoardDao;
import ezen.dev.spring.model.Criteria;
import ezen.dev.spring.vo.BoardVo;
import ezen.dev.spring.vo.Criteria_re;
import ezen.dev.spring.vo.ReservationVo;
import ezen.dev.spring.vo.ReviewVo;

@Service("b_list")
public class BoardServiceImpl implements BoardService{

	private BoardDao boardDao;
	
	@Autowired(required=false)
	public BoardServiceImpl(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@Override
	public List<BoardVo> getBoardList() {
		
		return boardDao.getBoardList();
	}

	@Override
	public BoardVo read(int board_idx) {
		return boardDao.read(board_idx);
	}
	

	
	
	@Override
	public int board_insert(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest request) {
		List<MultipartFile> fileList = uploadFile.getFiles("uploadFile");
		String upload_dir = "resources/upload";
		String realPath = request.getServletContext().getRealPath(upload_dir);
		//request.getServletContext() : Servlet3.0부터 지원
		System.out.println("STS의 실제 저장경로: "+realPath);
		
		for(int i=0; i<fileList.size(); i++) {
			String origin_filename = fileList.get(i).getOriginalFilename();
			
			int dot_idx = origin_filename.lastIndexOf(".");
			String fileName1 = origin_filename.substring(0, dot_idx);
			String extension = origin_filename.substring(dot_idx+1);
			String fileName2 = fileName1 
					+ new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
			String system_filename = fileName2+"."+extension;
			
			String fullPath1 = realPath+"/"+origin_filename;
			String fullPath2 = realPath+"/"+system_filename;
			
			try {
				
				//업로드된 파일을 새롭게 만들어진 경로에 저장함
				fileList.get(i).transferTo(new File(fullPath1));
				fileList.get(i).transferTo(new File(fullPath2));
				
				//썸네일 생성
				
				File originFile = new File(fullPath1);
				File thumbnail = new File(realPath, "s_"+origin_filename);
				BufferedImage image1 = ImageIO.read(originFile);
				BufferedImage image2 = new BufferedImage(500, 500, BufferedImage.TYPE_3BYTE_BGR);
				Graphics2D graphic = image2.createGraphics();
				graphic.drawImage(image1, 0, 0, 500, 500, null);
				ImageIO.write(image2, "jpg", thumbnail);
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			switch(i) {
			case 0:
				boardVo.setOrigin_filename1(origin_filename);
				boardVo.setSystem_filename1(system_filename);
				break;
			case 1:
				boardVo.setOrigin_filename2(origin_filename);
				boardVo.setSystem_filename2(system_filename);
				break;
			case 2:
				boardVo.setOrigin_filename3(origin_filename);
				boardVo.setSystem_filename3(system_filename);
				break;
			case 3:
				boardVo.setOrigin_filename4(origin_filename);
				boardVo.setSystem_filename4(system_filename);
				break;
			case 4:
				boardVo.setOrigin_filename5(origin_filename);
				boardVo.setSystem_filename5(system_filename);
				break;
			case 5:
				boardVo.setOrigin_filename6(origin_filename);
				boardVo.setSystem_filename6(system_filename);
				break;
			case 6:
				boardVo.setOrigin_filename7(origin_filename);
				boardVo.setSystem_filename7(system_filename);
				break;
			case 7:
				boardVo.setOrigin_filename8(origin_filename);
				boardVo.setSystem_filename8(system_filename);
				break;
			case 8:
				boardVo.setOrigin_filename9(origin_filename);
				boardVo.setSystem_filename9(system_filename);
				break;
			case 9:
				boardVo.setOrigin_filename10(origin_filename);
				boardVo.setSystem_filename10(system_filename);
				break;
			}
		
		}
		return boardDao.board_insert(boardVo);
	}

	public int update(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest request) {
		List<MultipartFile> fileList = uploadFile.getFiles("uploadFile");
		String upload_dir = "resources/upload";
		String realPath = request.getServletContext().getRealPath(upload_dir);
		//request.getServletContext() : Servlet3.0부터 지원
		System.out.println("STS의 실제 저장경로: "+realPath);
		
		for(int i=0; i<fileList.size(); i++) {
			String origin_filename = fileList.get(i).getOriginalFilename();
			
			int dot_idx = origin_filename.lastIndexOf(".");
			String fileName1 = origin_filename.substring(0, dot_idx);
			String extension = origin_filename.substring(dot_idx+1);
			String fileName2 = fileName1 
					+ new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
			String system_filename = fileName2+"."+extension;
			
			String fullPath1 = realPath+"/"+origin_filename;
			String fullPath2 = realPath+"/"+system_filename;
			
			try {
				
				System.out.println("fullPath1"+fullPath1);
				System.out.println("fullPath2"+fullPath2);
				//업로드된 파일을 새롭게 만들어진 경로에 저장함
				fileList.get(i).transferTo(new File(fullPath1));
				fileList.get(i).transferTo(new File(fullPath2));
				
				//썸네일 생성
				File originFile = new File(fullPath1);
				File thumbnail = new File(realPath, "s_"+origin_filename);
				BufferedImage image1 = ImageIO.read(originFile);
				BufferedImage image2 = new BufferedImage(500, 500, BufferedImage.TYPE_3BYTE_BGR);
				Graphics2D graphic = image2.createGraphics();
				graphic.drawImage(image1, 0, 0, 500, 500, null);
				ImageIO.write(image2, "png", thumbnail);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			switch(i) {
			case 0:
				boardVo.setOrigin_filename1(origin_filename);
				boardVo.setSystem_filename1(system_filename);
				break;
			case 1:
				boardVo.setOrigin_filename2(origin_filename);
				boardVo.setSystem_filename2(system_filename);
				break;
			case 2:
				boardVo.setOrigin_filename3(origin_filename);
				boardVo.setSystem_filename3(system_filename);
				break;
			case 3:
				boardVo.setOrigin_filename4(origin_filename);
				boardVo.setSystem_filename4(system_filename);
				break;
			case 4:
				boardVo.setOrigin_filename5(origin_filename);
				boardVo.setSystem_filename5(system_filename);
				break;
			case 5:
				boardVo.setOrigin_filename6(origin_filename);
				boardVo.setSystem_filename6(system_filename);
				break;
			case 6:
				boardVo.setOrigin_filename7(origin_filename);
				boardVo.setSystem_filename7(system_filename);
				break;
			case 7:
				boardVo.setOrigin_filename8(origin_filename);
				boardVo.setSystem_filename8(system_filename);
				break;
			case 8:
				boardVo.setOrigin_filename9(origin_filename);
				boardVo.setSystem_filename9(system_filename);
				break;
			case 9:
				boardVo.setOrigin_filename10(origin_filename);
				boardVo.setSystem_filename10(system_filename);
				break;
			}
		
		}
		return boardDao.update(boardVo);
	}
		
	
	public int delete(int board_idx) {
		return boardDao.delete(board_idx);
	}
	

    /* 게시판 목록(페이징 적용) */
    @Override
    public List<BoardVo> getBoardListPaging(Criteria cri) {
        
        return boardDao.getBoardListPaging(cri);
    }  
    
    /* 게시물 총 갯수 */
    @Override
    public int getTotal(Criteria cri) {
        
        return boardDao.getTotal(cri);
    }    
    
    
    /*리뷰 토탈*/
    @Override
    public int getReTotal(int board_idx) {
        return boardDao.getReTotal(board_idx);
    } 
	
	/*리뷰 리스트*/
	@Override
	public List<ReviewVo> getReviewList(int board_idx, Criteria_re cri) {
		return boardDao.getReviewList(board_idx, cri);
	}
	
	/*리뷰 등록 프로세스*/
	@Override
	public int insertReview(ReviewVo reviewVo) {
		return boardDao.insertReview(reviewVo);
	}
	
	/*리뷰 삭제 프로세스*/
	@Override
	public int deleteReview(int re_idx, int board_idx) {
		return boardDao.deleteReview(re_idx, board_idx);
	}
    
	
	@Override
    public int reservation_insert(ReservationVo reservationVo) {
    	return boardDao.reservation_insert(reservationVo);
    }

    @Override
    public ReservationVo reservation_select(ReservationVo reservationVo) {
    	return boardDao.reservation_select(reservationVo);
    }
    
    @Override
    public int reservation_delete(int r_idx) {
		return boardDao.reservation_delete(r_idx);
	}
    
    @Override
    public ReservationVo pay_read(int r_idx) {
    	return boardDao.pay_read(r_idx);
    }
    
    @Override
    public List<ReservationVo> reservationAll_select(int board_idx){
       return boardDao.reservationAll_select(board_idx);
    }
	
    @Override
    public int selectReservation(ReviewVo reviewVo) {
    	return boardDao.selectReservation(reviewVo);
    }
    
    @Override
    public List<ReviewVo> getReviewGrade(int board_idx){
    	return boardDao.getReviewGrade(board_idx);
    }

    @Override
    public int updateReview_grade(BoardVo boardVo) {
    	return boardDao.updateReview_grade(boardVo);
    }
}
