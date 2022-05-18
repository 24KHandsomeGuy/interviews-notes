package com.bibabo.spring.annotion.factorybean.project;

import com.bibabo.spring.annotion.factorybean.project.domain.Robot;
import org.springframework.beans.factory.FactoryBean;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/18 11:16
 * @Description:
 */
public class RobotFactoryBean implements FactoryBean<Robot> {
    @Override
    public Robot getObject() throws Exception {
        return new Robot();
    }

    @Override
    public Class<?> getObjectType() {
        return Robot.class;
    }

    @Override
    public boolean isSingleton() {
        return true;
    }
}
