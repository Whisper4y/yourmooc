package org.kite3.dto;

import java.util.ArrayList;
import java.util.List;

import org.kite3.entity.CourseSection;

/**
 * 课程章节DTO
 */
public class CourseSectionDto extends CourseSection {

	// 小节
	private List<CourseSection> sections = new ArrayList<CourseSection>();

	public List<CourseSection> getSections() {
		return sections;
	}

	public void setSections(List<CourseSection> sections) {
		this.sections = sections;
	}
}
