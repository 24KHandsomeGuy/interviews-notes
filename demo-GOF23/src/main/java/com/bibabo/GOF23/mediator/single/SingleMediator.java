package com.bibabo.GOF23.mediator.single;

import java.util.LinkedList;
import java.util.List;

/**
 * @author fukuixiang
 * @date 2020/9/7
 * @time 11:02
 * @description 单例中介者  昌平沙河高教园区北街家园中介 只有一人
 */
public class SingleMediator {

    private List<Colleague> colleagueList = new LinkedList<Colleague>();

    public void register(Colleague colleague) {
        if (!colleagueList.contains(colleague)) {
            colleagueList.add(colleague);
        }
    }
    public void relay(Colleague colleague) {
        for (Colleague c : colleagueList) {
            if (!colleague.equals(c))
                c.receive();
        }
    }

    private static volatile SingleMediator singleMediator;

    private SingleMediator() {
    }

    public static SingleMediator getSingleMediator() {
        if (null == singleMediator) {
            synchronized (SingleMediator.class) {
                if (null == singleMediator) {
                    singleMediator = new SingleMediator();
                    return singleMediator;
                }
                return singleMediator;
            }
        }
        return singleMediator;

    }

}
