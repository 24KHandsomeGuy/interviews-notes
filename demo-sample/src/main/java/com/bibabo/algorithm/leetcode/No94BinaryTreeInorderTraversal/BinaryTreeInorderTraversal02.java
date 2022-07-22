package com.bibabo.algorithm.leetcode.No94BinaryTreeInorderTraversal;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/21 18:32
 * @Description:
 */
public class BinaryTreeInorderTraversal02 {

    public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        if (root == null) return result;

        Stack<TreeNode> stack = new Stack<>();
        TreeNode node = root;
        while (node != null || !stack.isEmpty()) {
            while (node != null) {
                stack.push(node);
                node = node.left;
            }
            // 左 根
            node = stack.pop();
            result.add(node.val);
            // 右
            node = node.right;
        }
        return result;
    }
}
