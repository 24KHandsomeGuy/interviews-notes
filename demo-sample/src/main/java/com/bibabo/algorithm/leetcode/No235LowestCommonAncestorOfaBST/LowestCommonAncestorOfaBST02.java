package com.bibabo.algorithm.leetcode.No235LowestCommonAncestorOfaBST;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/27 15:19
 * @Description:
 */
public class LowestCommonAncestorOfaBST02 {

    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        TreeNode answerNode = root;
        while (answerNode != null) {
            if (answerNode.val < p.val && answerNode.val < q.val) {
                answerNode = answerNode.right;
            } else if (answerNode.val > p.val && answerNode.val > q.val) {
                answerNode = answerNode.left;
            } else {
                break;
            }
        }
        return answerNode;
    }
}
