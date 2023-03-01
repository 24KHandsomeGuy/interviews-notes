package com.bibabo.algorithm.unknow.thirdone.a20210219;

/**
 * @author fukuixiang
 * @date 2021/2/19
 * @time 14:13
 * @description
 */
public class TreeTest {


    public static void main(String[] args) {
        Node root = generateABinaryTree();
        Node[] tree = generateABinaryTree2();
    }

    private static Node[] generateABinaryTree2() {
        int level = 4;
        int arrSize = 0;
        for (int i = 1;i <= level; i ++) {
            arrSize = arrSize * 2;
        }
        Node[] tree = new Node[arrSize];
        Node root = new Node();
        tree[1] = root;
        Node level2$1 = new Node();
        tree[2] = level2$1;
        Node level2$2 = new Node();
        tree[3] = level2$2;
        Node level3$1 = new Node();
        tree[4] = level3$1;
        Node level3$2 = new Node();
        tree[5] = level3$2;
        Node level4$1 = new Node();
        tree[11] = level4$1;
        return tree;
    }

    private static Node generateABinaryTree() {
        Node level4$1 = new Node(9, null, null);
        Node level3$2 = new Node(8, null, level4$1);
        Node level3$1 = new Node(5, null, null);
        Node level2$1 = new Node(7, level3$1, level3$2);
        Node level2$2 = new Node(12, null, null);
        Node root = new Node(10, level2$1, level2$2);
        return root;
    }

    private static class Node {

        int val;
        Node left;
        Node right;

        public Node() {
        }

        public Node(int val, Node left, Node right) {
            this.val = val;
            this.left = left;
            this.right = right;
        }
    }

}
