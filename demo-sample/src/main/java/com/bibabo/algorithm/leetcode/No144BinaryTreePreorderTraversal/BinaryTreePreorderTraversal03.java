package com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/21 16:31
 * @Description: 需要记住遍历根节点后，遍历左子节点，的根节点是什么，后进先出。
 * 方法1、2借助方法栈实现的，此处使用stack记录未遍历右子节点的根节点们
 */
public class BinaryTreePreorderTraversal03 {

    public List<Integer> preorderTraversal(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        if (root == null) return result;
        TreeNode node = root;
        Stack<TreeNode> stack = new Stack<>();
        while (node != null || !stack.isEmpty()) {
            while (node != null) {
                // 根
                result.add(node.val);
                stack.push(node);
                // 左
                node = node.left;
            }
            // 根
            node = stack.pop();
            // 右
            node = node.right;
        }
        return result;
    }
}
