package com.bibabo.algorithm.leetcode.No700SearchInaBinarySearchTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/26 16:44
 * @Description: 二叉查找树得查找
 */
public class SearchInaBinarySearchTree03 {

    public TreeNode searchBST(TreeNode root, int val) {
        if (root == null) return root;
        if (root.val == val) return root;
        return searchBST(root.val < val ? root.right : root.left, val);
    }
}
