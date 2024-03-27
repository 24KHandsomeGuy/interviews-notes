package com.bibabo.collections.array;

/**
 * @Author: Damon Fu
 * @Date: 2022/7/14 14:21
 * @Description:
 */
public class TwoDimensionalArrayTest {

    public static void main(String[] args) {

        int[][] arr = new int[2][4];
        int[] firstArr = new int[4];
        firstArr[0] = 10086;
        arr[0] = firstArr;
        for (int i = 0;i < arr.length; i++) {
            int[] innerArr = arr[i];
            if (innerArr == null) {
                continue;
            }
            for (int j = 0; j < innerArr.length; j++) {
                System.out.println(innerArr[j]);
            }
        }
    }

}
