package com.sc.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LoggerAspectAop {
    @Pointcut("execution(* com.sc.service.impl.*.*(..))")
    public void pc(){}
    @Around("pc()")
    public Object around(ProceedingJoinPoint jp){
        Object result=null;
        try {
            System.out.println("前置通知");
            result = jp.proceed();
            System.out.println("后置通知");
        } catch (Throwable throwable) {
            System.out.println("异常通知");
            throwable.printStackTrace();
        } finally {
            System.out.println("最后通知");
        }
        return result;
    }

}
