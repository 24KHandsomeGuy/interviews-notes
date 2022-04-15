package com.bibabo.algorithm.datastructure.linked.reverselinked;

/**
 * @author fukuixiang
 * @date 2020/9/10
 * @time 10:56
 * @description 翻转连表节点相加成新链表
 */
public class FlipLinedListAdd {

    public static void main(String[] args) {

        MyNode node1Head = new MyNode(3);
        MyNode node12 = new MyNode(6);
        MyNode node13 = new MyNode(9);
        node1Head.setNextNode(node12).setNextNode(node13);

        MyNode node2Head = new MyNode(0);
        MyNode node22 = new MyNode(8);
        node2Head.setNextNode(node22);

        addNodeList(node1Head,node2Head).print();
    }

    public static MyNode addNodeList(MyNode node1,MyNode node2) {
        MyNode occupyHeadNode = new MyNode(0);
        MyNode l1 = node1,l2 = node2,curr = occupyHeadNode;
        int carry = 0;
        while (l1 != null || l2 != null) {
            int val1 = (l1 != null) ? l1.val : 0;
            int val2 = (l2 != null) ? l2.val : 0;
            int sum = val1 + val2 + carry;
            carry = sum / 10;
            MyNode newNode = new MyNode(sum % 10);
            curr.setNextNode(newNode);
            curr = newNode;
            l1 = l1 != null ? l1.getNextNode() : null;
            l2 = l2 != null ? l2.getNextNode() : null;
        }
        if (carry > 0) {
            curr.setNextNode(new MyNode(carry));
        }
        return occupyHeadNode.getNextNode();
    }

}
