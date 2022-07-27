package com.bibabo.algorithm.leetcode.No653TwoNumSumBST;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/27 11:13
 * @Description: 两数之和，二叉查找树
 * 因为是二叉查找树，中序遍历放入list则自然升序
 * 双指针游标，头尾相加小于目标值则left游标右移，反之right游标左移
 *
 * 双指针 + 中序遍历 + 深度优先搜索
 */
public class TwoNumSumBST03 {

    public boolean findTarget(TreeNode root, int k) {
        if (root == null) return false;
        List<Integer> list = new ArrayList<>();
        inorderTraversal(root, list);
        int left = 0, right = list.size() - 1;
        while (left < right) {
            if (list.get(left) + list.get(right) == k) {
                return true;
            }
            if (list.get(left) + list.get(right) < k) {
                left++;
            } else {
                right--;
            }
        }
        return false;
    }

    private void inorderTraversal(TreeNode root, List<Integer> list) {
        if (root == null) return;
        inorderTraversal(root.left, list);
        list.add(root.val);
        inorderTraversal(root.right, list);
    }
}
