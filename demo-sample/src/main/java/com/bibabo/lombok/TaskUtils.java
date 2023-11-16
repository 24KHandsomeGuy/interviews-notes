package com.bibabo.lombok;

import java.math.BigInteger;
import java.util.Date;

public class TaskUtils {
    private static BigInteger FACTOR = new BigInteger("909658304568387441771275123419");
    private static final Date DATE_FATOR = new Date(1605253115361L);
    private static final String RANDOM_STR = "98845421";
    public static String encrypt(Integer taskId) throws Exception{
        if(taskId == null || taskId<=0){
            throw new IllegalArgumentException("invalid task Id");
        }
        String t = StringUtil.leftPad(taskId.toString(),7,"0");
        long e = System.currentTimeMillis();
        String r = StringUtil.randomNum();
        StringBuffer s = new StringBuffer();
        s.append(String.valueOf(e));
        s.insert((Math.abs(r.hashCode()%10)),t);
        s.append(r);
        BigInteger m = FACTOR.xor(new BigInteger(s.toString()));
        return StringUtil.encodeBase64(m.toByteArray());
    }

    public static Integer decryptTask(String code){
        if(code == null || "".equals(code)){
            return null;
        }

        BigInteger v = StringUtil.decodeBase64(code.trim());
        if(v == null){ // 做一个新老版本的兼容 wenqi.wu 2022-08-27
            v = StringUtil.decodeBase64_old(code.trim());
        }

        if(v == null){
            return null;
        }

        try{
            v = v.xor(FACTOR);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        String o = StringUtil.leftPad(v.toString(),28,"0");
        int s = Math.abs(String.valueOf(o.substring(20)).hashCode()%10);
        return Integer.valueOf(o.substring(s,s+7));
    }

    public static Date getEncryptDate(String code){
        if(code == null || "".equals(code)){
            return null;
        }
        BigInteger v = StringUtil.decodeBase64(code.trim());
        if(v == null){
            return null;
        }
        try{
            v = v.xor(FACTOR);
        }catch (Exception e){
            return null;
        }
        String o = StringUtil.leftPad(v.toString(),28,"0");
        int s1 = Math.abs(String.valueOf(o.substring(20)).hashCode()%10);

        StringBuffer s = new StringBuffer();
        s.append(o.substring(0,s1));
        s.append(o.substring(s1+7,20));
        return new Date(Long.valueOf(s.toString()));
    }

    /**
     * 固定加密算法，同一个活动ID每次生成的活动ID一样
     * @param taskId
     * @return
     * @throws Exception
     */
    public static String fixedEncrypt(Integer taskId) throws Exception{
        if(taskId == null || taskId<=0){
            throw new IllegalArgumentException("invalid task Id");
        }
        String t = StringUtil.leftPad(taskId.toString(),7,"0");
        long e = DATE_FATOR.getTime();
        String r = RANDOM_STR;
        StringBuffer s = new StringBuffer();
        s.append(String.valueOf(e));
        s.insert((Math.abs(r.hashCode()%10)),t);
        s.append(r);
        BigInteger m = FACTOR.xor(new BigInteger(s.toString()));
        return StringUtil.encodeBase64(m.toByteArray());
    }

    public static void main(String[] args) throws Exception {
        System.out.println(TaskUtils.decryptTask("C35wzR5qFkxz1lB5Ng"));

        System.out.println(TaskUtils.fixedEncrypt(9664433));
    }
}
