package com.bibabo.algorithm.leetcode.No700SearchInaBinarySearchTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.LinkedList;
import java.util.Queue;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/26 16:44
 * @Description: 二叉树得查找
 */
public class SearchInaBinarySearchTree01 {

    public TreeNode searchBST(TreeNode root, int val) {
        if (root == null) return root;
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll();
            if (node.val == val) {
                return node;
            }
            if (node.left != null) {
                queue.offer(node.left);
            }
            if (node.right != null) {
                queue.offer(node.right);
            }
        }
        return null;
    }
}
