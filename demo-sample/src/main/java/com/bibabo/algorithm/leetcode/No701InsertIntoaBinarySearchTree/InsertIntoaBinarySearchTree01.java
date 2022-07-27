package com.bibabo.algorithm.leetcode.No701InsertIntoaBinarySearchTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/26 17:12
 * @Description:
 */
public class InsertIntoaBinarySearchTree01 {

    public TreeNode insertIntoBST(TreeNode root, int val) {
        if (root == null) return new TreeNode(val);
        TreeNode node = root;
        while (node != null) {
            if (node.val >= val) {
                if (node.left == null) {
                    node.left = new TreeNode(val);
                    return root;
                }
                node = node.left;
            } else {
                if (node.right == null) {
                    node.right = new TreeNode(val);
                    return root;
                }
                node = node.right;
            }
        }
        return root;
    }
}
