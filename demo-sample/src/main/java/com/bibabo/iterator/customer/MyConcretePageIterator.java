package com.bibabo.iterator.customer;

import java.util.ArrayList;
import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/29 22:04
 * @Description 分页迭代器
 */
public class MyConcretePageIterator<T> extends MyPageIterator<T> {

    private final List<List<T>> objectListPages;
    private Integer cursor;
    private Integer reversalCursor;
    private final Integer totalPage;

    public MyConcretePageIterator(List<T> objectList, Integer pageSize) {
        this.totalPage = (int) Math.ceil((((double) objectList.size() + (double) pageSize) / (double) pageSize - 1));
        this.cursor = 0;
        this.reversalCursor = this.totalPage - 1;
        this.objectListPages = new ArrayList<>(this.totalPage);
        for (int i = 0; i < this.totalPage; i++) {
            List<T> objList = new ArrayList<>(pageSize);
            for (int j = 0; j < pageSize; j++) {
                if (i * pageSize + j > objectList.size() - 1) {
                    break;
                }
                objList.add(objectList.get(i * pageSize + j));
            }
            objectListPages.add(objList);
        }
    }

    @Override
    public List<T> previousPage() {
        List<T> objects = this.objectListPages.get(reversalCursor);
        this.reversalCursor--;
        return objects;
    }

    @Override
    public List<T> nextPage() {
        List<T> objects = this.objectListPages.get(cursor);
        if (this.cursor < this.totalPage) {
            this.cursor++;
        }
        return objects;
    }

    @Override
    public Boolean isFirstPage() {
        return reversalCursor == -1;
    }

    @Override
    public Boolean isLastPage() {
        return cursor.equals(this.totalPage);
    }

}
