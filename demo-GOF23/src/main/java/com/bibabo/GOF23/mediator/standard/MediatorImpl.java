package com.bibabo.GOF23.mediator.standard;

/**
 * @author fukuixiang
 * @date 2020/9/7
 * @time 9:53
 * @description
 */
public class MediatorImpl extends Mediator {


    void register(Colleague colleague) {
        if (!colleagueList.contains(colleague)) {
            //把中介者放到每个同事里，这样同事就只关心中介者即可，无需关心所有的其余同事，大大的解耦
            colleague.setMediator(this);
            colleagueList.add(colleague);
        }
    }

    /**
     * 转发通知其余人
     * @param name
     * @param addr
     */
    void relay(String name, String addr) {
        for (Colleague c : colleagueList) {
            if (!c.getName().equals(name))
                c.receive(name,addr);
        }
    }

}
