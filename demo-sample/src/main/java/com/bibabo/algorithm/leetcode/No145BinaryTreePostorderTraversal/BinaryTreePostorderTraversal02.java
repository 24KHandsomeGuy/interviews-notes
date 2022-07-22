package com.bibabo.algorithm.leetcode.No145BinaryTreePostorderTraversal;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/21 18:59
 * @Description:
 */
public class BinaryTreePostorderTraversal02 {

    public List<Integer> postorderTraversal(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        if (root == null) return result;

        Stack<TreeNode> stack = new Stack<>();
        TreeNode node = root;
        TreeNode prev = null;
        while (!stack.isEmpty() || node != null) {
            while (node != null) {
                stack.push(node);
                node = node.left;
            }
            node = stack.pop();
            // 如果没有右子节点或者右子节点已经遍历过了，那么当前root节点可以遍历
            if (node.right == null || node.right == prev) {
                result.add(node.val);
                prev = node;
                node = null;// 向上pop
            } else {
                // 把当前根节点再次压入栈，等待其右子节点遍历结束，再遍历当前根节点
                stack.push(node);
                node = node.right;
            }
        }
        return result;
    }
}
