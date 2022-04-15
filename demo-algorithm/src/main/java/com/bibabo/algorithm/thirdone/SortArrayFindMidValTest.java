package com.bibabo.algorithm.thirdone;

/**
 * @author fukuixiang
 * @date 2020/9/11
 * @time 10:06
 * @description have two sorted array , calculate merged middle position number
 * [1,3,5,7] [2,4] == 4
 */
public class SortArrayFindMidValTest {

    public static void main(String[] args) {

        int[] nums1 = new int[] {1,3,5,7};
        int[] nums2 = new int[] {2,4};
        System.out.println(mergeMethod(nums1,nums2));

        System.out.println(cursorPointerMethod(nums1,nums2));
    }


    /**
     *
     * merging method
     * time complexity O(m + n)
     * space complexity O(m + n)
     * @param nums1
     * @param nums2
     * @return
     */
    public static double mergeMethod(int[] nums1,int[] nums2) {
        int m = nums1.length;
        int n = nums2.length;
        int[] nums = new int[m + n];//merger array

        int count = 0;//counter
        int i = 0;//nums1 current index
        int j = 0;//nums2 current index

        while (count != (m + n)) {

            if (i == m) {
                while (j < n) {
                    nums[count++] = nums2[j++];
                }
                break;
            }
            if (j == n) {
                while (i < m) {
                    nums[count++] = nums1[i++];
                }
                break;
            }

            if (nums1[i] > nums2[j]) {
                nums[count++] = nums2[j++];
            } else {
                nums[count++] = nums1[i++];
            }
        }
        double d;
        if (nums.length % 2 == 0) {
            d = ((double) nums[nums.length / 2 - 1] + nums[nums.length / 2]) / 2;
        } else {
            d = nums[nums.length / 2];
        }

        return d;
    }

    /**
     * init two pointer point two array s index 0 position
     * @param nums1
     * @param nums2
     * @return
     */
    public static double cursorPointerMethod(int[] nums1,int[] nums2) {

        int m = nums1.length;
        int n = nums2.length;
        int len = m + n;

        int left = -1;int right = -1;
        int startIndex1 = 0;int startIndex2 = 0;
        int count = 0;

        while (count <= len / 2) {
            count ++;
            left = right;
            if (startIndex1 < m && (startIndex2 >= n || nums1[startIndex1] < nums2[startIndex2])) {
                right = nums1[startIndex1++];
            } else {
                right = nums2[startIndex2++];
            }
        }
        if ((len & 1) == 0) {
            return ((double) left + right) / 2;
        } else {
            return right;
        }

    }

}
