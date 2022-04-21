package com.bibabo.serverless;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import java.text.SimpleDateFormat;
import java.util.Random;

/**
 * @author fukuixiang
 * @date 2021/4/1
 * @time 14:03
 * @description
 */
public class HelloServerless {

    // 以下是GetWay API网关所需要的
    private static String json = "{\"isBase64Encoded\": false,\"statusCode\": 200,\"headers\": {\"Content-Type\":\"application/json;charset=utf-8\"},\"body\": ";

    //private static String json = "{\"isBase64Encoded\": false,\"statusCode\": 200,\"headers\": {\"Content-Type\":\"text/html\"},\"body\": \"<html><body><h1>Heading</h1><p>Paragraph.</p></body></html>\"}";

    public static void main(String[] args) throws JsonProcessingException {

        System.out.println(new HelloServerless().sayHelloToServerless("1"));
    }

    public String sayHelloToServerless(String name) throws JsonProcessingException {

        System.out.println("HelloServerless:" + name);

        int randomId = new Random().nextInt(1000);
        //String msg = "\"" + "HelloServerless:" + name + ",id:" + randomId + "\"";
        Resp resp = new Resp(randomId, name, "HelloServerless:" + name + ",id:" + randomId);

        ObjectMapper objectMapper = new ObjectMapper();
        // 设置输出包含的属性
        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        // 设置输入时忽略JSON字符串中存在而Java对象实际没有的属性
        objectMapper.configure(
                DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        objectMapper.configure(DeserializationFeature.FAIL_ON_NULL_FOR_PRIMITIVES, false);
        objectMapper.configure(SerializationFeature.WRITE_DATE_KEYS_AS_TIMESTAMPS, false);
        objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));

        String respResult = objectMapper.writeValueAsString(resp);

        return json + respResult + "}";
        //return json;
    }

}
