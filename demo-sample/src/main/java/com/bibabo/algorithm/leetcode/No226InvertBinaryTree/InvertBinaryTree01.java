package com.bibabo.algorithm.leetcode.No226InvertBinaryTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/26 14:12
 * @Description:
 */
public class InvertBinaryTree01 {

    public TreeNode invertTree(TreeNode root) {
        if (root == null) return root;

        TreeNode left = invertTree(root.left);
        TreeNode right = invertTree(root.right);
        root.left = right;
        root.right = left;
        return root;
    }
}
