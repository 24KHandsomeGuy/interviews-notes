package com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/21 16:31
 * @Description: 这种递归简单明了，那官方为什么解的如此复杂呢？
 */
public class BinaryTreePreorderTraversal04 {

    public List<Integer> preorderTraversal(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        if (root == null) return result;
        TreeNode node = root;
        Stack<TreeNode> stack = new Stack<>();

        stack.push(node);
        while (!stack.isEmpty()) {
            node = stack.pop();
            result.add(node.val);

            if (node.right != null) {
                stack.push(node.right);
            }
            if (node.left != null) {
                stack.push(node.left);
            }
        }
        return result;
    }
}
