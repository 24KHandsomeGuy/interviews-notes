package com.bibabo.iterator.customer;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/29 22:01
 * @Description 抽象分页迭代器类：抽象迭代器类
 */
public abstract class MyPageIterator<T> {

    public abstract Boolean isFirstPage();

    public abstract Boolean isLastPage();

    public abstract List<T> previousPage();

    public abstract List<T> nextPage();

}
