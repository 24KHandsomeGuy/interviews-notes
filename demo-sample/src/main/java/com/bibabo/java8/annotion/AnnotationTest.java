package com.bibabo.java8.annotion;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/18 22:29
 * @Description:
 */
public class AnnotationTest {

    public static void main(String[] args) throws ClassNotFoundException, NoSuchMethodException {
        Class<World> clazz = (Class<World>) new World().getClass();
        System.out.println(clazz.getAnnotation(MyAnnotation.class));
        /*System.out.println(clazz.getAnnotation(MySuperAnnotation.class));
        System.out.println(clazz.getAnnotationsByType(MySuperAnnotation.class).length);
        System.out.println(clazz.getAnnotations().length);
        System.out.println(clazz.getDeclaredAnnotations().length);
        System.out.println(clazz.getAnnotation(MyAnnotation.class));*/
        /*Class<MyAnnotation> clazz2 = MyAnnotation.class;
        System.out.println(clazz2.getAnnotation(MySuperAnnotation.class));*/
        // System.out.println(clazz.getAnnotation(MyAnnotation.class).getClass().getAnnotation(MySuperAnnotation.class));

        // System.out.println(clazz.getAnnotation(MyAnnotation.class).value());

        System.out.println(clazz.getDeclaredMethod("sayHello").getAnnotation(MyAnnotation.class).value());
    }
}
