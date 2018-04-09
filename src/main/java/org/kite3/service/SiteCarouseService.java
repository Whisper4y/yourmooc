package org.kite3.service;

import java.util.List;

import org.kite3.entity.SiteCarousel;

public interface SiteCarouseService {

	/**
	 * 获取轮播
	 **/
	public List<SiteCarousel> queryCarousels(int count);

}
