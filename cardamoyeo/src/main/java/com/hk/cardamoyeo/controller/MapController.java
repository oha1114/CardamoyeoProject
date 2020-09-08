package com.hk.cardamoyeo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.service.MService;

@Controller
public class MapController {
	@Autowired
	private MService mService;
	
	/*@RequestMapping("/map_list")
	public String map_list(Model model) {
		List<SDto> mlist = mService.getAllList();
		model.addAttribute("mlist", mlist);
		
		return "map3";
	}*/
	
	
	@RequestMapping("/map")
	public String map(String keyword, Model model) {
			model.addAttribute("keyword", keyword);
		return "map";
	}

	@ResponseBody
	@RequestMapping(value ="/map_list", produces = "application/json")
	public Map<String, List<SDto>> map_list(Model model, @RequestParam("keyword") String keyword) throws Exception{
		List<SDto> mlist = mService.getAllList(keyword);
		Map<String, List<SDto>> map = new HashMap<String, List<SDto>>();
		map.put("mlist", mlist);
		return map;
	}
}
