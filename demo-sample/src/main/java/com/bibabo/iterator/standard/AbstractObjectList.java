package com.bibabo.iterator.standard;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/29 22:02
 * @Description 抽象对象列表类：抽象聚合类
 */
public abstract class AbstractObjectList {

    private List<Object> objectList;

    public AbstractObjectList(List<Object> objects) {
        this.objectList = objects;
    }

    public void addObject(Object object) {
        this.objectList.add(object);
    }

    public void removeObject(Object object) {
        this.objectList.remove(object);
    }

    public List<Object> getObjects() {
        return objectList;
    }

    public abstract PageIterator createPageIterator();

}
