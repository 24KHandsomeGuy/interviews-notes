package com.bibabo.realtime.task.utils;

import io.debezium.util.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 21:15
 * @Description
 */
public class CryptUtil {

    private static final Logger logger = LoggerFactory.getLogger(CryptUtil.class);
    private static final String Algorithm = "DESede";
    public static final String DefaultSuffixStr = "A553E3781471225A";//加密后缀字符串
    private static final String DefaultKey = "9A1F1906F01AF0A151A384D78EBD84D5F2C531ABEC723927";//加密后缀字符串

    private static byte[] encryptMode(byte[] keybyte, byte[] src) {
        try {
            SecretKey deskey = new SecretKeySpec(keybyte, Algorithm);
            Cipher c1 = Cipher.getInstance(Algorithm);
            c1.init(Cipher.ENCRYPT_MODE, deskey);
            return c1.doFinal(src);
        } catch (Exception e) {
            logger.error(e.toString());
        }
        return null;
    }

    private static byte[] decryptMode(byte[] keybyte, byte[] src) {
        try {
            SecretKey deskey = new SecretKeySpec(keybyte, Algorithm);
            Cipher c1 = Cipher.getInstance(Algorithm);
            c1.init(Cipher.DECRYPT_MODE, deskey);
            return c1.doFinal(src);
        } catch (Exception e) {
            logger.error(e.toString());
        }
        return null;
    }

    public static String encrypt(String src, String key) {
        key = key == null ? DefaultKey : key;
        return getHexString(Encrypt(src.getBytes(), key));
    }

    public static String decrypt(String src, String key) {
        key = key == null ? DefaultKey : key;
        if (src == null || src.length() % 16 != 0) {
            return "";
        }
        byte[] decrypt = Decrypt(src, key);
        try {
            return new String(decrypt, "utf-8");
        } catch (UnsupportedEncodingException e) {
            logger.error(e.toString());
        }
        return "";
    }

    private static byte[] Encrypt(byte[] src, String key) {
        byte[] keybyte = getBytes(key, key.length());
        return encryptMode(keybyte, src);
    }

    private static byte[] Decrypt(byte[] src, String key) {
        byte[] keybyte = getBytes(key, key.length());
        return decryptMode(keybyte, src);
    }

    private static byte[] Decrypt(String src, String key) {
        return Decrypt(getBytes(src, src.length()), key);
    }

    private static byte[] getBytes(String key, int len) {
        char[] keys = key.toCharArray();
        byte[] buffer = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            buffer[i / 2] = (byte) (ToHexValue(keys[i], true) + ToHexValue(keys[i + 1], false));
        }
        return buffer;
    }

    private static String getHexString(byte[] b) {
        String hs = "";
        String stmp = "";
        if (b == null) return null;
        for (int n = 0; n < b.length; n++) {
            stmp = (Integer.toHexString(b[n] & 0XFF));
            if (stmp.length() == 1) hs = hs + "0" + stmp;
            else hs = hs + stmp;
        }
        return hs.toUpperCase();
    }

    private static byte ToHexValue(char c, boolean high) {
        byte num;
        if ((c >= '0') && (c <= '9')) {
            num = (byte) (c - '0');
        } else if ((c >= 'a') && (c <= 'f')) {
            num = (byte) ((c - 'a') + 10);
        } else {
            if ((c < 'A') || (c > 'F')) {
                throw new RuntimeException();
            }
            num = (byte) ((c - 'A') + 10);
        }
        if (high) {
            num = (byte) (num << 4);
        }
        return num;
    }

    /**
     * 根据用户code 生成 key
     *
     * @param ucode
     * @return
     */
    public static String createKeyWithUserCode(String ucode) {
        if (!Strings.isNullOrEmpty(ucode)) {
            ucode = ucode + System.currentTimeMillis();
            String key = MD5Digester.getInstance().digest(ucode).toUpperCase() + DefaultSuffixStr;
            return key;
        }
        return null;
    }

    /**
     * 根据str 生成 key
     *
     * @param str
     * @return
     */
    public static String createKeyWithStr(String str) {
        if (!Strings.isNullOrEmpty(str)) {
            String key = MD5Digester.getInstance().digest(str).toUpperCase() + DefaultSuffixStr;
            return key;
        }
        return null;
    }

    public static String encrypt(String val) {
        if (!Strings.isNullOrEmpty(val)) {
            return CryptUtil.encrypt(val, DefaultKey);
        }
        return null;
    }

    public static String decrypt(String val) {
        if (!Strings.isNullOrEmpty(val)) {
            return CryptUtil.decrypt(val, DefaultKey);
        }
        return null;
    }

    public static String decryptWithCatch(String val) {
        try {
            return decrypt(val);
        } catch (Exception e) {
            logger.error(e.toString());
        }
        return null;
    }

    /**
     * 根据key 生成秘钥
     *
     * @param key
     * @return
     */
    public static String createSecretWithKey(String key, String src) {
        return CryptUtil.encrypt(src, key);
    }

    public static void main(String[] args) {
        System.out.println(encrypt("Adminpass1", null));
        String keyx = MD5Digester.getInstance().digest("123").toUpperCase() + DefaultSuffixStr;
        System.out.println(encrypt("kminer", keyx));
        String key = createKeyWithUserCode("arktidbinfo");
        String src = UUID.randomUUID().toString();
        System.out.println("src is " + src);
        System.out.println("key is " + key);
        String secretKey = createSecretWithKey(key, src);
        System.out.println("secretKey is " + secretKey);
        boolean auth = false;
        try {
            String result = decrypt(secretKey, key);
            System.out.println("decrypt result :" + result);
            System.out.println(src.equals(result));
            if (!Strings.isNullOrEmpty(result) && result.length() > 0) {
                auth = true;
            }
        } catch (Exception e) {
            auth = false;
        }
        System.out.println("decrypt result :" + auth);
    }
}
