package com.bibabo.algorithm.unknow.thirdone.datastructure.stack.closestringsymbol;

import java.util.Stack;

/**
 * @author fukuixiang
 * @date 2020/9/16
 * @time 10:22
 * @description use stack verify the string is can be closed
 *  example : '{' '}' '[' ']' '(' ')'
 */
public class StackCloseStringSymbol {

    public static void main(String[] args) {

        String[] symbols =  {"{","(",")","}"};

        boolean b = verifyIsCanClosedSymbols(symbols);
        System.out.println(b);

    }

    private static boolean verifyIsCanClosedSymbols(String[] symbols) {
        if (symbols == null || symbols.length == 0) {
            return false;
        }
        Stack<String> stack = new Stack<String>();
        for (int i = 0;i < symbols.length;i ++) {
            if (symbols[i].equals("{") || symbols[i].equals("[") || symbols[i].equals("(")) {
                //push stack
                stack.push(symbols[i]);
            } else {
                String top = stack.pop();
                if (top.equals("{") && !symbols[i].equals("}")) {
                    return false;
                }
                if (top.equals("[") && !symbols[i].equals("]")) {
                    return false;
                }
                if (top.equals("(") && !symbols[i].equals(")")) {
                    return false;
                }
            }
        }

        return true;
    }

}
