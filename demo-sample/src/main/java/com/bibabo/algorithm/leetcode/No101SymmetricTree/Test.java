package com.bibabo.algorithm.leetcode.No101SymmetricTree;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/22 17:37
 * @Description:
 */
public class Test {

    public static void main(String[] args) {

        TreeNode node3_1 = new TreeNode(3, null, null);
        TreeNode node3_2 = new TreeNode(4, null, null);
        TreeNode node3_3 = new TreeNode(4, null, null);
        TreeNode node3_4 = new TreeNode(3, null, null);

        TreeNode node2_1 = new TreeNode(2, node3_1, node3_2);
        TreeNode node2_2 = new TreeNode(2, node3_3, node3_4);

        TreeNode root = new TreeNode(1, node2_1, node2_2);
        SymmetricTree01 symmetricTree01 = new SymmetricTree01();
        symmetricTree01.isSymmetric(root);
    }
}
