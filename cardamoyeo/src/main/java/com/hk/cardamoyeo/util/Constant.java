package com.hk.cardamoyeo.util;

import org.springframework.jdbc.core.JdbcTemplate;

import com.hk.cardamoyeo.dao.LogDaoImpl;
import com.hk.cardamoyeo.dao.ULikeDaoImpl;
import com.hk.cardamoyeo.dao.UQnaDaoImpl;
import com.hk.cardamoyeo.dao.UResDaoImpl;
import com.hk.cardamoyeo.dao.UReviewDaoImpl;

public class Constant {
	public static JdbcTemplate template;
	public static LogDaoImpl dao;
	public static ULikeDaoImpl ldao;
	public static UResDaoImpl rdao;
	//public static RDao rdao;
	public static UReviewDaoImpl rvdao;
	public static UQnaDaoImpl uqnadao;
}
