package com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/21 16:32
 * @Description:
 */
public class TreeNode {

    public int val;
    public TreeNode left;
    public TreeNode right;

    TreeNode() {
    }

    public TreeNode(int val) {
        this.val = val;
    }

    public TreeNode(int val, TreeNode left, TreeNode right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}
