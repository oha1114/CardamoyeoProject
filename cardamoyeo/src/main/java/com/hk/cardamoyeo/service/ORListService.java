package com.hk.cardamoyeo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.cardamoyeo.dao.OReplyDao;
import com.hk.cardamoyeo.dto.OReplyDto;

@Service
public class ORListService implements ORService{
	@Autowired
	private OReplyDao dao;

	@Override
	public List<OReplyDto> readOReply(int seq) throws Exception {
		return dao.readOReply(seq);
	}

	@Override
	public boolean writeOReply(OReplyDto dto) throws Exception {
		return dao.writeOReply(dto);
	}

	@Override
	public boolean deleteOReply(OReplyDto dto) throws Exception {
		return dao.deleteOReply(dto);
	}
}
