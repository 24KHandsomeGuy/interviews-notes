package com.bibabo.GOF23.flyweight.test;

import java.io.IOException;

/**
 * @author fukuixiang
 * @date 2021/2/24
 * @time 17:36
 * @description 练习下面向对象思想 写代码
 * 现在我要实现一个下五子棋的功能，都要有哪些类呢
 * 1.棋盘 棋盘要存落点，点位
 * 2.棋子 黑白棋子
 * 3.点位 点位要有唯一性
 */
public class Test {

    public static void main(String[] args) throws IOException {

        // 创建一个棋盘 19 * 19
        Board board = new Board(19);

        // 白方第一步
        // 创建一颗白色棋子
        Piece white1 = new Piece(1);
        // 创建这颗棋子所要下到棋盘的经纬度 10 10 是棋盘的中心点
        Point whitePoint1 = new Point(10, 10);
        // 落子
        white1.downPiece(whitePoint1, board);

        // 黑方第一步
        // 创建一颗黑色棋子
        Piece black1 = new Piece(2);
        // 创建这颗棋子所要下到棋盘的经纬度 10 10 是棋盘的中心点
        Point blackPoint1 = new Point(9, 11);
        // 落子
        black1.downPiece(blackPoint1, board);

        System.in.read();

    }

}
