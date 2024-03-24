package com.bibabo.string;

import com.google.common.base.CaseFormat;
import org.apache.commons.lang3.StringUtils;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/14 19:14
 * @Description
 */
public class UnderLineToCamelTest {

    public static void main(String[] args) {
        String resultStr = CaseFormat.LOWER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, "studentName");
        System.out.println("resultStr = " + resultStr);

        String resultStr2 = CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, "student_name");
        System.out.println("resultStr2 = " + resultStr2);
    }
}
