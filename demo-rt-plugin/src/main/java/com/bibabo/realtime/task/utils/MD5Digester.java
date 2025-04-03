package com.bibabo.realtime.task.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * MD5计算类
 */
public final class MD5Digester {
    private static final Logger log = LoggerFactory.getLogger(MD5Digester.class);
    private static final int TWO = 2;
    private static final int OXFF = 0XFF;
    private static MD5Digester instance = null;
    private static Lock lock = new ReentrantLock();
    private MessageDigest md5 = null;

    private MD5Digester() {
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            log.error("NoSuchAlgorithmException happen", e);
        }
    }

    /**
     * 获取实例<br>
     *
     * @return 实例
     * @since SEC V100R002, Mar 27, 2010
     */
    public static MD5Digester getInstance() {
        if (instance == null) {
            lock.lock();
            try {
                if (instance == null) {
                    instance = new MD5Digester();
                }
            } finally {
                lock.unlock();
            }
        }
        return instance;
    }

    /**
     * 使用MD5算法对字符串进行摘要计算
     *
     * @param str 要计算的字符串
     * @return 摘要信息
     */
    public synchronized String digest(String str) {
        if (str == null) return null;
        return digest(str.getBytes());
    }

    /**
     * 获取byte数组的MD5摘要信息
     *
     * @param raw 需要转换的byte数组
     * @return 摘要信息
     */
    public synchronized String digest(byte[] raw) {
        byte[] digest = md5.digest(raw);
        return byteArr2HexStr(digest);
    }

    /**
     * 将byte数组转换为表示16进制值的字符串，如：byte[]{8,18}转换为：0813
     *
     * @param raw 需要转换的byte数组
     * @return 转换后的字符串
     */
    private String byteArr2HexStr(byte[] raw) {
        final int iLen = raw.length;
// 每个byte用两个字符才能表示，所以字符串的长度是数组长度的两倍
        StringBuilder sb = new StringBuilder(raw.length * TWO);
        String stmp = null;
        for (int i = 0; i < iLen; i++) {
            stmp = Integer.toHexString(raw[i] & OXFF);
            if (stmp.length() == 1) {
                sb.append("0").append(stmp);
            } else {
                sb.append(stmp);
            }
        }
        return sb.toString();
    }

    public static String getHexStr(String content) throws Exception {
        MD5Digester md5 = MD5Digester.getInstance();
        return toHex(content.getBytes("UTF-8"));
    }

    private static String toHex(byte[] bytes) {
        final char[] HEX_DIGITS = "0123456789ABCDEF".toCharArray();
        StringBuilder ret = new StringBuilder(bytes.length * 2);
        for (int i = 0; i < bytes.length; i++) {
            ret.append(HEX_DIGITS[(bytes[i] >> 4) & 0x0f]);
            ret.append(HEX_DIGITS[bytes[i] & 0x0f]);
        }
        return ret.toString();
    }
}