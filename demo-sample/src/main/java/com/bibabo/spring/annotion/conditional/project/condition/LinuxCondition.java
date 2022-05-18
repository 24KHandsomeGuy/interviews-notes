package com.bibabo.spring.annotion.conditional.project.condition;

import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.env.Environment;
import org.springframework.core.type.AnnotatedTypeMetadata;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * @Author: Damon Fu
 * @Date: 2022/5/17 22:40
 * @Description:
 */
public class LinuxCondition implements Condition {

    @Override
    public boolean matches(ConditionContext conditionContext, AnnotatedTypeMetadata annotatedTypeMetadata) {
        AtomicBoolean matchesFlag = new AtomicBoolean(false);

        Environment environment = conditionContext.getEnvironment();
        String osName = environment.getProperty("os.name");
        System.out.println(osName);
        Optional.ofNullable(osName).ifPresent(str -> {
            if (str.contains("Linux")) {
                matchesFlag.set(true);
            }
        });
        return matchesFlag.get();
    }
}
