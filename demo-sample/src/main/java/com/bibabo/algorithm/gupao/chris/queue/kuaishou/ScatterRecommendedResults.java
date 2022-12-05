package com.bibabo.algorithm.gupao.chris.queue.kuaishou;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/2 15:56
 * @Description: 打散推荐结果
 * 快手面试题
 * 快手是一款短视频app，推荐的内容包含视频video和图片picture。
 * 为保证用户体验，获取到的video和picture需要保证每三个片段中至多仅存在一条picture
 * 如：0_video, 1_video, 2_video, 3_picture, 4_picture, 5_picture, 6_video, 7_picture, 8_video, 9_video
 * 0_video, 1_video, 2_video, 3_picture, 6_video, 8_video, 4_picture, 9_video
 */
public class ScatterRecommendedResults {

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("0_video");
        list.add("1_video");
        list.add("2_video");
        list.add("3_picture");
        list.add("4_picture");
        list.add("5_picture");
        list.add("6_video");
        list.add("7_picture");
        list.add("8_video");
        list.add("9_video");

        // List<String> result = scatterRecommendedResults(list, 3);
        // List<String> result = scatterRecommendedResults(list, 4);
        List<String> result = scatterRecommendedResults(list, 5);
        for (String s : result) {
            System.out.println(s);
        }
    }

    /**
     * 打散推荐结果
     *
     * @param list        推荐的结果集
     * @param maxInterval 最大间隔多少video打散
     * @return
     */
    public static List<String> scatterRecommendedResults(List<String> list, int maxInterval) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        List<String> result = new ArrayList<>(list.size());
        Queue<String> videoQueue = new LinkedList<>();
        Queue<String> picQueue = new LinkedList<>();
        // 1.从头寻找，在第一张picture之前的第一批video需要直接放入result中
        int index = 0;
        for (; index < list.size(); index++) {
            String s = list.get(index);
            if (s.contains("v")) {
                result.add(s);
            } else {
                break;
            }
        }
        // 2.视频放到视频的queue中，图片放到图片的queue中
        for (; index < list.size(); index++) {
            String s = list.get(index);
            if (s.contains("v")) {
                videoQueue.offer(s);
            } else {
                picQueue.offer(s);
            }
        }
        // 3.video和picture保证先进先出，填充结果集
        int currVideoNum = result.size();
        while (!videoQueue.isEmpty()) {
            if (currVideoNum >= maxInterval - 1 && !picQueue.isEmpty()) {
                result.add(picQueue.poll());
                currVideoNum = 0;
            }
            result.add(videoQueue.poll());
            currVideoNum++;
        }
        if (currVideoNum == maxInterval - 1 && !picQueue.isEmpty()) {
            result.add(picQueue.poll());
        }
        return result;
    }
}
