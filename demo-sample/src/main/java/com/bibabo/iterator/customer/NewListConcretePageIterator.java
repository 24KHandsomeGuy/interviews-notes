package com.bibabo.iterator.customer;

import java.util.ArrayList;
import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/29 22:04
 * @Description 分页迭代器
 */
public class NewListConcretePageIterator<T> extends PageIterator<T> {

    private final List<List<T>> objectListPages;
    private Integer cursor;
    private Integer reversalCursor;
    private final Integer totalPage;

    public NewListConcretePageIterator(List<T> objectList, Integer pageSize) {
        this.totalPage = (int) Math.ceil((((double) objectList.size() + (double) pageSize) / (double) pageSize - 1));
        this.cursor = 0;
        this.reversalCursor = this.totalPage - 1;
        this.objectListPages = new ArrayList<>(this.totalPage);
        for (int curPage = 0; curPage < this.totalPage; curPage++) {
            List<T> subObjectList;
            subObjectList = new ArrayList<>(pageSize);
            for (int j = 0; j < pageSize; j++) {
                if (curPage * pageSize + j > objectList.size() - 1) {
                    break;
                }
                subObjectList.add(objectList.get(curPage * pageSize + j));
            }
            objectListPages.add(subObjectList);
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
