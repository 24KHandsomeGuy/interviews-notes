package com.bibabo.algorithm.datastructure.linked.ringlinked;

import java.util.HashMap;
import java.util.Map;

/**
 * @author fukuixiang
 * @date 2020/9/11
 * @time 15:17
 * @description joseph murder in circles event
 *  all people enclosure a ring, peopele count number one by one,i will kill him when who counts 3
 */
public class JosephMurderInCircles {

    private static final int NUMBER = 3;

    public static void main(String[] args) {

        int[] peopleIds = new int[] {1,2,3,4,5,6,7,8,9,10,11};
        People firstOne = createOnePeopleCycleLined(peopleIds);
        Map<String,Object> corpsesAndSurvivorsMap = killing(firstOne,peopleIds.length);
        People[] corpses = (People[]) corpsesAndSurvivorsMap.get("corpses");
        People survivor = (People) corpsesAndSurvivorsMap.get("survivor");

        System.out.println("corpses:----");
        for (People p : corpses) {
            System.out.println(p.getId());
        }
        System.out.println("survivor:----");
        System.out.println(survivor.getId());

    }

    /**
     * time complexity O(3 * n)
     * space complexity O(n)
     *
     * {1,2,3,4,5,6,7,8,9,10,11}
     * {1,2,4,5,6,7,8,9,10,11}
     * {1,2,4,5,7,8,9,10,11}
     * {1,2,4,5,7,8,10,11}
     * {2,4,5,7,8,10,11}
     * {2,4,7,8,10,11}
     * {2,4,7,8,11}
     * {2,7,8,11}
     * {2,7,8}
     * {2,7}
     * {7}
     * 11 * 3
     * @param firstOne
     * @param num
     * @return
     */
    private static Map<String,Object> killing(People firstOne, int num) {
        Map<String,Object> map = new HashMap<String, Object>();
        People[] corpses = new People[num - 1];
        People survivor;

        int alive = num;
        int count = 1;
        People head = firstOne;
        People pre = null;
        People curr = firstOne;
        while (alive > 1) {
            if (count == NUMBER) {
                if (head == curr) {
                    head = curr.getNext();
                }
                corpses[num - alive--] = curr;//dead
                pre.setNext(curr.getNext());
                count = 1;
            } else {
                count ++;
                pre = curr;

            }
            curr = curr.getNext();
        }
        survivor = head;
        map.put("survivor",survivor);
        map.put("corpses",corpses);
        return map;
    }

    private static People createOnePeopleCycleLined(int[] peopleIds) {

        People head = null;
        People tail = null;

        for (int i =0;i < peopleIds.length;i ++) {
            if (head == null) {
                tail = head = new People(peopleIds[i]);
            } else {
                People tmp = new People(peopleIds[i]);
                tail.setNext(tmp);
                tail = tmp;
            }
        }
        //ring linked
        tail.setNext(head);

        return head;
    }

    public static class People {

        People next;
        int id;

        public People(int id) {
            this.id = id;
        }

        public People getNext() {
            return next;
        }

        public void setNext(People next) {
            this.next = next;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }
    }

}
