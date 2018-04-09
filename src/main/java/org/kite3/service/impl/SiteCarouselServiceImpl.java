package org.kite3.service.impl;

import java.util.List;

import org.kite3.dao.SiteCarouselDao;
import org.kite3.entity.SiteCarousel;
import org.kite3.service.SiteCarouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SiteCarouselServiceImpl implements SiteCarouseService {

	@Autowired
	private SiteCarouselDao siteCarouselDao;

	@Override
	public List<SiteCarousel> queryCarousels(int count) {
		List<SiteCarousel> resultList = siteCarouselDao.queryCarousels(count);
		return resultList;
	}

}
