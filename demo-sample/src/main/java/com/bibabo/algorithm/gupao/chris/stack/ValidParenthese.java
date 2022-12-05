package com.bibabo.algorithm.gupao.chris.stack;

import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

/**
 * @Author: FuKuiXiang
 * @Date: 2022/11/1 15:29
 * @Description:
 */
public class ValidParenthese {

    public static void main(String[] args) {

    }

    public boolean isValid(String s) {
        if (s == null || "".equals(s) || s.length() % 2 == 1) {
            return false;
        }
        Map<Character, Character> map = new HashMap<>();
        map.put('}', '{');
        map.put(']', '[');
        map.put(')', '(');
        Stack<Character> openBracketStack = new Stack<>();
        // 1.开括号多余闭括号  遍历到最后openBracketStack还有剩余说明开括号多
        // 2.闭括号多余开括号  闭括号还未遍历完，openBracketStack就为空了
        // 3.开闭括号数量一致，但存在开闭不对称情况
        // 4.字符串完全match条件
        for (char c : s.toCharArray()) {
            // 开括号，入栈
            if (map.containsKey(c)) {
                openBracketStack.push(c);
            } else {
                // 闭括号，将开括号出栈并比较，如果不正确直接返回false
                if (openBracketStack.isEmpty() || map.get(c) != openBracketStack.pop()) {
                    return false;
                }
            }
        }
        return openBracketStack.isEmpty();
    }
}
