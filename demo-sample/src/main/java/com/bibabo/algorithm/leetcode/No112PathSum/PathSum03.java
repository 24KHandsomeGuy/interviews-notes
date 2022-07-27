package com.bibabo.algorithm.leetcode.No112PathSum;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/26 15:01
 * @Description: 递归
 * 一层一层递减  减到叶子节点
 */
public class PathSum03 {

    public boolean hasPathSum(TreeNode root, int targetSum) {
        if (root == null) return false;
        if (root.left == null && root.right == null)
            return root.val == targetSum;
        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val);
    }
}
