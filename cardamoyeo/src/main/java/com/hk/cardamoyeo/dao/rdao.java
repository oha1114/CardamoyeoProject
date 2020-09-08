package com.hk.cardamoyeo.dao;

import java.util.List;

import com.hk.cardamoyeo.dto.ReplyDto;

public interface rdao {
	//댓글 조회
	public List<ReplyDto> readReply(int seq) throws Exception;
	//댓글 작성
	public boolean writeReply(ReplyDto dto) throws Exception;
	//댓글 수정
	//public boolean updateReply(ReplyDto dto) throws Exception;
	//댓글 삭제
	public boolean deleteReply(ReplyDto dto) throws Exception;
}
