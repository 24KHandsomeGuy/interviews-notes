package com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/21 16:31
 * @Description:
 */
public class BinaryTreePreorderTraversal02 {

    public List<Integer> preorderTraversal(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        if (root == null) return result;
        preorder(root, result);
        return result;
    }

    public void preorder(TreeNode root, List<Integer> values) {
        if (root == null) {
            return;
        }
        values.add(root.val);
        preorder(root.left, values);
        preorder(root.right, values);
    }
}
