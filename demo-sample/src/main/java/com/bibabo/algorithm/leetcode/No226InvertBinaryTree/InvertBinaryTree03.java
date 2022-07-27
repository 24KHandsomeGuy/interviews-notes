package com.bibabo.algorithm.leetcode.No226InvertBinaryTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.LinkedList;
import java.util.Queue;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/26 14:12
 * @Description: 深度优先遍历
 */
public class InvertBinaryTree03 {

    public TreeNode invertTree(TreeNode root) {
        if (root == null) return root;

        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        TreeNode tempNode;
        while (!queue.isEmpty()) {
            int size = queue.size();
            for (int i = 0; i < size; i++) {
                TreeNode node = queue.poll();
                tempNode = node.left;
                node.left = node.right;
                node.right = tempNode;
                if (node.left != null) {
                    queue.offer(node.left);
                }
                if (node.right != null) {
                    queue.offer(node.right);
                }
            }
        }
        return root;
    }
}
