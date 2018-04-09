package org.kite3.entity;

/**
 * 系统用户 包括教师和学生
 * 
 * @author kite3
 *
 */
public class User {

	/**
	 * 用户id
	 */
	private Integer id;

	/**
	 * 用户名（必须唯一）
	 **/
	private String username;

	/**
	 * 密码
	 **/
	private String password;

	/**
	 * 性别
	 **/
	private Integer gender;

	/**
	 * 头像
	 **/
	private String header;

	/**
	 * 手机号码
	 **/
	private String phone;

	/**
	 * 学历：大专及其以下、本科、硕士、博士、博士后
	 **/
	private String education;

	/**
	 * 大学名称
	 */
	private String collegeName;

	/**
	 * 头衔
	 **/
	private String title;

	/**
	 * 签名
	 **/
	private String sign;

	/**
	 * 所在省份
	 **/
	private String province;

	/**
	 * 所在城市
	 **/
	private String city;

	/**
	 * 推荐权重
	 */
	private Integer weight;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

}
