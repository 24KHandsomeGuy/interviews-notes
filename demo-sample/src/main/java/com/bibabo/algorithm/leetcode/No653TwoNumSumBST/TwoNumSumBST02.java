package com.bibabo.algorithm.leetcode.No653TwoNumSumBST;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/27 11:13
 * @Description: 两数之和，二叉查找树
 * 广度优先搜索
 *
 * 这两种方法都是借助Set的特性。树的遍历 + set
 */
public class TwoNumSumBST02 {

    public boolean findTarget(TreeNode root, int k) {
        if (root == null) return false;

        Set<Integer> set = new HashSet<>();
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll();
            if (set.contains(k - node.val)) {
                return true;
            }
            set.add(node.val);
            if (node.left != null) queue.offer(node.left);
            if (node.right != null) queue.offer(node.right);
        }
        return false;
    }
}
