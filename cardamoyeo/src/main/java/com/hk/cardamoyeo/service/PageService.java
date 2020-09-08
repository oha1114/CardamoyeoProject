package com.hk.cardamoyeo.service;

import javax.servlet.http.HttpServletRequest;

public class PageService {

	public void page(HttpServletRequest request, int count, int limit, int limitPage, int page, String pageUrl) {
		int maxPage = (int)((double)count/limit + 0.95); // 알고리즘
		// 20 => 11, 30 => 21, 40 => 31 을 가져오기 위한 로직
		int startPage = (int)(((double)page / limitPage + 0.95) -1) * limitPage +1; // 알고리즘
		int endPage = startPage + limitPage -1;
		if(endPage > maxPage) endPage = maxPage; //endPage는 maxPage를 넘어서지 않아야함
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("page", page);
		request.setAttribute("pageUrl", pageUrl); //includePage를 가져오기위함
	}
}
