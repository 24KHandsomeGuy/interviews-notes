package com.bibabo.algorithm.unknow.thirdone.datastructure.linked.lru;

/**
 * @author fukuixiang
 * @date 2020/9/15
 * @time 19:09
 * @description
 */
public class SimpleLruTest {

    public static void main(String[] args) {

        SimpleLRU simpleLRU = new SimpleLRU(3);
        //System.out.println(simpleLRU.get(1));
        simpleLRU.put(1,1);
        simpleLRU.put(1,11);
        simpleLRU.put(2,2);
        simpleLRU.put(3,3);
        simpleLRU.put(4,4);
        simpleLRU.put(5,5);
        simpleLRU.put(5,55);

        Node currNode = simpleLRU.dummyHead.next;
        while (currNode.value != -1) {
            System.out.println(currNode.value);
            currNode = currNode.next;
        }
    }

}
