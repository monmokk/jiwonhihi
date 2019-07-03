package com.mj.util;

import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class DefaultParams {
	Map<String, Object> map = new HashMap<String, Object>();

	public Object get(String key) {
		return map.get(key);
	}

	public void put(String key, Object value) {
		map.put(key, value);
	}

	public Object remove(String key) {
		return map.remove(key);
	}

	public boolean containsKey(String key) {
		return map.containsKey(key);
	}

	public boolean containsValue(Object value) {
		return map.containsValue(value);
	}

	public void clear() {
		map.clear();
	}

	public Set<Entry<String, Object>> entrySet() {
		return map.entrySet();
	}

	public Set<String> keySet() {
		return map.keySet();
	}

	public boolean isEmpty() {
		return map.isEmpty();
	}

	public void putAll(Map<? extends String, ? extends Object> m) {
		map.putAll(m);
	}



	public void defaultData(String[] essentialParam) {
		defaultData(essentialParam, "");
	}

	public void defaultData(String[] essentialParam, String defaultValue) {
		for (String key : essentialParam) {
			put(key, containsKey(key) ? get(key) : defaultValue);
		}
	}

	/**
	 * 입력된 값을 가져옴
	 * 
	 * @param key
	 *            가져올 키
	 * @param defaultString
	 *            값이 없거나 "" 이면 대체할 문자
	 * @return
	 */
	public Map<String, Object> getMap() {
		return map;
	}
}
