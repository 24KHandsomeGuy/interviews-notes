package com.bibabo.algorithm.unknow.thirdone.a20210310;

/**
 * @author fukuixiang
 * @date 2021/3/10
 * @time 18:38
 * @description
 */
public class BinarySearch {

    public static void main(String[] args) {

        int[] arr = new int[]{1,5,10,20,60,77};
        int index = binarySearch(arr, 0);
        System.out.println(index);

    }

    private static int binarySearch(int[] arr, int e) {
        int index = -1;

        int low = 0;
        int high = arr.length - 1;

        int middle;
        int cacheVal;
        while (high >= low) {
            middle = (high + low) >> 2;
            if ((cacheVal = arr[middle]) == e) {
                return middle;
            }
            if (e > cacheVal) {
                low = middle + 1;
                continue;
            }
            if (e < cacheVal) {
                high = middle - 1;
            }
        }

        return index;
    }

}
