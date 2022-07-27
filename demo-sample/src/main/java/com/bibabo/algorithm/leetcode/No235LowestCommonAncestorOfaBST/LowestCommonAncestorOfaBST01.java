package com.bibabo.algorithm.leetcode.No235LowestCommonAncestorOfaBST;

import com.bibabo.algorithm.leetcode.No144BinaryTreePreorderTraversal.TreeNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/27 15:19
 * @Description:
 */
public class LowestCommonAncestorOfaBST01 {

    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        // 找两个节点的祖先路径
        List<TreeNode> pPath = getPath(root, p);
        List<TreeNode> qPath = getPath(root, q);
        TreeNode answerNode = null;
        for (int i = 0; i < pPath.size() && i < qPath.size(); i++) {
            if (pPath.get(i) == qPath.get(i)) {
                answerNode = pPath.get(i);
            } else {
                break;
            }
        }

        return answerNode;
    }

    private List<TreeNode> getPath(TreeNode root, TreeNode target) {
        // nlog(n)
        List<TreeNode> path = new ArrayList<>();

        while (root != target) {
            path.add(root);
            if (root.val > target.val) {
                root = root.left;
            } else {
                root = root.right;
            }
        }
        path.add(root);
        return path;
    }
}
