package com.bibabo.demo;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/22 14:29
 * @Description:
 */
public class BinaryTreeTraversalTest {

    /**
     * 前序遍历 根 左 右
     *
     * @param root
     * @return
     */
    public List<Integer> preorder(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        if (root == null) return result;
        Stack<TreeNode> stack = new Stack<>();
        TreeNode node = root;
        while (node != null || !stack.isEmpty()) {
            while (node != null) {
                stack.push(node);
                // 从根节点出发沿左子节点一直向下寻找
                result.add(node.val);
                node = node.left;
            }
            node = stack.pop();
            node = node.right;
        }
        return result;
    }

    /**
     * 中序遍历 左 根 右
     *
     * @param root
     * @return
     */
    public List<Integer> inorder(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        if (root == null) return result;
        Stack<TreeNode> stack = new Stack<>();
        TreeNode node = root;
        while (node != null || !stack.isEmpty()) {
            while (node != null) {
                stack.push(node);
                node = node.left;
            }
            node = stack.pop();
            result.add(node.val);
            node = node.right;
        }
        return result;
    }

    /**
     * 后序遍历 左 右 根
     *
     * @param root
     * @return
     */
    public List<Integer> postorder(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        if (root == null) return result;
        Stack<TreeNode> stack = new Stack<>();
        TreeNode node = root;
        TreeNode prev = null;
        while (node != null || !stack.isEmpty()) {
            while (node != null) {
                stack.push(node);
                node = node.left;
            }
            node = stack.pop();
            // 如果没有右子节点或者右子节点已经遍历过了，那么当前root节点可以遍历
            if (node.right != null || node.right == prev) {
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
