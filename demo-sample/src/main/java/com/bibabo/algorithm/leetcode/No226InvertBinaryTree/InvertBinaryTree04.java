package com.bibabo.algorithm.leetcode.No226InvertBinaryTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/26 14:12
 * @Description: 深度优先遍历
 */
public class InvertBinaryTree04 {

    public TreeNode invertTree(TreeNode root) {
        if (root == null) {
            return null;
        }
        Stack<TreeNode> stack = new Stack<>();
        stack.push(root);
        while (!stack.isEmpty()) {
            int size = stack.size();
            for (int i = 0; i < size; i++) {
                TreeNode cur = stack.pop();
                TreeNode temp = cur.left;
                cur.left = cur.right;
                cur.right = temp;
                if (cur.right != null) {
                    stack.push(cur.right);
                }
                if (cur.left != null) {
                    stack.push(cur.left);
                }
            }
        }
        return root;
    }
}
