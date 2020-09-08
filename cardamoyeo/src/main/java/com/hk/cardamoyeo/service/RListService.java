package com.hk.cardamoyeo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.cardamoyeo.dao.ReplyDao;
import com.hk.cardamoyeo.dto.ReplyDto;
@Service
public class RListService implements RService{

	@Autowired
	private ReplyDao dao;

	@Override
	public List<ReplyDto> readReply(int seq) throws Exception {
		return dao.readReply(seq);
	}

	@Override
	public boolean writeReply(ReplyDto dto) throws Exception {
		return dao.writeReply(dto);
	}

	/*@Override
	public boolean updateReply(ReplyDto dto) throws Exception {
		return dao.updateReply(dto);
	}*/

	@Override
	public boolean deleteReply(ReplyDto dto) throws Exception {
		return dao.deleteReply(dto);
	}
	
}
