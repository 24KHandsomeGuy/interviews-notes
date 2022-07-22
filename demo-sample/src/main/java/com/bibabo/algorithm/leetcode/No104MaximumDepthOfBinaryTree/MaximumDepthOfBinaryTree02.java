package com.bibabo.algorithm.leetcode.No104MaximumDepthOfBinaryTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/22 16:32
 * @Description: 深度优先搜索
 */
public class MaximumDepthOfBinaryTree02 {

    public int maxDepth(TreeNode root) {
        int maxDepth = 0;
        if (root == null) return maxDepth;
        int leftHeight = maxDepth(root.left);
        int rightHeight = maxDepth(root.right);
        return Math.max(leftHeight, rightHeight) + 1;
    }
}
