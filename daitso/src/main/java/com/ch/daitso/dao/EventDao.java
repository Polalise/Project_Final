package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.EventBoard;

public interface EventDao {

	int getTotal(EventBoard board);

	List<EventBoard> list(EventBoard board);

	int getMaxNum();

	int insert(EventBoard board);

	void updateReadCount(int e_num);

	EventBoard select(int e_num);

	int update(EventBoard board);

	int delete(int e_num);

	int getEventCount();

	List<EventBoard> list2();

}
