package com.bibabo.iterator.standard;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/29 22:01
 * @Description 抽象分页迭代器类：抽象迭代器类
 */
public abstract class PageIterator {

    public abstract void previousPage();

    public abstract void nextPage();

    public abstract Boolean isFirstPage();

    public abstract Boolean isLastPage();

    public abstract List<Object> getPreviousPage();

    public abstract List<Object> getNextPage();

}
