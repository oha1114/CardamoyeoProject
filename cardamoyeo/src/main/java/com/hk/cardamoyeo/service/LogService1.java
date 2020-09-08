package com.hk.cardamoyeo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface LogService1 {
	public void execute(Model model,MultipartHttpServletRequest multi);
}
