package com.bibabo.lombok;

import sun.misc.BASE64Decoder;

import java.math.BigInteger;
import java.util.Base64;
import java.util.Random;

public class StringUtil {
    public static String leftPad(String str, int size, String padStr) {
        if (str == null) {
            return null;
        }
        if (padStr == null || "".equals(padStr)) {
            padStr = " ";
        }
        int padLen = padStr.length();
        int strLen = str.length();
        int pads = size - strLen;
        if (pads <= 0) {
            return str; // returns original String when possible
        }
        if (padLen == 1 && pads <= 8192) {
            return leftPad(str, size, padStr.charAt(0));
        }

        if (pads == padLen) {
            return padStr.concat(str);
        } else if (pads < padLen) {
            return padStr.substring(0, pads).concat(str);
        } else {
            char[] padding = new char[pads];
            char[] padChars = padStr.toCharArray();
            for (int i = 0; i < pads; i++) {
                padding[i] = padChars[i % padLen];
            }
            return new String(padding).concat(str);
        }
    }

    public static String leftPad(String str, int size, char padChar) {
        if (str == null) {
            return null;
        }
        int pads = size - str.length();
        if (pads <= 0) {
            return str; // returns original String when possible
        }
        if (pads > 8192) {
            return leftPad(str, size, String.valueOf(padChar));
        }
        return padding(pads, padChar).concat(str);
    }

    private static String padding(int repeat, char padChar) throws IndexOutOfBoundsException {
        if (repeat < 0) {
            throw new IndexOutOfBoundsException("Cannot pad a negative amount: " + repeat);
        }
        final char[] buf = new char[repeat];
        for (int i = 0; i < buf.length; i++) {
            buf[i] = padChar;
        }
        return new String(buf);
    }

    /**
     * 二进制转十六进制
     * @param bytes
     * @return
     */
    public static String bytesToHex(byte[] bytes) {
        StringBuffer md5str = new StringBuffer();
        //把数组每一字节换成16进制连成md5字符串
        int digital;
        for (int i = 0; i < bytes.length; i++) {
            digital = bytes[i];

            if(digital < 0) {
                digital += 256;
            }
            if(digital < 16){
                md5str.append("0");
            }
            md5str.append(Integer.toHexString(digital));
        }
        return md5str.toString().toUpperCase();
    }

    public static String randomNum(){
        int n = new Random().nextInt(99999999);
        return leftPad(String.valueOf(n),8,"0");
    }

    // 加密
    public static String encodeBase64(byte [] b) {
        return Base64.getUrlEncoder().encodeToString(b).replace("==","");
    }

    // 解密
    public static BigInteger decodeBase64(String s) {
        byte[] b = null;
        if (s != null) {
            Base64.Decoder decoder=Base64.getMimeDecoder();
            try{
                b = decoder.decode(s+"==");
            }catch (Throwable e){
                return null;
            }
            return new BigInteger(b);

        }
        return null;
    }

    public static BigInteger decodeBase64_old(String s) {
        byte[] b = null;
        if (s != null) {
            try {
                b = Base64.getUrlDecoder().decode(s + "==");
            } catch (Throwable var4) {
                return null;
            }

            return new BigInteger(b);
        } else {
            return null;
        }
    }

}
