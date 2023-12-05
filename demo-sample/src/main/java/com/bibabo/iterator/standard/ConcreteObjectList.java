package com.bibabo.iterator.standard;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/11/29 22:05
 * @Description
 */
public class ConcreteObjectList extends AbstractObjectList {

    public ConcreteObjectList(List<Object> objects) {
        super(objects);
    }

    @Override
    public PageIterator createPageIterator() {
        return new ConcretePageIterator(this, 5);
    }

}
