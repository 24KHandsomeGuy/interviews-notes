package com.bibabo.algorithm.leetcode.No102BinaryTreeLevelOrderTraversal;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/22 15:54
 * @Description: 层序遍历
 */
public class BinaryTreeLevelOrderTraversal01 {

    public List<List<Integer>> levelOrder(TreeNode root) {
        // linkedlist保证有序
        List<List<Integer>> result = new LinkedList<>();
        if (root == null) return result;

        // 按层遍历
        // 保证先进先出
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        while (!queue.isEmpty()) {
            List<Integer> list = new LinkedList<>();
            result.add(list);
            int currentSize = queue.size();
            for (int i = 1; i <= currentSize; i++) {
                TreeNode node = queue.poll();
                list.add(node.val);
                if (node.left != null) {
                    queue.offer(node.left);
                }
                if (node.right != null) {
                    queue.offer(node.right);
                }
            }
        }
        return result;
    }
}
