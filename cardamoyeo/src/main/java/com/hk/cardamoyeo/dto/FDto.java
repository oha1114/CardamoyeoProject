package com.hk.cardamoyeo.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class FDto implements Serializable{
	
	private int store_seq;
	private int store_image_seq;
	private String store_image;
	
	private SDto sdto;//parents
	private MDto mdto;//menu
	private ReviewDto rdto;//리뷰리스트
	private PDto pdto;//예약
	
	
	
	
	public PDto getPdto() {
		return pdto;
	}

	public void setPdto(PDto pdto) {
		this.pdto = pdto;
	}

	public ReviewDto getRdto() {
		return rdto;
	}

	public void setRdto(ReviewDto rdto) {
		this.rdto = rdto;
	}
	

	public MDto getMdto() {
		return mdto;
	}

	public void setMdto(MDto mdto) {
		this.mdto = mdto;
	}

	public FDto(int store_seq, int store_image_seq, String store_image, SDto sdto) {
		super();
		this.store_seq = store_seq;
		this.store_image_seq = store_image_seq;
		this.store_image = store_image;
		this.sdto=sdto;
	}
	
	public FDto() {	}
	
	public SDto getSdto() {
		return sdto;
	}


	public void setSdto(SDto sdto) {
		this.sdto = sdto;
	}
	
	
	public int getStore_seq() {
		return store_seq;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}
	public int getStore_image_seq() {
		return store_image_seq;
	}
	public void setStore_image_seq(int store_image_seq) {
		this.store_image_seq = store_image_seq;
	}
	public String getStore_image() {
		return store_image;
	}
	public void setStore_image(String store_image) {
		this.store_image = store_image;
	}

	@Override
	public String toString() {
		return "FDto [store_seq=" + store_seq + ", store_image_seq=" + store_image_seq + ", store_image=" + store_image
				+ ", sdto=" + sdto + "]";
	}
	
	

	
}
