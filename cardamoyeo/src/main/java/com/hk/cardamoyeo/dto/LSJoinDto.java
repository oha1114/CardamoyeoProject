package com.hk.cardamoyeo.dto;

import java.io.Serializable;

public class LSJoinDto{
	private LDto LDto;
	private SDto SDto;
	
	public LDto getLDto() {
		return LDto;
	}
	public void setLDto(LDto LDto) {
		this.LDto = LDto;
	}
	
	public SDto getSDto() {
		return SDto;
	}
	public void setSDto(SDto SDto) {
		this.SDto = SDto;
	}
}
