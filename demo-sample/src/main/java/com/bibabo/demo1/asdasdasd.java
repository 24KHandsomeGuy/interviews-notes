package com.bibabo.demo1;

public class asdasdasd {

    public static void main(String[] args) {

        try {
            throw new RuntimeException("throw a exception");
        }catch (Exception e) {
            System.exit(0);
        } finally {
            System.out.println("finally");
        }

    }
}
