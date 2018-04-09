package org.kite3.entity;

/**
 * 首页轮播图实体类
 * 
 * @author kite3
 *
 */
public class SiteCarousel {

	// id
	private Integer id;

	// 名称
	private String name;

	// 图片
	private String picture;

	// 链接
	private String url;

	// 权重
	private Integer weight;

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

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

}
