package com.bibabo.iterator.standard;

import java.util.ArrayList;
import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/29 22:04
 * @Description 具体分页迭代器类：具体迭代器类
 */
public class ConcretePageIterator extends PageIterator {

    private AbstractObjectList abstractObjectList;
    private List<Object> objectList;
    private List<List<Object>> objectListPages;
    private Integer cursor;
    private Integer reversalCursor;
    private Integer totalPage;

    public ConcretePageIterator(AbstractObjectList list, Integer pageSize) {
        this.abstractObjectList = list;
        this.objectList = abstractObjectList.getObjects();
        this.totalPage = (int) Math.ceil((((double) this.objectList.size() + (double) pageSize) / (double) pageSize - 1));
        this.cursor = 0;
        this.reversalCursor = this.totalPage - 1;
        this.objectListPages = new ArrayList<>();
        for (int i = 0; i < this.totalPage; i++) {
            List<Object> objList = new ArrayList<>();
            for (int j = 0; j < pageSize; j++) {
                if (i * pageSize + j > this.objectList.size() - 1) {
                    break;
                }
                objList.add(this.objectList.get(i * pageSize + j));
            }
            objectListPages.add(objList);
        }
    }

    @Override
    public void previousPage() {
        if (this.reversalCursor > -1) {
            this.reversalCursor--;
        }
    }

    @Override
    public void nextPage() {
        if (this.cursor < this.totalPage) {
            this.cursor++;
        }
    }

    @Override
    public Boolean isFirstPage() {
        return reversalCursor == -1;
    }

    @Override
    public Boolean isLastPage() {
        return cursor.equals(this.totalPage);
    }

    @Override
    public List<Object> getPreviousPage() {
        return this.objectListPages.get(reversalCursor);
    }

    @Override
    public List<Object> getNextPage() {
        return this.objectListPages.get(cursor);
    }
}
