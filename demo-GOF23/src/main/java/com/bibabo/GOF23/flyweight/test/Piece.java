package com.bibabo.GOF23.flyweight.test;

/**
 * @author fukuixiang
 * @date 2021/2/24
 * @time 18:46
 * @description
 */
public class Piece {

    private int color;// 1:white 2:black

    public Piece(int color) {
        this.color = color;
    }

    public void downPiece(Point point, Board board) {
        board.savePiece(point, this);
    }
}
