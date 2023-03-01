package com.bibabo.algorithm.unknow.thirdone.datastructure.linked.reverselinked;

/**
 * @author fukuixiang
 * @date 2020/9/10
 * @time 10:57
 * @description
 */
public class MyNode {

    Integer val;

    public MyNode(Integer val) {
        this.val = val;
    }

    private MyNode nextNode;

    public MyNode getNextNode() {
        return nextNode;
    }

    public MyNode setNextNode(MyNode nextNode) {
        this.nextNode = nextNode;
        return nextNode;
    }

    public void print() {
        System.out.print(this.val + "->");
        if (this.nextNode != null)
            this.nextNode.print();
    }
}
