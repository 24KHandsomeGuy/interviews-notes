package com.bibabo.algorithm.leetcode.No53MaximumSubarrarySum;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/7 16:24
 * @Description:
 */
public class MaximumSubarraySum02 {

    public int maxSubArray(int[] nums) {
        return getInfo(nums, 0, nums.length - 1).msum;
    }

    public Status getInfo(int[] a, int left, int right) {
        if (left == right) {
            return new Status(a[left], a[left], a[left], a[left]);
        }
        int m = (left + right) >> 1;
        Status lSub = getInfo(a, left, m);
        Status rSub = getInfo(a, m + 1, right);
        return pushUp(lSub, rSub);
    }

    private Status pushUp(Status lSub, Status rSub) {
        int lsum = Math.max(lSub.lsum, rSub.lsum + lSub.isum);
        int rsum = Math.max(rSub.rsum, lSub.rsum + rSub.isum);
        int isum = lSub.isum + rSub.isum;
        int msum = Math.max(Math.max(lSub.msum, rSub.msum), lSub.rsum + rSub.lsum);
        Status status = new Status(lsum, rsum, isum, msum);
        System.out.println("上升回旋:" + status);
        return status;
    }

    private static class Status {

        public int lsum, rsum, isum, msum;

        public Status(int lsum, int rsum, int isum, int msum) {
            this.lsum = lsum;
            this.rsum = rsum;
            this.isum = isum;
            this.msum = msum;
        }

        @Override
        public String toString() {
            return "Status{" +
                    "lsum=" + lsum +
                    ", rsum=" + rsum +
                    ", isum=" + isum +
                    ", msum=" + msum +
                    '}';
        }
    }
}
