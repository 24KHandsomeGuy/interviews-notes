package com.bibabo.algorithm.leetcode.No653TwoNumSumBST;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.Stack;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/27 11:13
 * @Description: 两数之和，二叉查找树
 * 双指针 + 中序遍历 + 迭代
 * 相比于方法3，方法4的不需要先按序装进list集合中，而是直接遍历
 */
public class TwoNumSumBST04 {

    public boolean findTarget(TreeNode root, int k) {
        if (root == null) return false;

        Stack<TreeNode> leftStack = new Stack<>();
        TreeNode left = root;
        leftStack.push(left);
        while (left.left != null) {
            leftStack.push(left.left);
            left = left.left;
        }
        Stack<TreeNode> rightStack = new Stack<>();
        TreeNode right = root;
        rightStack.push(right);
        while (right.right != null) {
            rightStack.push(right.right);
            right = right.right;
        }
        // 自底向上遍历
        while (left != right) {
            if (left.val + right.val == k) {
                return true;
            }
            if (left.val + right.val < k) {
                // 加左
                TreeNode node1 = leftStack.pop();
                // 左子树是不是和迭代遍历树一样！！！也是中序遍历左根右
                TreeNode node2 = node1.right;
                while (node2 != null) {
                    leftStack.push(node2);
                    node2 = node2.left;
                }
                left = node1;
            } else {
                // 减右
                TreeNode node1 = rightStack.pop();
                // 右根左，和中序遍历相反
                TreeNode node2 = node1.left;
                while (node2 != null) {
                    rightStack.push(node2);
                    node2 = node2.right;// 右放到当前根节点之前出栈
                }
                right = node1;
            }
        }
        return false;
    }


}
