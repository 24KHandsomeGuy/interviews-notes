package com.bibabo.algorithm.leetcode.No104MaximumDepthOfBinaryTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.LinkedList;
import java.util.Queue;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/22 16:32
 * @Description: 广度优先搜索
 */
public class MaximumDepthOfBinaryTree01 {

    public int maxDepth(TreeNode root) {
        int maxDepth = 0;
        if (root == null) return maxDepth;
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        while (!queue.isEmpty()) {
            int size = queue.size();
            maxDepth++;
            for (int i = 0; i < size; i++) {
                TreeNode node = queue.poll();
                if (node.left != null) {
                    queue.offer(node.left);
                }
                if (node.right != null) {
                    queue.offer(node.right);
                }
            }
        }
        return maxDepth;
    }
}
