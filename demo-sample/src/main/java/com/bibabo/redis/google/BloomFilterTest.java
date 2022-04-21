package com.bibabo.redis.google;

import com.google.common.hash.BloomFilter;
import com.google.common.hash.Funnels;

/**
 * @author fukuixiang
 * @date 2020/7/16
 * @time 9:37
 * @description
 */
public class BloomFilterTest {

    public static void main(String[] args) {
        int expectedInsertions = 3000;//预期会存放到布隆里的的大小

        BloomFilter<Integer> bloomFilter = BloomFilter.create(Funnels.integerFunnel(),expectedInsertions,0.00005);//创建布隆过滤器

        long startMillis = System.currentTimeMillis();
        for (int i = 0; i < expectedInsertions;i ++) {
            bloomFilter.put(i);//向布隆过滤器添加
        }
        long endMillis = System.currentTimeMillis();
        System.err.println("总时长：" + (endMillis - startMillis));

        for (int i = expectedInsertions; i < expectedInsertions * 2;i ++) {
            bloomFilter.put(i);//向布隆过滤器添加
        }
        /*for (int i = 0; i < expectedInsertions;i ++) {
            if (!bloomFilter.mightContain(i)) {//检验已存在的元素是否判断成功
                System.err.println("本应存在 但是不存在" + i);
            }
        }

        int cnt = 0;
        for (int i = expectedInsertions; i < expectedInsertions * 2;i ++) {
            if (bloomFilter.mightContain(i)) {
                System.err.println("本应不存在 但是存在" + i);
                cnt ++;
            }
        }


        System.out.println(cnt);*/
    }

}
