package org.kite3.dao;

import java.util.List;

import org.kite3.entity.SiteCarousel;

public interface SiteCarouselDao {

    /**
     * 获取轮播
     */
    List<SiteCarousel> queryCarousels(int count);


}
