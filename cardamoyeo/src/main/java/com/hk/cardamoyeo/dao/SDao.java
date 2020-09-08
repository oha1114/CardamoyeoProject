package com.hk.cardamoyeo.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.FDto;
import com.hk.cardamoyeo.dto.LDto;
import com.hk.cardamoyeo.dto.LoginDto;
import com.hk.cardamoyeo.dto.MDto;
import com.hk.cardamoyeo.dto.PDto;
import com.hk.cardamoyeo.dto.PageUserIdDTO;
import com.hk.cardamoyeo.dto.RDto;
import com.hk.cardamoyeo.dto.ReviewDto;
import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.dto.UserDto;

@Repository
public class SDao implements CDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public SDao() {
	}
	
	
	@Override
	public Integer sListCount() {
		Integer result = sqlSession.selectOne("sListCount");
		return result;
	}
	
	@Override
	public Integer srListCount() {
		Integer result = sqlSession.selectOne("srListCount");
		return result;
	}
	
	//회원정보 조회
	@Override
	public List<LoginDto> oinfoDao(String user_id) {
		System.out.println("user_id 값 : " + user_id);
		List<LoginDto> result = sqlSession.selectList("oinfoDao",user_id);
		return result;
	}
	
	@Override
	public void oupdateInfo(UserDto dto) {
		sqlSession.update("oupdateInfo", dto);
	}
	

	@Override
	public ArrayList<SDto> list(int page, int limit,String user_id) {
		
		int startRow = (page -1) * limit +1;
		int endRow = startRow + limit -1;
		PageUserIdDTO dto = new PageUserIdDTO(startRow, endRow, user_id);

		ArrayList<SDto> result = (ArrayList) sqlSession.selectList("list",dto);
		System.out.println("result : " + result);
		return result;

	}


	@Override
	public int write(SDto dto) {
		
//		SDto dto1 = new SDto(user_id, store_name, store_space, store_address,store_latitude, store_longitude, store_content, store_phone, store_bank,
//				store_account, store_license_number, store_license_image, store_time_open, store_time_close);
		System.out.println("dto:"+dto);
		sqlSession.insert("write", dto);
		int i = dto.getStore_seq();
		System.out.println("writeDto" + i);
		return i;
	}

	// insert,update,delete는 되도록 void말고 boolean 처리해주기
	@Override
	public boolean fileInsert(FDto dto) {
//		Map<String, List<FDto>> map = new HashMap<String, List<FDto>>();
//		map.put("list", list);
		System.out.println("dto:" + dto);

		int i = sqlSession.insert("fileUpload", dto);

		return i > 0 ? true : false;
	}
	@Override
	public void writeMenu(MDto dto) {
		sqlSession.insert("writeMenu", dto);
	}
	
	
	@Override
	public List<FDto> writeView(String strSEQ) {
		return sqlSession.selectList("writeView", Integer.parseInt(strSEQ));

	}
	
	@Override
	public List<FDto> reviewView(String strSEQ){
		return sqlSession.selectList("reviewView", Integer.parseInt(strSEQ));
	}
	
	

	@Override
	public void modify(String store_seq, String store_name, String store_space, String store_address, 
			String store_content, String store_phone, String store_time_open, String store_time_close) {
		SDto dto = new SDto(Integer.parseInt(store_seq), store_name, store_space, store_address,  store_content,
				store_phone, store_time_open, store_time_close);
		sqlSession.update("modify", dto);

	}

	@Override
	public boolean fileUpdate(FDto fDto) {

		int i = sqlSession.update("fileUpdate", fDto);
		return i > 0 ? true : false;
	}
	
	@Override
	public void menuUpdate(MDto mdto) {
		sqlSession.update("menuUpdate", mdto);
	}

	@Override
	public void delete(String store_seq) {
		sqlSession.delete("delete", Integer.parseInt(store_seq));

	}
	@Override
	public void reviewWrite(ReviewDto dto) {
		
		sqlSession.insert("reviewWrite", dto);
	}
	
	@Override
	public void rvDel(String store_seq, String review_seq) {
//		sqlSession.delete("rvDel",Integer.parseInt(store_seq));
		sqlSession.delete("rvDel",Integer.parseInt(review_seq));
	}
	
	@Override
	public List<FDto> resView(String strSEQ) {
		return sqlSession.selectList("resView", Integer.parseInt(strSEQ));
	}
	
	@Override
	public int resInsert(PDto dto) {		
		
		sqlSession.insert("resInsert", dto);
		int i = dto.getRes_seq();
		System.out.println("dto.getRes_seq() >>>"+i);
		return i;
	}
	
	@Override
	public List<FDto> resCon(String res_seq, String user_id) {
		
		
		return sqlSession.selectList("resCon",Integer.parseInt(res_seq));

	}
	@Override
	public List<FDto> resDon(String res_seq) {
		return sqlSession.selectList("resCon", Integer.parseInt(res_seq));
	}
	
	@Override
	public List<FDto> resList(String res_seq) {
		return sqlSession.selectList("resList", Integer.parseInt(res_seq));
	}
	
	@Override
	public List<FDto> payList(String res_seq) {
		List<FDto> result = (ArrayList) sqlSession.selectList("payList");
		System.out.println("payList result : " + result);
		return result;
	}
	
	@Override
	public void resUpdate(String res_seq, Timestamp pay_date, String res_success) {
		PDto dto = new PDto(Integer.parseInt(res_seq), pay_date, res_success);
		sqlSession.update("resUpdate", dto);
	}

	@Override
	public List<FDto> srlist(int page, int limit,String user_id){ 
		int startRow = (page -1) * limit +1;
		int endRow = startRow + limit -1;
		PageUserIdDTO dto = new PageUserIdDTO(startRow, endRow, user_id);
		return sqlSession.selectList("srlist", dto);
	}
	
	@Override
	public List<RDto> reviewIf(String store_seq, String user_id) {
		RDto dto = new RDto(user_id, Integer.parseInt(store_seq)); 
	
		return sqlSession.selectList("reviewIf",dto);
	}
	
	@Override
	public void likeOk(LDto dto) {
		sqlSession.insert("likeOk", dto);
	}
	
	@Override
	public void likeNo(String store_seq, String user_id) {
		LDto dto = new LDto(user_id, Integer.parseInt(store_seq));
		sqlSession.delete("likeNo", dto);
	}
	
	@Override
	public List<LDto> likeIf(String store_seq, String user_id) {
		LDto dto = new LDto(user_id, Integer.parseInt(store_seq)); 
		
		return sqlSession.selectList("likeIf",dto);
	}
	
	@Override
	public List<ReviewDto> totalS(String store_seq) {
		return sqlSession.selectList("totalS", Integer.parseInt(store_seq));
	}


	


	
	


}
