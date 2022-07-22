package com.bibabo.algorithm.leetcode.No101SymmetricTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.LinkedList;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/22 16:58
 * @Description: 二叉树是否是轴对称
 */
public class SymmetricTree01 {

    public boolean isSymmetric(TreeNode root) {
        if (root == null) return false;
        LinkedList<TreeNode> queueLeft = new LinkedList<>();
        LinkedList<TreeNode> queueRight = new LinkedList<>();
        queueLeft.offer(root.left);
        queueRight.push(root.right);
        while (!queueLeft.isEmpty() || !queueRight.isEmpty()) {
            int queueSize = queueLeft.size();
            int stackSize = queueRight.size();
            if (queueSize != stackSize) {
                return false;
            }
            for (int i = 1; i <= queueSize; i++) {
                TreeNode queueElement = queueLeft.poll();
                TreeNode stackElement = queueRight.pop();
                if (queueElement == null && stackElement == null) continue;
                if (queueElement == null || stackElement == null) return false;
                if (queueElement.val != stackElement.val) return false;
                queueLeft.offer(queueElement.left);
                queueLeft.offer(queueElement.right);
                queueRight.offer(stackElement.right);
                queueRight.offer(stackElement.left);
            }

        }
        return true;
    }
}
