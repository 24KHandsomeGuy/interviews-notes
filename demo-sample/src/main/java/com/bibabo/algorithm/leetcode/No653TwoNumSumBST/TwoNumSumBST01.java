package com.bibabo.algorithm.leetcode.No653TwoNumSumBST;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.HashSet;
import java.util.Set;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/27 11:13
 * @Description: 两数之和，二叉查找树
 * 递归深度优先搜索
 *
 */
public class TwoNumSumBST01 {

    public boolean findTarget(TreeNode root, int k) {
        if (root == null) return false;

        Set<Integer> set = new HashSet<>();
        return findTarget(root, k, set);
    }

    private boolean findTarget(TreeNode root, int k, Set<Integer> set) {
        if (root == null) {
            return false;
        }
        if (set.contains(k - root.val)) {
            return true;
        }
        set.add(root.val);
        return findTarget(root.left ,k ,set) || findTarget(root.right ,k ,set);
    }
}
