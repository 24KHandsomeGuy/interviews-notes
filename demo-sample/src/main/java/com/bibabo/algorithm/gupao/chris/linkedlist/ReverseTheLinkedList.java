package com.bibabo.algorithm.gupao.chris.linkedlist;


import com.bibabo.algorithm.leetcode.No141LinkedListCycle.ListNode;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/10/24 18:02
 * @Description:
 */
public class ReverseTheLinkedList {

    public static void main(String[] args) {
        MyNode node3 = new MyNode(3, null);
        MyNode node2 = new MyNode(2, node3);
        MyNode node1 = new MyNode(1, node2);
        MyNode newHead = reverseTheLinkedList(node1);
        while (newHead != null) {
            System.out.println(newHead.val);
            newHead = newHead.next;
        }
    }

    /**
     * 反转链表2
     * 递归
     *
     * @param head
     * @param left
     * @param right
     * @return
     */
    public ListNode reverseBetween6(ListNode head, int left, int right) {
        if (head == null || left == right) return head;
        // 需要一个哨兵节点，以防left = 1时，head发生变化，难以确定新head
        ListNode dummy = new ListNode(-1);
        dummy.next = head;

        // 需要两个节点存储left.prev和right，left.prev.next引用指向right
        ListNode prevLeft = dummy;
        ListNode rightNode = null;
        // 需要两个节点存储left和right.next，left.next引用指向right.next
        ListNode postRight = null;
        ListNode leftNode = null;

        prevLeft.next = rightNode;
        leftNode.next = postRight;
        return dummy.next;
    }

    /**
     * 反转链表2
     * 截断处理法
     *
     * @param head
     * @param left
     * @param right
     * @return
     */
    public ListNode reverseBetween(ListNode head, int left, int right) {
        if (head == null || left == right) return head;
        // 需要一个哨兵节点，以防left = 1时，head发生变化，难以确定新head
        ListNode dummy = new ListNode(-1);
        dummy.next = head;

        // 需要两个节点存储left.prev和right，left.prev.next引用指向right
        ListNode prevLeft = dummy;
        ListNode rightNode = null;
        // 需要两个节点存储left和right.next，left.next引用指向right.next
        ListNode postRight = null;
        ListNode leftNode = null;
        // 需要一个节点存储prev
        ListNode prev = null;
        // 需要一个节点存储current
        ListNode current = head;
        // 需要一个节点临时存储curr.next
        ListNode tmp = null;
        for (int i = 1; i <= right; i++) {
            tmp = current.next;
            if (i == left - 1) {
                prevLeft = current;
            } else if (i == left) {
                leftNode = current;
            } else if (left < i && i < right) {
                current.next = prev;
            } else if (i == right) {
                rightNode = current;
                postRight = rightNode.next;
                current.next = prev;
            }
            // prev和current一起向下游
            prev = current;
            current = tmp;
        }
        prevLeft.next = rightNode;
        leftNode.next = postRight;
        return dummy.next;
    }

    /**
     * 反转链表2
     * 截断处理法
     *
     * @param head
     * @param left
     * @param right
     * @return
     */
    public ListNode reverseBetween2(ListNode head, int left, int right) {
        if (head == null || left == right) return head;
        // 需要一个哨兵节点，以防left = 1时，head发生变化，难以确定新head
        ListNode dummy = new ListNode(-1);
        dummy.next = head;
        head = dummy;
        // 找到left.prev
        for (int i = 1; i < left; i++) {
            head = head.next;
        }
        // 需要两个节点存储left.prev和right，left.prev.next引用指向right
        // 需要两个节点存储left和right.next，left.next引用指向right.next
        ListNode prevLeft = head;
        ListNode leftNode = head.next;
        // 向下游，游至right。rightNode相当于prev，postRight相当于current
        ListNode rightNode = leftNode;
        ListNode postRight = rightNode.next;
        // 需要一个节点临时存储curr.next
        ListNode tmp = null;
        for (int i = left; i < right; i++) {
            tmp = postRight.next;
            postRight.next = rightNode;
            // prev和current一起向下游
            rightNode = postRight;
            postRight = tmp;
        }
        prevLeft.next = rightNode;
        leftNode.next = postRight;
        return dummy.next;
    }

    /**
     * 反转链表2
     * 截断处理法
     *
     * @param head
     * @param left
     * @param right
     * @return
     */
    public ListNode reverseBetween3(ListNode head, int left, int right) {
        if (head == null || left == right) return head;
        // 需要一个哨兵节点，以防left = 1时，head发生变化，难以确定新head
        ListNode dummy = new ListNode(-1);
        dummy.next = head;
        head = dummy;
        // 找到left.prev
        for (int i = 1; i < left; i++) {
            head = head.next;
        }
        // 需要两个节点存储left.prev和right，left.prev.next引用指向right
        // 需要两个节点存储left和right.next，left.next引用指向right.next
        ListNode prevLeft = head;
        ListNode leftNode = head.next;
        // 向下游，游至right。rightNode相当于prev，postRight相当于current
        ListNode rightNode = null;
        ListNode postRight = leftNode;
        // 需要一个节点临时存储curr.next
        ListNode tmp = null;
        for (int i = left; i <= right; i++) {
            tmp = postRight.next;
            postRight.next = rightNode;
            // prev和current一起向下游
            rightNode = postRight;
            postRight = tmp;
        }
        prevLeft.next = rightNode;
        leftNode.next = postRight;
        return dummy.next;
    }

    /**
     * 反转链表2
     * 截断处理法
     *
     * @param head
     * @param left
     * @param right
     * @return
     */
    public ListNode reverseBetween4(ListNode head, int left, int right) {
        if (head == null || left == right) return head;
        // 借助dummy节点，否则将很难确认新链条的头节点在哪里
        ListNode dummy = new ListNode(-1);
        dummy.next = head;
        head = dummy;

        // 1.从头游至left的前驱节点
        for (int i = 1; i < left; i++) {
            head = head.next;
        }
        // 保存记录left.prev节点，该节点需要next引用指向right
        ListNode prevLeft = head;
        // 保存记录left节点，该节点需要next引用指向right.next
        ListNode leftN = head.next;
        // 寻找right。（相当于反转链表1中的prev）
        ListNode rightN = leftN;
        // 寻找right.next（相当于反转链表1中的curr）
        ListNode postRight = rightN.next;
        for (int i = left + 1; i <= right; i++) {
            ListNode tmp = postRight.next;
            postRight.next = rightN;
            rightN = postRight;
            postRight = tmp;
        }
        // 最后将left.prev的next指向right
        prevLeft.next = rightN;
        // 最后将left的next指向right.next
        leftN.next = postRight;
        // 返回dummy节点的下一个节点，即新的链条头节点
        return dummy.next;
    }

    /**
     * 反转链表2
     * 头插法
     *
     * @param head
     * @param left
     * @param right
     * @return
     */
    public ListNode reverseBetween5(ListNode head, int left, int right) {
        if (head == null || left == right) return head;
        // 借助dummy节点，否则将很难确认新链条的头节点在哪里
        ListNode dummy = new ListNode(-1);
        dummy.next = head;

        // 找到left的前驱节点，以该节点为头，不断改变该节点的next指向，头插
        ListNode prevLeft = dummy;
        for (int i = 1; i < left; i++) {
            prevLeft = prevLeft.next;
        }
        // 从left节点起，直至right遍历进行头插
        // 例：1 -> 2 -> 3 -> 4 -> 5 left=2，right=4
        // 那么第一次就是1 -> 3 -> 2 -> 4 -> 5  那么第二次就是1 -> 4 -> 3 -> 2 -> 5
        // curr = leftNode该引用指向一直不变。虽然赋值没有变，但是每次循环curr所在的位置已经向后移动了
        ListNode curr = prevLeft.next; // leftNode
        ListNode next; // nextNode节点缓存每次循环的curr.next
        for (int i = left; i < right; i++) {
            next = curr.next; // 3
            curr.next = next.next; // 2 -> 4
            next.next = prevLeft.next; // 3 -> 2
            prevLeft.next = next; // 1 -> 3
        }
        return dummy.next;
    }

    /**
     * 反转链表1
     * 游标向下移动法
     *
     * @param curr
     * @return
     */
    static MyNode reverseTheLinkedList(MyNode curr) {
        // 1.必须要一个引用向下游，记录当前位置curr
        // 2.必须要一个引用记录前一个节点prev
        // 3.必须要一个空引用，缓存每次遍历时curr.next，因为curr.next已经被重新赋值
        MyNode tmp = null;
        MyNode prev = null;
        while (curr != null) {
            tmp = curr.next;
            curr.next = prev;
            prev = curr;
            curr = tmp;
        }
        return prev;
    }

    /**
     * 反转链表1
     * 头插法。借助dummy节点
     *
     * @param head
     * @return
     */
    static MyNode reverseTheLinkedList2(MyNode head) {
        if (head == null || head.next == null) return head;
        MyNode dummy = new MyNode();
        dummy.next = head;
        // 固定的prev，他的next随着循环变更指向
        MyNode prev = dummy;
        // 固定的curr，虽然引用不会被重新赋值，但实际上通过next的指向变更，位置也随着向后移动
        MyNode curr = head;
        // 缓存next
        MyNode next;
        // 因为curr会向后移动，直至next为空
        while (curr.next != null) {
            next = curr.next;
            curr.next = next.next;
            next.next = prev.next;
            prev.next = next;
        }
        return dummy.next;
    }

    /**
     * 反转链表1
     * 递归法
     * 前两种方法都是自前向后遍历，递归法则是相反，自后向前处理
     * 递归只需要注意两个点：1. 何时return？也就是哪种条件出栈 2.何时递归？也就是何时入栈？
     *
     * @param head
     * @return
     */
    static MyNode reverseTheLinkedList3(MyNode head) {
        // 如果是空，或者已经是链表的最后一个节点，出栈
        if (head == null || head.next == null) {
            return head;
        }
        // 递归
        MyNode newHead = reverseTheLinkedList3(head.next);
        head.next.next = head; // 反转，后指向前
        head.next = null; // 前指向空，不再指向后
        return newHead;
    }

    static class MyNode {
        Integer val;
        MyNode prev;
        MyNode next;

        public MyNode(Integer val, MyNode next) {
            this.val = val;
            this.next = next;
        }

        public MyNode() {
        }

        public Integer getVal() {
            return val;
        }

        public void setVal(Integer val) {
            this.val = val;
        }

        public MyNode getPrev() {
            return prev;
        }

        public void setPrev(MyNode prev) {
            this.prev = prev;
        }

        public MyNode getNext() {
            return next;
        }

        public void setNext(MyNode next) {
            this.next = next;
        }
    }

}
