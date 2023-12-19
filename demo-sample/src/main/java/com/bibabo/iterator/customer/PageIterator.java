package com.bibabo.iterator.customer;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/12/19 15:25
 * @Description 分页器
 */
public abstract class PageIterator<T> {

    public abstract Boolean isFirstPage();

    public abstract Boolean isLastPage();

    public abstract List<T> previousPage();

    public abstract List<T> nextPage();

}
