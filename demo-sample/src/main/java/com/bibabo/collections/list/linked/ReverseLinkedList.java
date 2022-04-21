package com.bibabo.collections.list.linked;

/**
 * @author fukuixiang
 * @date 2021/3/9
 * @time 10:33
 * @description
 */
public class ReverseLinkedList {

    public static void main(String[] args) {

        // 构建一张链表
        int[] arr = new int[] {7,3,10,6,1};
        MyLinkedList.Node head = createLinkedList(arr);

        //MyLinkedList.Node newHead = reverseLinkedList(head);

        MyLinkedList.Node newHead = reverseLinkedList2(head);

        // 遍历打印反转后的链表
        MyLinkedList.Node curr = newHead;
        while (curr != null) {
            System.out.println(curr.element);
            curr = curr.next;
        }
    }

    // 递归 从后至前反转
    private static MyLinkedList.Node reverseLinkedList2(MyLinkedList.Node head) {
        if (head == null || head.next == null) {// 为空是异常情况 next为空表明当前节点是原链表的尾结点
            return head;
        }
        MyLinkedList.Node newHead = reverseLinkedList2(head.next);
        head.next.next = head;
        head.next = null;

        return newHead;
    }

    // 向后遍历 从前至后反转
    private static MyLinkedList.Node reverseLinkedList(MyLinkedList.Node head) {

        MyLinkedList.Node curr = head;
        MyLinkedList.Node prev = null;
        while (curr != null) {
            MyLinkedList.Node next = curr.next;
            curr.next = prev;
            prev = curr;
            curr = next;
        }
        return prev;
    }

    private static MyLinkedList.Node createLinkedList(int[] arr) {
        MyLinkedList<Integer> myLinkedList = new MyLinkedList<>();
        for (int e : arr) {
            myLinkedList.addToTail(e);
        }
        myLinkedList.getLastNode().next = null;
        return myLinkedList.getFirstNode();
    }


}
