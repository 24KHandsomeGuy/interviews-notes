package com.bibabo.algorithm.leetcode.No98ValidateBinarySearchTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/26 18:51
 * @Description: 中序遍历
 * 左 根 右 按照这个顺序遍历，后一个值一定要大于前一个值否则则不是二叉查找树
 */
public class ValidateBinarySearchTree02 {

    public boolean isValidBST(TreeNode root) {
        return isValidBST(root, Long.MIN_VALUE, Long.MAX_VALUE);
    }

    private boolean isValidBST(TreeNode root, long lower, long upper) {
        if (root == null) return true;
        if (root.val <= lower || root.val >= upper) return false;
        return isValidBST(root.left, lower, root.val) && isValidBST(root.right, root.val, upper);
    }
}
