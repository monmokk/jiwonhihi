package com.mj.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.dao.BoardMapper;

//import com.mj.dao.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private final BoardMapper boardMapper;
	
	@Autowired
	public BoardService(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}
	
	public List<Map<String, Object>> list(Map<String, Object> map){
		return boardMapper.selectList(map);
	}
}
