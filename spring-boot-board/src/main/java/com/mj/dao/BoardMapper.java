package com.mj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Component
public interface BoardMapper {

	List<Map<String, Object>> selectList(Map<String, Object> map);
}
