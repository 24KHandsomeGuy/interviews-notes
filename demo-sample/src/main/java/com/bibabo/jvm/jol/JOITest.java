package com.bibabo.jvm.jol;

import org.openjdk.jol.info.ClassLayout;
import org.openjdk.jol.info.GraphLayout;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/10/25 19:49
 * @Description
 */
public class JOITest {

    public static void main(String[] args) {
        JOIObject joiObject = new JOIObject();
        joiObject.setId(10086L);
        joiObject.setDecorationPageId(10010L);
        joiObject.setDecorationLayoutId(10011L);
        joiObject.setDisplayType(1);
        joiObject.setForwardType(2);
        joiObject.setName("asdddddsssssaw3");
        joiObject.setPropertiesVo(new DecorationLayoutPositionPropertiesVo());
        System.out.println(ClassLayout.parseInstance(joiObject).toPrintable());// 查看对象结构
        System.out.println(GraphLayout.parseInstance(joiObject).toPrintable());// 查看对象外部信息：包括引用的对象
        System.out.println(GraphLayout.parseInstance(joiObject).totalSize());// 打印对象总大小
    }
}
