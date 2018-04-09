package org.kite3.business.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.kite3.business.CourseBusiness;
import org.kite3.dto.CourseSectionDto;
import org.kite3.entity.CourseSection;
import org.kite3.service.CourseSectionService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseBusinessImpl implements CourseBusiness {

	@Autowired
	private CourseSectionService courseSectionService;

	/**
	 * 获取课程章节
	 * 
	 * 数据结构依旧是Map，且"节"以一个字段的方式存储在"章"中
	 */
	public List<CourseSectionDto> queryCourseSection(int courseId) {
		List<CourseSectionDto> resultList = new ArrayList<CourseSectionDto>();
		CourseSection queryEntity = new CourseSection();
		queryEntity.setCourseId(courseId);

		Map<Integer, CourseSectionDto> tmpMap = new LinkedHashMap<Integer, CourseSectionDto>();
		Iterator<CourseSection> it = courseSectionService.queryAll(queryEntity).iterator();
		while (it.hasNext()) {
			CourseSection item = it.next();
			if (Integer.valueOf(0).equals(item.getParentId())) { // 章
				CourseSectionDto dto = new CourseSectionDto();
				BeanUtils.copyProperties(item, dto);
				tmpMap.put(dto.getId(), dto);
			} else {
				tmpMap.get(item.getParentId()).getSections().add(item);// 小节添加到大章中
			}
		}
		for (CourseSectionDto dto : tmpMap.values()) {
			resultList.add(dto);
		}
		return resultList;
	}

}
