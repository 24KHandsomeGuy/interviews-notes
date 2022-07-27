package com.bibabo.algorithm.leetcode.No112PathSum;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.LinkedList;
import java.util.Queue;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/26 15:01
 * @Description: 广度优先层序遍历
 */
public class PathSum02 {

    public boolean hasPathSum(TreeNode root, int targetSum) {
        if (root == null) return false;

        Queue<Integer> sumQueue = new LinkedList<>();
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        sumQueue.offer(root.val);
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll();
            int sum = sumQueue.poll();
            // 叶子节点
            if (node.left == null && node.right == null) {
                if (sum == targetSum) {
                    return true;
                }
                continue;
            }
            if (node.left != null) {
                queue.offer(node.left);
                sumQueue.offer(node.left.val + sum);
            }
            if (node.right != null) {
                queue.offer(node.right);
                sumQueue.offer(node.right.val + sum);
            }
        }
        return false;
    }
}
