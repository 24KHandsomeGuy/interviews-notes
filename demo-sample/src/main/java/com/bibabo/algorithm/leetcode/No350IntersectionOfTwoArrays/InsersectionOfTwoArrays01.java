package com.bibabo.algorithm.leetcode.No350IntersectionOfTwoArrays;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/13 20:18
 * @Description:
 */
public class InsersectionOfTwoArrays01 {
    public int[] intersect(int[] nums1, int[] nums2) {
        List<Integer> intersectList = new ArrayList<>();
        Map<Integer, Integer> timesMap = new HashMap<>();
        for (int i = 0; i < nums1.length; i++) {
            Integer value = timesMap.get(nums1[i]);
            if (value != null) {
                timesMap.put(nums1[i], ++value);
            } else {
                timesMap.put(nums1[i], 1);
            }
        }

        for (int i = 0; i < nums2.length; i++) {
            Integer value = timesMap.get(nums2[i]);
            if (value != null && value > 0) {
                intersectList.add(nums2[i]);
                timesMap.put(nums2[i], --value);
            }
        }

        int[] intersectArr = new int[intersectList.size()];
        for (int i = 0; i < intersectArr.length; i++) {
            intersectArr[i] = intersectList.get(i);
        }
        return intersectArr;
    }
}
