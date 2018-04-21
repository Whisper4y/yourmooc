package org.kite3.page;

import java.util.List;

/**
 * 分页接口
 */
public interface Page<E> extends Iterable<E> {

    /**
     * 起始页号
     */
    int getFirstPageNum();

    /**
     * 终止页号
     */
    int getLastPageNum();

    /**
     * 当前页号
     */
    int getPageNum();

    /**
     * 分页大小
     */
    int getPageSize();

    /**
     * 分页数据
     */
    List<E> getItems();

    /**
     * 获取总记录数
     */
    int getItemsTotalCount();

    /**
     * 获取总页数
     */
    int getPageTotalCount();

    /**
     * 是第一页
     */
    boolean isFirstPage();

    /**
     * 是最后一页
     */
    boolean isLastPage();

    /**
     * 是否为空内容
     */
    boolean isEmpty();

}
