package com.hk.cardamoyeo.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hk.cardamoyeo.Paging;
import com.hk.cardamoyeo.dto.LoginDto;
import com.hk.cardamoyeo.dto.NoticeDto;
import com.hk.cardamoyeo.dto.OQnaDto;
import com.hk.cardamoyeo.dto.OReplyDto;
import com.hk.cardamoyeo.dto.QnaDto;
import com.hk.cardamoyeo.dto.ReplyDto;
import com.hk.cardamoyeo.service.NService;
import com.hk.cardamoyeo.service.OQService;
import com.hk.cardamoyeo.service.ORService;
import com.hk.cardamoyeo.service.QService;
import com.hk.cardamoyeo.service.RService;

@Controller
public class NController {

	@Autowired
	private NService nService;
	
	@Autowired
	private QService qService;
	
	@Autowired
	private RService rService;
	
	@Autowired
	private OQService oqService;
	
	@Autowired
	private ORService orService;
	
	//처음 페이지를 정말 보여주는 메서드
	@RequestMapping("/notice_list")
	public String notice_write(Model model, String pNum) {
		if(pNum == null) {
			pNum = "1";
		}
		int pcount=nService.getCount();
		
		List<NoticeDto> list= nService.getAllList(pNum, pcount);
		model.addAttribute("list", list);
		Map<String, Integer> map = Paging.pagingValue(pcount, pNum, 5);
		model.addAttribute("pMap", map);
		
		
		model.addAttribute("pcount", pcount);
		System.out.println(pcount + "count 나오나");
		
		return "notice_list";
	}	
	
	//글을 작성하는 폼으로 이동하는 메서드
	@RequestMapping("/notice_write")
	public String notice_write() {
		return "notice_write";
	}
	

	//글을 데이터베이스에 추가하는 메서드
	@RequestMapping("/notice_view")
	public String notice_view(NoticeDto dto,Model model) {
		System.out.println(dto);
		//글을 추가하는 작업을 service에 요청하는 코드 작성
		boolean isS=nService.boardWrite(dto);
		if(isS) {
			return "redirect:notice_list";			
		}else {
			return "redirect:error";
		}
	}
	
	@RequestMapping("/notice_detail")
	public String notice_detail(NoticeDto dto, Model model) {
		System.out.println("seq값:"+dto.getBoard_seq());
		//공지게시판에서 선택한 글에 상세정보를 얻어온다.
		NoticeDto nDto=nService.getNBoard(dto.getBoard_seq());
		
		//조회수 증가
		nService.readCount(dto.getBoard_seq());
		System.out.println(dto.getBoard_seq() + "조회수 올라감 쿠키 제한 고민");
		
		model.addAttribute("dto", nDto);
		return "notice_view";
	}
	
	@RequestMapping("/error")
	public String error() {
		return "error";
	}

	//수정하는 폼으로 이동하는 메서드
	@RequestMapping("/notice_modify")
	public String notice_modify(NoticeDto dto, Model model) {
		NoticeDto mDto = nService.getMBoard(dto.getBoard_seq());
		model.addAttribute("dto", mDto);
		return "notice_modify";
	}
	
	//글을 수정하는 메서드
	@RequestMapping("/notice_modify2")
	public String notice_modify2(NoticeDto dto, Model model) {
		System.out.println(dto + "수정되나?");
		boolean isS = nService.boardModify(dto);
		if(isS) {
			return "redirect:notice_detail?board_seq="+dto.getBoard_seq();			
		}else {
			model.addAttribute("msg", "글 수정 실패");
			return "redirect:error"; //redirect:error
		}
	}
	
	//글을 삭제하는 메서드
	@RequestMapping("/notice_delete")
	public String delete(int seq, Locale locale, Model model) {
		System.out.println(seq + "삭제되나?");
		boolean isS = nService.boardDelete(seq);
		if(isS) {
			return "redirect:notice_list";
		} else {
			model.addAttribute("msg", "글 삭제 실패");
			return "error";
		}
	}
		
	//사용자 QnAlist 처음 페이지를 정말 보여주는 메서드
	@RequestMapping("/qna_list")
	public String qna_list(Model model, String pNum) {
		System.out.println("qna리스트");
		if(pNum == null) {
			pNum = "1";
		}
		int pcount = qService.getCount();
		List<QnaDto> list= qService.getAllList(pNum, pcount);
		model.addAttribute("list", list);
		System.out.println(list.size() + "길이");
		Map<String, Integer> map = Paging.pagingValue(pcount, pNum, 5);
		model.addAttribute("pMap", map);
		
		model.addAttribute("pcount", pcount);
		System.out.println(pcount + "count 나오나");
		
		return "qna_list";
	}	
	
	//QNA 작성하는 폼으로 이동하는 메서드
	@RequestMapping("/qna_write")
	public String qna_write() {
		return "qna_write";
	}
	
	//사용자 QnA 글을 데이터베이스에 추가하는 메서드
	@RequestMapping("/qna_view")
	public String qna_view(QnaDto dto,Model model) {
		System.out.println(dto + "보자");
		if(dto.getBoard_secret()==null) {
			dto.setBoard_secret("off");
		}
		//글을 추가하는 작업을 service에 요청하는 코드 작성
		boolean isS=qService.QuWrite(dto);
		if(isS) {
			return "redirect:qna_list";			
		}else {
			return "redirect:error";
		}
	}
	
	@RequestMapping("/qna_detail")
	public String qna_detail(QnaDto dto, Model model, ReplyDto rdto) throws Exception {
		System.out.println("seq값:"+dto.getBoard_seq());
		
		//Q&A게시판에서 선택한 글에 상세정보를 얻어온다.
		QnaDto qDto=qService.getUBoard(dto);
		if(qDto == null) {
			return "redirect:qna_pass?board_seq=" + dto.getBoard_seq() + "&msg=error";
		}					
		model.addAttribute("dto", qDto);
		
		//댓글 리스트
		List<ReplyDto> replyList= rService.readReply(rdto.getBoard_seq());
		model.addAttribute("replyList", replyList);
		
		return "qna_view";
	}
	
	//수정하는 폼으로 이동하는 메서드
	@RequestMapping("/qna_modify")
	public String qna_modify(QnaDto dto, Model model) {
		QnaDto mDto = qService.getUMBoard(dto.getBoard_seq());
		model.addAttribute("dto", mDto);
		return "qna_modify";
	}
	
	//글을 수정하는 메서드
	@RequestMapping("/qna_modify2")
	public String qna_modify2(QnaDto dto, Model model) {
		System.out.println(dto + "수정되나?");
		if(dto.getBoard_secret()==null) {
			dto.setBoard_secret("off");
		}
		boolean isS = qService.QUModify(dto);
		if(isS) {
			return "redirect:qna_list";
			//return "redirect:qna_detail?board_seq="+dto.getBoard_seq();
		}else {
			model.addAttribute("msg2", "글 수정 실패");
			return "redirect:error"; //redirect:error
		}
	}
	
	//글을 삭제하는 메서드
	@RequestMapping("/qna_delete")
	public String qna_delete(int seq, Locale locale, Model model) {
		System.out.println(seq + "삭제되나?");
		boolean isS = qService.QUDelete(seq);
		if(isS) {
			return "redirect:qna_list";
		} else {
			model.addAttribute("msg", "글 삭제 실패");
			return "error";
		}
	}
	
	//비밀번호 입력
	@RequestMapping("/qna_pass")
	public String qna_pass(String msg, Model model,Authentication authentication,String board_seq) {
		LoginDto dto=(LoginDto) authentication.getPrincipal();
		String role=dto.getUser_role();
		if(role.equals("M")) {
			return "redirect:qna_detail?board_seq="+board_seq;
		}else {
			if(msg != null) {
				model.addAttribute("msg", "비밀번호를 다시 입력해주세요");
			}	
			return "qna_pass";
		}
		
		
		
	}	

	//댓글 작성
	@RequestMapping("/replyWrite")
	public String replyWrite(ReplyDto dto, Model model) throws Exception {
		System.out.println(dto+"댓글 작성");
		//글을 추가하는 작업을 service에 요청하는 코드 작성
		boolean isS=rService.writeReply(dto);
		if(isS) {
			return "redirect:qna_list";			
		}else {
			return "redirect:error";
		}
	}
	
	//댓글 삭제
	@RequestMapping("/replyDeleteView")
	public String replyDeleteView(ReplyDto dto, Locale locale, Model model) throws Exception {
		System.out.println(dto + "삭제되나?");
		boolean isS = rService.deleteReply(dto);
		if(isS) {
			return "redirect:qna_list";
		} else {
			model.addAttribute("msg", "글 삭제 실패");
			return "error";
		}
	}

	//업체 QnAlist 처음 페이지를 정말 보여주는 메서드
	@RequestMapping("/qna_list_owner")
	public String qna_list_owner(Model model, String pNum) {
		if(pNum == null) {
			pNum = "1";
		}
		int pcount = oqService.getCount();
		
		System.out.println("qna리스트");
		List<OQnaDto> list= oqService.getAllList(pNum, pcount);
		System.out.println(list.size() + "길이");
		model.addAttribute("list", list);
		Map<String, Integer> map = Paging.pagingValue(pcount, pNum, 5);
		model.addAttribute("pMap", map);
		
		model.addAttribute("pcount", pcount);
		System.out.println(pcount + "count 나오나");
		
		return "qna_list_owner";
	}

	//업체 Q&A 작성 폼으로 이동
	@RequestMapping("/qna_write_owner")
	public String qna_write_owner() {
		return "qna_write_owner";
	}
	
	
	//업체 QnA 글을 데이터베이스에 추가하는 메서드
	@RequestMapping("/qna_view_owner")
	public String qna_view_owner(OQnaDto dto,Model model) {
		System.out.println(dto + "보자");
		if(dto.getBoard_secret()==null) {
			dto.setBoard_secret("off");
		}
		//글을 추가하는 작업을 service에 요청하는 코드 작성
		boolean isS=oqService.OQuWrite(dto);
		if(isS) {
			return "redirect:qna_list_owner";			
		}else {
			return "redirect:error";
		}
	}
	
	
	@RequestMapping("/qna_detail_owner")
	public String qna_detail_owner(OQnaDto dto, Model model, OReplyDto rdto) throws Exception {
		System.out.println("seqfffff값:"+dto.getBoard_seq());
			
		//Q&A게시판에서 선택한 글에 상세정보를 얻어온다.
		OQnaDto oqDto=oqService.getOUBoard(dto);
		if(oqDto == null) {
			return "redirect:qna_pass_owner?board_seq=" + dto.getBoard_seq() + "&msg=error";
		}					
		model.addAttribute("dto", oqDto);
			System.out.println("rrr"+rdto.getBoard_seq());
		//댓글 리스트
		List<OReplyDto> oreplyList= orService.readOReply(rdto.getBoard_seq());
		model.addAttribute("oreplyList", oreplyList);
		System.out.println("댓글 Q&A 왜 안나오냐");
			
		return "qna_view_owner";
	}	
	
	//수정하는 폼으로 이동하는 메서드
	@RequestMapping("/qna_modify_owner")
	public String qna_modify_owner(OQnaDto dto, Model model) {
		OQnaDto mDto = oqService.getOUMBoard(dto.getBoard_seq());
		model.addAttribute("dto", mDto);
		return "qna_modify_owner";
	}
		
	//글을 수정하는 메서드
	@RequestMapping("/qna_modify2_owner")
	public String qna_modify2_owner(OQnaDto dto, Model model) {
		System.out.println(dto + "수정되나?");
		if(dto.getBoard_secret()==null) {
			dto.setBoard_secret("off");
		}
		boolean isS = oqService.OQUModify(dto);
		if(isS) {
			System.out.println("여기에 나와라1");
			return "redirect:qna_list_owner";
			//return "redirect:qna_detail?board_seq="+dto.getBoard_seq();
		}else {
			model.addAttribute("msg2", "글 수정 실패");
			return "redirect:error"; //redirect:error
		}
	}	
		
	//글을 삭제하는 메서드
	@RequestMapping("/qna_delete_owner")
	public String qna_delete_owner(int seq, Locale locale, Model model) {
		System.out.println(seq + "삭제되나?");
		boolean isS = oqService.OQUDelete(seq);
		if(isS) {
			System.out.println("여기에 나와라2");
			return "redirect:qna_list_owner";
		} else {
			model.addAttribute("msg", "글 삭제 실패");
			return "error";
		}
	}
	
	//비밀번호 입력
	@RequestMapping("/qna_pass_owner")
	public String qna_pass_owner(String msg, Model model,Authentication authentication,String board_seq) {
//		qna_detail_owner
		LoginDto dto=(LoginDto) authentication.getPrincipal();
		String role=dto.getUser_role();
		if(role.equals("M")) {
			return "redirect:qna_detail_owner?board_seq="+board_seq;
		}else {
			if(msg != null) {
				model.addAttribute("msg", "비밀번호를 다시 입력해주세요");
				System.out.println("비번 틀렸다");
			}	
			return "qna_pass_owner";
		}
		
	}	
			
	//업체 댓글 작성
	@RequestMapping("/replyWrite_owner")
	public String replyWrite_owner(OReplyDto dto, Model model) throws Exception {
		System.out.println(dto+"댓글 작성");
		//글을 추가하는 작업을 service에 요청하는 코드 작성
		boolean isS=orService.writeOReply(dto);
		if(isS) {
			return "redirect:qna_list_owner";			
		}else {
			return "redirect:error";
		}
	}
	
	//댓글 삭제
	@RequestMapping("/replyDeleteView_owner")
	public String replyDeleteView_owner(OReplyDto dto, Locale locale, Model model) throws Exception {
		System.out.println(dto + "삭제되나?");
		boolean isS = orService.deleteOReply(dto);
		if(isS) {
			return "redirect:qna_list_owner";
		} else {
			model.addAttribute("msg", "글 삭제 실패");
			return "error";
		}
	}	
	
	//사용자 또는 업체 Q&A 이동 페이지
	@RequestMapping("/qna_go")
	public String qna_go() {
		return "qna_go";
	}
	
	//ajax는 안쓰지 않을까
	/*
	 * @RequestMapping("ajax") public String ajax() { return "qna_go"; }
	 */
	
}
