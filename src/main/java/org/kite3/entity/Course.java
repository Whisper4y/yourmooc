package org.kite3.entity;

public class Course {

	/**
	 * 课程id
	 **/
	private Integer id;

	/**
	 * 课程名称
	 **/
	private String name;

	/**
	 * 课程分类
	 **/
	private String classify;

	/**
	 * 课程分类名称
	 */
	private String classifyName;

	/**
	 * 课程二级分类
	 **/
	private String subClassify;

	/**
	 * 课程二级分类名称
	 */
	private String subClassifyName;

	/**
	 * 归属人
	 **/
	private String username;

	/**
	 * 课程级别：1-初级，2-中级，3-高级
	 **/
	private Integer level;

	/**
	 * 时长
	 **/
	private String time;

	/**
	 * 课程描述
	 **/
	private String brief;

	/**
	 * 权重
	 **/
	private Integer weight;

	/**
	 * 学习人数
	 **/
	private Integer studyCount;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public String getClassifyName() {
		return classifyName;
	}

	public void setClassifyName(String classifyName) {
		this.classifyName = classifyName;
	}

	public String getSubClassify() {
		return subClassify;
	}

	public void setSubClassify(String subClassify) {
		this.subClassify = subClassify;
	}

	public String getSubClassifyName() {
		return subClassifyName;
	}

	public void setSubClassifyName(String subClassifyName) {
		this.subClassifyName = subClassifyName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Integer getStudyCount() {
		return studyCount;
	}

	public void setStudyCount(Integer studyCount) {
		this.studyCount = studyCount;
	}

}
