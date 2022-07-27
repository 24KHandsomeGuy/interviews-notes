package com.bibabo.algorithm.leetcode.No98ValidateBinarySearchTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/26 18:51
 * @Description: 中序遍历
 * 左 根 右 按照这个顺序遍历，后一个值一定要大于前一个值否则则不是二叉查找树
 */
public class ValidateBinarySearchTree01 {

    public boolean isValidBST(TreeNode root) {
        if (root == null) return false;

        double prevVal = -Double.MAX_VALUE;
        Stack<TreeNode> stack = new Stack<>();
        while (!stack.isEmpty() || root != null) {
            while (root != null) {
                stack.push(root);
                root = root.left;
            }
            TreeNode node = stack.pop();
            if ((double) node.val <= prevVal) {
                return false;
            }
            prevVal = (double) node.val;
            root = node.right;
        }
        return true;
    }
}
