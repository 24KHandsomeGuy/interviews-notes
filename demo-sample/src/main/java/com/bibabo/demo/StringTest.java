package com.bibabo.demo;


import java.io.UnsupportedEncodingException;

/**
 * @author fukuixiang
 * @date 2020/11/26
 * @time 11:49
 * @description
 */
public class StringTest {

    public static void main(String[] args) throws UnsupportedEncodingException {

        String dml = "INSERT INTO `oms_db`.`oms_order_retry_front` (`id`, `order_id`, `type`, `process_status`, `create_date`, `update_date`, `catch_date`, `msg_type`) VALUES (NULL, '172437948', '7', '0', NOW(), NOW(), NOW(), '0');";
        String upperClause = dml.toUpperCase();
        if((upperClause.contains("DELETE") || upperClause.contains("UPDATE")) && !upperClause.contains("WHERE")){
            System.out.println("修改数据库服务：sql语句存在非法行为");
        }

        String url = "sign=4a8f590b2820530af715afa4c245e585&_input_charset=UTF-8&request_param=%7B%22extend_param%22%3A%22%22%2C%22parent_channel%22%3A%22ALIPAY_M%22%2C%22notify_param%22%3A%22notify_type%26_%26batch_refund_notify%24_%24notify_time%26_%262022-09-27+11%3A04%3A12%24_%24batch_no%26_%26202209271045000696137769947%24_%24success_num%26_%260%24_%24sign%26_%2693cb3b3374d42d5d06c72e606ea36170%24_%24sign_type%26_%26MD5%24_%24result_details%26_%262022061922001477301408313145%5E19.00%5ETRADE_HAS_FINISHED%24_%24notify_id%26_%262022092700222105003066621426986194%22%7D&sign_type=MD5&service=clearing.normal.channel.refund.notify.verify&partner=1300000004&return_type=json";
        System.out.println(new String(url.getBytes(), "gbk"));
    }

    public final String tes() {
        return "";
    }

    public static class SubStringTest extends StringTest{


    }

}
