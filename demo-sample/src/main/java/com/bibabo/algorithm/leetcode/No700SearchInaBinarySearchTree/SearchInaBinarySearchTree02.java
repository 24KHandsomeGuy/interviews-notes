package com.bibabo.algorithm.leetcode.No700SearchInaBinarySearchTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/26 16:44
 * @Description: 二叉查找树得查找
 */
public class SearchInaBinarySearchTree02 {

    public TreeNode searchBST(TreeNode root, int val) {
        if (root == null) return root;

        while (root != null) {
            if (root.val == val) {
                return root;
            }
            root = val > root.val ? root.right : root.left;
        }
        return null;
    }
}
