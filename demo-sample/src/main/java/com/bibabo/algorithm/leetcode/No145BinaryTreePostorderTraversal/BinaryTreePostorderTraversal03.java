package com.bibabo.algorithm.leetcode.No145BinaryTreePostorderTraversal;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/21 18:59
 * @Description: 后序遍历 左右根
 * 这里先仿照先序遍历的根左右，先求出根右左，取反得出，左右根
 * 不建议这种方法，结果虽是一致的，但是失去了"按序遍历"
 */
public class BinaryTreePostorderTraversal03 {

    public List<Integer> postorderTraversal(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        if (root == null) return result;

        Stack<TreeNode> stack = new Stack<>();
        TreeNode node = root;
        while (!stack.isEmpty() || node != null) {
            while (node != null) {
                stack.push(node);
                result.add(node.val);
                node = node.right;
            }
            node = stack.pop();
            node = node.left;
        }

        Collections.reverse(result);
        return result;
    }
}
