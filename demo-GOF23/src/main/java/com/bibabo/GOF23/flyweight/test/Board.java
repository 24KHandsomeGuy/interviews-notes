package com.bibabo.GOF23.flyweight.test;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author fukuixiang
 * @date 2021/2/25
 * @time 9:52
 * @description
 */
public class Board {

    private final Map<Point, Piece> map = new ConcurrentHashMap<>();

    private int length;

    public Board(int length) {
        this.length = length;
    }

    /**
     * 落子
     *
     * @param point 位置
     * @param piece 棋子
     */
    public void savePiece(Point point, Piece piece) {
        if (point.getLatitude() > length || point.getLongitude() > length) {
            throw new RuntimeException("已超出棋盘的范围");
        }
        map.put(point, piece);
    }

}
