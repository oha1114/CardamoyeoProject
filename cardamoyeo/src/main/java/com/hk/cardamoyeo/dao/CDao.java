package com.hk.cardamoyeo.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.hk.cardamoyeo.dto.FDto;
import com.hk.cardamoyeo.dto.LDto;
import com.hk.cardamoyeo.dto.LoginDto;
import com.hk.cardamoyeo.dto.MDto;
import com.hk.cardamoyeo.dto.PDto;
import com.hk.cardamoyeo.dto.RDto;
import com.hk.cardamoyeo.dto.ReviewDto;
import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.dto.UserDto;

public interface CDao {
	public Integer sListCount();
	public Integer srListCount();
	public ArrayList<SDto> list(int page, int limit,String user_id);
	public List<LoginDto> oinfoDao(String user_id);
	public void oupdateInfo(UserDto dto);
//	public int write(String user_id, String store_name, String store_space, String store_address, String store_latitude,String store_longitude , String store_content, String store_phone,
//			String store_bank, String store_account, String store_time_open, String store_time_close);
	public int write(SDto dto);
	public boolean fileInsert(FDto dto);
	public void writeMenu(MDto dto);
	public List<FDto> writeView(String strSEQ);
	public List<FDto> reviewView(String strSEQ);
	public void modify(String store_seq, String store_name, String store_space, String store_address,String store_content, String store_phone,
			String store_time_open, String store_time_close);
	public boolean fileUpdate(FDto fDto);
	public void menuUpdate(MDto mdto);
	public void delete(String store_seq);
	public void reviewWrite(ReviewDto dto);
	public void rvDel(String store_seq, String review_seq);
	public List<FDto> resView(String strSEQ);
	public int resInsert(PDto dto);
	public List<FDto> resCon(String res_seq, String user_id);
	public List<FDto> resDon(String res_seq);
	public List<FDto> resList(String res_seq);
	public List<FDto> payList(String res_seq);
	public void resUpdate(String res_seq, Timestamp pay_date, String res_success);
	public List<FDto> srlist(int page, int limit,String user_id);
	public List<RDto> reviewIf(String store_seq, String user_id);
	public void likeOk(LDto dto);
	public void likeNo(String store_seq, String user_id);
	public List<LDto> likeIf(String store_seq, String user_id);
	public List<ReviewDto> totalS(String store_seq);
}
