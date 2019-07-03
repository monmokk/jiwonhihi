package com.mj.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mj.service.BoardService;
//import com.mj.service.BoardService;
import com.mj.util.DefaultParams;

@Controller
public class CommonController {
	@Autowired
	private final BoardService boardService;
	
	public CommonController(BoardService boardService) {
			this.boardService = boardService;
	}
	@RequestMapping(value="/")
	public String main(DefaultParams params, ModelMap modelMap) {
		
		List<Map<String, Object>> list = boardService.list(params.getMap());
		modelMap.addAttribute("list", list);
		
		return "mainpage";
	}
}
